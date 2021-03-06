{$R-}                           { wegen array [0..0] }
program sdir;
uses dos;                       { f�r registers, intr, FindFirst etc. }
type PosType = record
       X, Y: word;              { f�r die Position des virtuellen Cursors }
     end;

     AScrChar = record
       Ascii, Attr: char;       { ein Zeichen im Bildspeicher }
     end;

     PScrBuf = ^AScrBuf;                { Zeiger auf Bildspeichertyp }
     AScrBuf = array[0..0] of AScrChar; { Bildspeichertyp }

     ScrollMode = (Hard, Soft);         { f�r �Scroll� }

var CurPos: PosType;    { momentane Schreipposition im Bildspeicher }
    ScrollPos,          { Position der ersten dargestellten Zeile }
    MaxScrollPos,       { maximale Scrollposition }
    LastLine: integer;  { letzte darzustellende Zeile }
    Taste: word;        { ein Tastendruck }
    Wildcard: PathStr;  { die Suchmaske }
    TBuf: PScrBuf;      { ein Tempor�rpuffer }
    ExitSave: pointer;  { f�r Exitroutine }
                                    { BIOS-Variablen im Segment $40: }
    CRTC: word absolute $40:$63;    { Portadresse des CRTC-Indexregisters }
    ScrAddr: word absolute $40:$4E; { Startadresse der aktiven Bildseite }
    ScrWidth: word absolute $40:$4A;    { Zeichen Pro Zeile }
    ScrLines: byte absolute $40:$84;    { Zeilen pro Bildschirm - 1 }
    CharSize: integer absolute $40:$85; { Scanzeilen pro Zeichen }

const
    ScreenBase: word = $B800;   { Basisadresse (Segment) Bildspeicher }
    BufSize: longint = $8000;   { gr��e Bildspeicher }
    taUp       = $4800;         { Konstanten f�r Tasten }
    taDn       = $5000;
    taPgUp     = $4900;
    taPgDn     = $5100;
    taPos1     = $4700;
    taEnde     = $4F00;
    taShftUp   = $48FF;         { mit Shift erweitert um $ff im Lo-Byte }
    taShftDn   = $50FF;
    taShftPgUp = $49FF;
    taShftPgDn = $51FF;
    taShftPos1 = $47FF;
    taShftEnde = $4FFF;

{ Allgemeine Routinen: BIOS-Funktionen }

procedure CursorOff;    { schaltet den BIOS-Cursor aus }
var Regs: Registers;
begin
  with Regs do
  begin
    AH:= 1;             { Funktion 1: Cursorcharakteristik einstellen }
    CX:= $3030;         { Start- und Endscanzeile jeweils auf $30 }
    intr($10, Regs)
  end;
end;

procedure VideoMode(Mode: byte);  { Modus setzen }
var Regs: registers;
begin
  Regs.AX:= Mode;               { AH = 0, AL = Modus }
  intr($10, Regs);
end;

procedure SetCursor(X,Y: byte); { Positioniert den BIOS-Cursor }
var Regs: registers;
begin
  with Regs do
  begin
    AH:= 2;             { Funktion 2: Curserposition setzen }
    BH:= 0;             { Bildseite 0 }
    DL:= X-1;           { links oben ist (0,0) }
    DH:= Y-1;
    Intr($10, Regs);
  end;
end;

function IsVga: boolean;	{ haben wir VGA }
var Regs: registers;
begin
  with Regs do
  begin
    AX:= $1A00; 		{ Display Combination abfragen }
    Intr($10, Regs);
    IsVga:= (AL = $1A); 	{ g�ltiger Aufruf }
  end;
end;

function GetKey: word;                  { Tasteneingabe lesen }
var Regs: Registers;
    ShiftState: byte absolute $40:$17;	{ Shift etc. Status im BIOS-RAM }
begin
  Regs.AX:= 0;				{ Funktion 0: Zeichen holen }
  intr($16, Regs);			{ Interrupt 16 }
  if (ShiftState and 3 <> 0) and        { Shift gedr�ckt ? }
     (Regs.AL = 0) then                 { und Funktionstaste ? }
    Regs.AL:= $FF;                      { dann $FF anh�ngen }
  GetKey:= Regs.AX;			{ Code commt in AX }
end;

function KeyPressed: boolean;           { Taste gedr�ckt }
var
  ChainStart:  word absolute $40:$1A;	{ Beginn des Pufferinhalts }
  ChainEnd:    word absolute $40:$1C;	{ Beginn des freien Bereichs }
begin
  KeyPressed:= ChainStart <> ChainEnd;  { was dazwischen: erwartet Abholung }
end;

{ VGA-Dienstroutinen f�r virtuellen Bildschirm }

procedure WaitVRetrace; { Wartet auf Beginn des vertikalen Strahlr�cklaufs }
begin
  repeat until (Port[CRTC+6] and $08) = 0; { Beginn Display-Periode abwarten }
  repeat until (Port[CRTC+6] and $08) > 0; { Ende Display-Periode abwarten }
end;

procedure WaitDisplay; { Wartet auf den Beginn der n�chsten Display-Periode }
begin
  repeat until (Port[CRTC+6] and $08) > 0; { Ende Display-Periode abwarten }
  repeat until (Port[CRTC+6] and $08) = 0; { Beginn Display-Periode abwarten }
end;

procedure SetScreenBase(Base: word);    { setzt das VGA-Bildspeicher-Segment }
var mb: byte;
begin
  case Base div $100 of         { eine von drei M�glichkeiten }
    $A0: mb:= 1 shl 2;
    $B0: mb:= 2 shl 2;
    $B8: mb:= 3 shl 2;
  else
    exit;                       { falls nicht: sonst raus }
  end;
  port[$3CE]:= 6;               { Index Miscellaneous Register }
  port[$3CF]:= (port[$3CF]              { Register lesen }
                and not (3 shl 2))      { Bits wegmaskieren }
                or mb;                  { und neu setzen }
  ScreenBase:= Base;                    { Segment merken }
  BufSize:= (((Base + $1000)            { Speichergr��e berechnen: aufrunden }
               div $1000)               {  auf $1000-Grenze }
               * $1000 - Base)          { original subtrahieren ergibt }
               * longint(16);           { Gr��e in Paragraphs (je 16 Byte) }
end;

procedure PresetRowScan(Row: Byte);
{ Bestimmt die 1. Scanzeile f�r den Bildaufbau in den Textmodi }
begin
  Port[CRTC] := $08;
  Port[CRTC+1] := Row;
end;

procedure SetStartAddr(Addr: Word); {  Setzt die Startaddresse }
begin
  Port[CRTC] := $0C;          { Index f�r Start Address High }
  Port[CRTC+1] := Hi(Addr);   { mit Highbyte laden }
  Port[CRTC] := $0D;          { Index f�r Start Address Low }
  Port[CRTC+1] := Lo(Addr);   { mit Lowbyte laden }
  ScrAddr := Addr;            { Update der BIOS-Variablen }
end;

procedure SetCursorPos(Pos: Word); {  Setzt die Startaddresse }
begin
  Port[CRTC] := $0E;          { Index f�r Cursor Address High }
  Port[CRTC+1] := Hi(Pos);    { mit Highbyte laden }
  Port[CRTC] := $0F;          { Index f�r Cursor Address Low }
  Port[CRTC+1] := Lo(Pos);    { mit Lowbyte laden }
                              { kein Update der BIOS-Variablen, zu klein! }
end;


procedure VGASplitLine(ScanLine: Word); { Setzt den Line Compare Wert (VGA) }
begin
  Port[CRTC] := $18;            { Index f�r Line Compare Register }
  Port[CRTC+1] := Lo(Scanline); { Lowbyte laden }
  Port[CRTC] := $07;            { Index: Overflow Register }
  if (ScanLine and $100) > 0 then             { Line Compare-Bit 8 = 1 }
    Port[CRTC+1] := Port[CRTC+1] or $10       {  also Overflow-Bit 4 setzen }
  else                                        { Line Compare-Bit 8 = 0 }
    Port[CRTC+1] := Port[CRTC+1] and not $10; {  also Overflow-Bit 4 l�schen }
  Port[CRTC] := $09;                    { Index: Maximum Scanline Register }
  if (ScanLine and $200) > 0 then       { Line Compare-Bit 9 = 1 }
    Port[CRTC+1] := Port[CRTC+1] or $40 {  also Max. Scanline-Bit 6 setzen }
  else                                  { Line Compare-Bit 9 = 0 }
    Port[CRTC+1] := Port[CRTC+1] and not $40; { Max. Scanline-Bit 6  l�schen }
end;

{ Ausgabe auf dem virtuellen Bildschirm }

procedure GoToXY(X,Y: word);    { positioniert den virtuellen Cursor }
begin
  CurPos.X:= X-1;               { �hnlich CRT: links oben ist (X,Y) = (1,1) }
  CurPos.Y:= Y-1;               { intern ist links oben (0,0) }
  SetCursorPos(CurPos.Y * ScrWidth + CurPos.X); { und Position setzen }
end;

procedure ClrBuf;               { l�scht den gesamten Bildspeicher }
var i: integer;
begin
  for i:= 0 to (BufSize div 2) - 1 do           { ganzen Bildspeicher }
   with PScrBuf(ptr(ScreenBase, 0))^[i] do      { huh, Pointerjonglieren }
    begin
      Ascii:= ' ';              { Leerzeichen }
      Attr:= #$07;              { hellgrau auf schwarz }
    end;
end;

procedure DWrite(S: string);    { schreibt direkt in den Bildspeicher }
var ScrBuf: PScrBuf;
    i: integer;
begin
  with CurPos do                { ab virtuellem Cusor }
  begin
    ScrBuf:= ptr(ScreenBase,(Y * ScrWidth + X) * 2); { Zeiger konstruieren }
    for i:= 1 to length(S) do           { und String einf�llen }
      ScrBuf^[i-1].Ascii:= S[i];        { immer ins Zeichenbyte }
    inc(X, length(S));                  { Cursor weiter }
    inc(Y, X div ScrWidth);             { �ber Ende rausgeschrieben? }
    X:= X mod ScrWidth;                 { Cursor anpassen }
  end;
end;

procedure DWriteLn(S: string);  { Schreibt und l�scht restliche Zeile }
var ScrBuf: PScrBuf;
    i: integer;
begin
  DWrite(S);            { erstmal schreiben }
  with CurPos do
  begin
    ScrBuf:= ptr(ScreenBase,(Y * ScrWidth) * 2); { neue Position adressieren }
    for i:= X+1 to ScrWidth do             { und ab da bis nach rechts }
      ScrBuf^[i].Ascii:= ' ';              {  Leerzeichen einf�llen }
    inc(Y);                                { Zeile weiter }
    X:= 0;                                 { dort an Anfang }
  end;
end;

procedure DAttr(S: string); { f�llt Attribute in Bildspeicher (Cursor bleibt) }
var ScrBuf: PScrBuf;
    i: integer;
begin
  with CurPos do
    ScrBuf:= ptr(ScreenBase,(Y * ScrWidth + X) * 2); { Adressieren }
  for i:= 1 to length(S) do
    ScrBuf^[i-1].Attr:= S[i];   { und einf�llen }
end;

{ Vermischtes }

procedure Scroll(Mode: ScrollMode; n: integer);
{ Scrollt in einem virtuellen Bildschirm }
var i,j: Integer;
begin
  if ScrollPos + n < 0 then             { nach oben begrenzen }
    n:= -ScrollPos;
  if ScrollPos + n > MaxScrollPos then  { nach unten begrenzen }
    n:= MaxScrollPos - ScrollPos;
  if Mode = Hard then                   { Hartes Scrollen ? }
  begin
    SetStartAddr(ScrAddr + n * ScrWidth); { Neue Startadresse setzen }
    inc(ScrollPos, n);                  { und merken.. gen�gt }
  end else                              { Soft ist aufwendiger }
    if n < 0 then                       { nach oben: }
      for i := 1 TO -n do               { Zeile f�r Zeile }
      begin
        if keypressed then exit;        { jemand ungeduldig ? }
        WaitDisplay;                      { Bildaufbau abwarten }
        SetStartAddr(ScrAddr - ScrWidth); { Startadresse eine Zeile vorher }
        for j := CharSize-1 downto 0 do   { und die einzelnen Scanzeilen }
        begin
          WaitVRetrace;                 { auf Strahlr�cklauf warten }
          PresetRowScan(j);             { Start-Scanzeile setzen }
        end;
        dec(ScrollPos);                 { Position merken }
      end
    else                                { nach unten: }
      for i := 1 TO n do
      begin
        if keypressed then exit;        { anders entschieden ? }
        for j := 1 TO CharSize-1 do     { hier andere Richtung }
        begin
          WaitVRetrace;                 { aber auch warten }
          PresetRowScan(j);             { und Scanzeile setzen }
        end;
        SetStartAddr(ScrAddr + ScrWidth); { und danach Startadresse weiter }
        WaitVRetrace;                   { wirkt erst beim n�chsten VRetrace! }
        PresetRowScan(0);               { dann Scanzeile 0 setzen }
        inc(ScrollPos);                 { und merken }
      end;
end;

procedure WriteIntro;
var AttrStr: string[80];
begin
  fillchar(AttrStr[1], 80, $17); { Attributstring f�llen: Hellgrau auf Blau }
  AttrStr[0]:= #80;              { L�ngenbyte nicht vergessen }
  GotoXY(1,1);                   { an Anfang }
  DAttr(AttrStr);                { Attribute einf�llen }
  DWriteLn(' Rollen: ['#24' '#25']: Zeile, [Bild'#24'] [Bild'#25']: Seite, [Pos1]: Anfang, [Ende]: Ende' );
  DAttr(AttrStr);
  DWriteLn(' in Verbindung mit [Shift] wird "Hart" gerollt. [Enter], [Esc]: Programmende');
  DAttr(AttrStr);
  DWriteLn(' SoftDir - Sch�nere Verzeichnisausgabe. (c) Erik Krause, Freiburg `94');
  DAttr(AttrStr);
  DWriteLn(' Beispielprogramm zum Artikel WEICH UND VIRTUELL aus DOS-Trend');
end;

procedure WriteHelp;
var AttrStr: string[80];
begin
  fillchar(AttrStr[1], 80, $4F); { Attrubute: Wei� auf Rot }
  AttrStr[0]:= #80;              { L�ngenbyte }
  DAttr(AttrStr);
  DWriteLn('  Keine Dateien entsprechend der Maske:');
  DAttr(AttrStr);
  DWriteLn('  `' + WildCard + '` gefunden!');
  DAttr(AttrStr);
  DWriteLn('  Aufruf: SDIR [Dateimaske]');
  DAttr(AttrStr);
  DWriteLn('          [Dateimaske] kann die �blichen Jokerzeichen (*, ?) enthalten.');
  DAttr(AttrStr);
  DWriteLn('          Wird [Dateimaske] weggelassen, verwendet das Programm:  `*.*`');
  LastLine:= 9;
end;

procedure ReadDirectory(WildC: PathStr); { liest und listet Verzeichnisinhalt }
var
  DirInfo: SearchRec;   { f�r FindFirst, FindNext }
  D: DirStr;            { f�r FSplit }
  N: NameStr;
  E: ExtStr;
  SSize, SDay: string[10];      { wir brauchen Strings }
  dt: DateTime;                 { f�r UnpackTime }
  AttrStr: string[40];          { f�r den Bildspeicher }

  function ZeroFill(w : Word) : String;   { f�llt f�hrende Nullen ein }
  var s : String;
  begin
    Str(w:0,s);
    if Length(s) = 1 then
      s := '0' + s;
    ZeroFill:= s;
  end;

  function BlankFill(S: string; Len: byte): string; { f�llt Leerzeichen auf }
  var TS: string;
      i: integer;
  begin
    TS:= S;
    for i:= length(S)+1 to Len do
      TS:= TS + ' ';
    BlankFill:= TS;
  end;

begin
  AttrStr[0]:= #40;               { Attributstring: halber Bildschirm }
  fillchar(AttrStr[1], 40, $70);  { erst ein bischen Schwarz auf Hellgrau }
  fillchar(AttrStr[16], 9, $71);  { dann Blau auf Hellgrau }
  fillchar(AttrStr[25], 9, $74);  { schlie�lich Rot auf Hellgrau }
  fillchar(AttrStr[34], 6, $75);  { und ein bischen Magenta auf Hellgrau }
  FindFirst(WildC, Archive, DirInfo);   { und los geht die Suche }
  while DosError = 0 do with DirInfo do { bis nichts mehr da ist }
  begin
    FSplit(Name, D, N, E);              { Name zerlegen }
    if E <> '' then E[1]:= ' ';         { Punkt von Endung weg }
    UnpackTime(Time,dt);                { Zeit auspacken }
    with dt do
    begin
      str(Size:8, SSize);       { Strings richtiger L�nge basteln }
      str(Day:2, SDay);
      DAttr(AttrStr);           { Attribute einf�llen }
      DWrite(' '+               { Schreiben }
              BlankFill(N,9)+ BlankFill(E,5)+
              SSize+' '+ SDay+'.'+
              ZeroFill(Month)+'.'+
              ZeroFill(Year mod 100)+' '+
              ZeroFill(hour)+':'+
              ZeroFill(min)+'  ');
    end;
    FindNext(DirInfo);          { n�chstes suchen }
    LastLine:= CurPos.Y;        { Anzahl Zeilen merken }
    if LastLine * ScrWidth > BufSize - ScrWidth then { vorsicht Speichergr��e! }
    begin
      gotoXY(19,1);
      fillchar(AttrStr[1], 40, $4F);    { Attribut: Wei� auf Rot }
      DAttr(AttrStr);
      DWrite(' Zu viele Dateien!   beliebige Taste... ');
      if GetKey = 0 then ;              { Dummy-Abfrage }
      DosError:= 18;                    { "Keine Datein mehr" vort�uschen }
      WriteIntro;                       { Meldung �berschreiben }
    end;
  end;
  if Curpos.X > 0 then
  begin
    DAttr(AttrStr);  { eventuelle halbe Zeile f�llen }
    inc(LastLine);   { n�chste Zeile }
  end;
end;

{$F+}
procedure VideoReset;   { Exitroutine falls was schief geht }
begin                   { setzt Video normal }
  ExitProc:= ExitSave;  { erstmal alte Exitroutine einsetzen }
  SetScreenBase($B800); { normale Adresse setzen }
  VGASplitLine(1023);   { kein Splitting mehr }
  SetStartAddr(0);      { und Startadresse 0 }
  VideoMode(3);         { VGA: 80x25 farbig }
end;
{$F-}

procedure CopyBack;
{ kopiert den interessanten Teil in den normalen Bildspeicher }
var BSize, Lines: word;
begin
  dec(LastLine, 2);                     { 2 weniger }
  if LastLine - ScrollPos <= 23 then    { ist's vom Ende ? }
    Lines:= LastLine - ScrollPos        { dann nur die restlichen Zeilen }
  else
    Lines:= 23;                         { sonst 23 }
  BSize:= Lines*ScrWidth*2;             { Puffergr��e berechnen }
  getmem(TBuf, BSize);                          { Speicher belegen }
  move(ptr(ScreenBase, ScrAddr*2)^, TBuf^, BSize); { Bereich sichern }
  ClrBuf;                               { Sonderbereich l�schen }
  VideoReset;                           { Video wieder normal }
  move(TBuf^, ptr(ScreenBase, 0)^, BSize); { Bereich zur�ckkopieren }
  SetCursor(1, Lines);                  { Cursor in letzte Zeile }
  freemem(TBuf, BSize);                 { und Speicher freigeben }
end;

begin
  if not IsVGA then
  begin
    writeln('Sorry, Softscrolling ist leider nur auf VGA-Karten m�glich...');
    halt(1);
  end;
  if ParamCount > 0 then        { Parameter holen }
    Wildcard:= ParamStr(1)
  else
    WildCard:= '*.*';           { oder annehmen }
  if not (WildCard[1] in ['/','-']) and { kein /H oder �hnliches }
     ((pos(':', WildCard) <> 0) or      { evtl. Verzeichnisangabe }
      (pos('\', WildCard) <> 0)) then
  begin
    if (pos('*', WildCard) = 0) and     { aber keine Jokerzeichen }
       (pos('?', WildCard) = 0) then
    begin
      if WildCard[length(Wildcard)] in [':','\'] then 
        WildCard:= WildCard + '*.*'     { vollst�ndige Verzeichnisangabe }
      else
        WildCard:= WildCard + '\*.*';   { nein, unvollst�ndig }
    end;
  end;
  VideoMode(3);                         { VGA: 80x25 farbig }
  CursorOff;
  SetScreenBase($A000);                 { da ist mehr Platz }
  ExitSave:= ExitProc;
  ExitProc:= @VideoReset;
  ClrBuf;                               { Bildspeicher l�schen }
  VGASplitLine(23 * CharSize);          { Split bei Zeile 23 }
  SetStartAddr(ScrWidth*2);             { dort kommen die ersten beiden hin }
  WriteIntro;                           { Meldung ausgeben }
  ReadDirectory(Wildcard);              { Verzeichnis auflisten }
  if LastLine = 0 then                  { was da? }
    WriteHelp;                          { nein: Hilfe ausgeben }
  if LastLine > 24 then                 { mehr als 24 Zeilen ? }
    MaxScrollPos:= LastLine - 24        { dann kann gescrollt werden }
  else MaxScrollPos:= 2;                { weniger: nur zwei Zeilen }
  ScrollPos:= 0;                        { Start bei 0 }
  repeat
    Taste:= GetKey;                     { will wer was ? }
    case Taste of                       { ok, tun wir was }
      taUp:       Scroll(Soft, -1);
      taDn:       Scroll(Soft, 1);
      taPgUp:     Scroll(Soft, -22);
      taPgDn:     Scroll(Soft, 22);
      taPos1:     Scroll(Soft, -1000);
      taEnde:     Scroll(Soft, 1000);
      taShftUp:   Scroll(Hard, -1);
      taShftDn:   Scroll(Hard, 1);
      taShftPgUp: Scroll(Hard, -22);
      taShftPgDn: Scroll(Hard, 22);
      taShftPos1: Scroll(Hard, -1000);
      taShftEnde: Scroll(Hard, 1000);
    end;
  until (Taste = $1C0D) or (Taste = $011B) or
        (Taste = $2D00);                  { bis Enter oder Esc oder Alt-X }
  CopyBack;                               { DOS-Bildschirm wieder herstellen }
end.
