{**********************************************************************}
{*                      N E T F I L E P . P A S                       *}
{*--------------------------------------------------------------------*}
{*    Aufgabe       : Stellt verschiedene Prozeduren und Funktionen   *}
{*                    zur Netzwerkprogrammierung unter DOS bereit     *}
{*--------------------------------------------------------------------*}
{*    Autor         : Michael Tischer                                 *}
{*    entwickelt am : 10.02.1992                                      *}
{*    letztes Update: 13.02.1991                                      *}
{**********************************************************************}

unit NetFileP;

interface

uses Crt, Dos;                   { die Crt- und die DOS-Unit einbinden }

const {-- Arten des Dateizugriffs -------------------------------------}

      FM_R    = 0;                                         { Nur Lesen }
      FM_W    = 1;                                     { Nur Schreiben }
      FM_RW   = 2;         { Normaler Pascal-Modus Lesen und Schreiben }

      {-- Arten des Dateischutzes -------------------------------------}

      SM_COMP = $00;     { Kompatibilit�tsmodus, kein Schutz der Datei }
      SM_RW   = $10;       { Lesen und Schreiben durch Andere verboten }
      SM_R    = $20;  { Lesen durch Andere erlaubt, Schreiben verboten }
      SM_W    = $30;  { Lesen durch Andere verboten, Schreiben erlaubt }
      SM_NO   = $40;          { Alles erlaubt, Schutz �ber Record-Lock }

      {-- M�gliche Fehler bei Aufruf der Prozeduren -------------------}

      NE_OK            = $00;                            { Kein Fehler }
      NE_FileNotFound  = $02;           { Fehler: Datei nicht gefunden }
      NE_PathNotFound  = $03;            { Fehler: Pfad nicht gefunden }
      NE_TooManyFiles  = $04;        { Fehler: zu viele offene Dateien }
      NE_AccessDenied  = $05;   { Fehler: Zugriff auf Datei verweigert }
      NE_InvalidHandle = $06;           { Fehler: Dateihandle ung�ltig }
      NE_AccessCode    = $07;         { Fehler: Zugriffsart unzul�ssig }
      NE_Share         = $20;            { Verletzung der Share-Rechte }
      NE_Lock          = $21; { Fehler beim (Ent)sperren eines Records }
      NE_ShareBuffer   = $24;               { Puffer�berlauf bei Share }

var NetError : integer;             { Fehlernummer nach DOS-Interrupts }

function ShareInst : boolean;                    { Share instralliert? }

function NetErrorMsg( Nummer : word ) : string;        { Fehlermeldung }

procedure NetReset(     DName  : string;              { Datei er�ffnen }
                        Modus  : integer;
                        RecS   : word;
                    var Datei );

procedure NetRewrite(     DName  : string;       { Neue Datei er�ffnen }
                          Modus  : integer;
                          RecS   : word;
                      var Datei );

procedure NetClose( var Datei );                    { Datei schliessen }

function NetLock( var Datei;             { Bereich einer Datei sperren }
                      RecNo  : longint;
                      Anzahl : longint ) : boolean;

function NetUnlock( var Datei;         { Bereich einer Datei freigeben }
                        RecNo  : longint;
                        Anzahl : longint ) : boolean;

function Is_NetOpen( var Datei ) : boolean;          { Datei ge�ffnet? }

function Is_NetWriteOk( var Datei ) : boolean;      { Ausgabe erlaubt? }

function Is_NetReadOk( var Datei ) : boolean;       { Eingabe erlaubt? }

{-- Die Prozeduren Read, Write und Seek funktionieren nur bei Dateien,-}
{-- deren Mode Input-Output ist, da f�r den Netzwerkzugriff aber      -}
{-- typisierte Dateien auch in anderen Modi er�ffnet werden m�ssen,   -}
{-- sollten folgende Ersatzprozeduren verwendet werden                -}

procedure NetWrite( var Datei;               { Schreiben in eine Datei }
                    var Daten );

procedure NetRead( var Datei;                  { Lesen aus einer Datei }
                   var Daten );

procedure NetSeek( var Datei;              { Dateizeiger positionieren }
                       RecNo : longint );

implementation

const {-- Funktionsnummern f�r DOS-Aufruf -----------------------------}

      FKT_OPEN     = $3D;      { Funktion: Datei mit Handle er�ffnen   }
      FKT_CLOSE    = $3E;      { Funktion: Datei mit Handle schliessen }
      FKT_CREATE   = $3C;      { Funktion: Datei mit Handle erzeugen   }
      FKT_WRITE    = $40;      { Funktion: in Datei schreiben          }
      FKT_READ     = $3F;      { Funktion: aus Datei lesen             }
      FKT_LSEEK    = $42;      { Funktion: Dateizeiger setzen          }
      FKT_REC_LOCK = $5C;      { Funktion: Record-Locking              }

      {-- Funktions- u. Interrupt-Nummern sonstiger Interupt-Aufrufe --}

      MULTIPLEX    = $2F;                        { Multiplex-Interrupt }
      FKT_SHARE    = $1000;                { Test ob Share installiert }

      {-- Turbo-Pascal Kennungen f�r Dateien --------------------------}

      FMCLOSED     = $D7B0;                        { Datei geschlossen }
      FMINPUT      = $D7B1;                 { Datei zum Lesen ge�ffnet }
      FMOUTPUT     = $D7B2;             { Datei zum Schreiben ge�ffnet }
      FMINOUT      = $D7B3;    { Datei zum Lesen u. Schreiben ge�ffnet }

{**********************************************************************}
{* ShareInst   : Test ob SHARE installiert                            *}
{* Eingabe     : keine                                                *}
{* Ausgabe     : true wenn Share installiert                          *}
{* Globale Var.: NetError/W (Fehlerstatus nach Aufruf)                *}
{**********************************************************************}

function ShareInst : boolean;

var regs   : registers;       { Prozessorregister f�r Interrupt-Aufruf }

begin
 regs.ax := FKT_SHARE;                 { Test ob Share installiert ist }
 intr( MULTIPLEX, regs );               { Multiplex-Interrupt aufrufen }
 ShareInst := ( regs.al = $FF );                  { R�ckgabe auswerten }
 NetError := NE_OK;                                      { Kein Fehler }
end;

{**********************************************************************}
{* NetErrorMsg : Text der Fehlermeldung                               *}
{* Eingabe     : Fehlernummer                                         *}
{* Ausgabe     : Bedeutung                                            *}
{**********************************************************************}

function NetErrorMsg( Nummer : word ) : string;

var Sdummy : string;

begin
  case Nummer of
    NE_OK            : NetErrorMsg := 'Kein Fehler                 ';
    NE_FileNotFound  : NetErrorMsg := 'Datei nicht gefunden        ';
    NE_PathNotFound  : NetErrorMsg := 'Pfad nicht gefunden         ';
    NE_TooManyFiles  : NetErrorMsg := 'Zu viele offene Dateien     ';
    NE_AccessDenied  : NetErrorMsg := 'Zugriff auf Datei verweigert';
    NE_InvalidHandle : NetErrorMsg := 'Dateihandle ung�ltig        ';
    NE_AccessCode    : NetErrorMsg := 'Zugriffsart unzul�ssig      ';
    NE_Share         : NetErrorMsg := 'Verletzung der SHARE-Rechte ';
    NE_Lock          : NetErrorMsg := 'Fehler beim Record-Locking  ';
    NE_ShareBuffer   : NetErrorMsg := 'Puffer�berlauf bei SHARE    ';
    else               begin
                         str( Nummer, Sdummy );
                         NetErrorMsg := 'DOS-Fehler: ' + Sdummy;
                       end;
  end;
end;

{**********************************************************************}
{* NetRewrite  : Erzeugen einer Datei                                 *}
{* Eingabe     : Dateiname, Er�ffnungsmodus, Recordgr��e              *}
{* Ausgabe     : Ge�ffnete Datei                                      *}
{* Globale Var.: NetError/W (Fehlerstatus nach Aufruf)                *}
{**********************************************************************}

procedure NetRewrite(     DName  : string;
                          Modus  : integer;
                          RecS   : word;
                      var Datei );

var regs   : registers;       { Prozessorregister f�r Interrupt-Aufruf }
    DName2 : string;                  { Dateiname f�r lokale Vewendung }

begin
  DName2 := DName + #0;           { Dateiname kopieren und aufbereiten }
  with regs do
    begin
      ds := seg( DName2[ 1 ] );                   { Dateiname zuweisen }
      dx := ofs( DName2[ 1 ] );
      ah := FKT_CREATE;           { Funktionsnummer f�r Datei erzeugen }
      cx := 0 ;                                       { Dateiatrribute }
      msdos( regs );                                { Interrupt-Aufruf }
      if ( ( flags and fcarry ) = 0 ) then          { �ffnen gelungen? }
        begin
          bx := ax;                            { Handle in Register BX }
          ah := FKT_CLOSE;          { Funktionsnummer Datei schliessen }
          msdos( regs );
          if ( ( flags and fcarry ) = 0 ) then  { Schliessen gelungen? }
            NetReset( DName, Modus, Recs, Datei )     { Datei er�ffnen }
          else
            NetError := ax;                      { Fehlernummer merken }
        end
      else
        NetError := ax;                          { Fehlernummer merken }
    end;
end;

{**********************************************************************}
{* NetReset    : �ffnen einer bestehenden Datei                       *}
{* Eingabe     : Dateiname, Er�ffnungsmodus, Recordgr��e              *}
{* Ausgabe     : Ge�ffnete Datei                                      *}
{* Globale Var.: NetError/W (Fehlerstatus nach Aufruf)                *}
{**********************************************************************}

procedure NetReset(     DName  : string;
                        Modus  : integer;
                        RecS   : word;
                    var Datei );

var regs : registers;         { Prozessorregister f�r Interrupt-Aufruf }

begin
  DName := DName + #0;              { Dateiname mu� mit #0 abschliesen }
  with regs do
    begin
      ds := seg( DName[ 1 ] );                    { Dateiname zuweisen }
      dx := ofs( DName[ 1 ] );
      ah := FKT_OPEN;             { Funktionsnummer f�r Datei er�ffnen }
      al := Modus;            { Statusbyte f�r Zugriffsart und Locking }
      msdos( regs );                                { Interrupt-Aufruf }
      if ( ( flags and fcarry ) = 0 ) then          { �ffnen gelungen? }
        begin
          NetError := NE_OK;                             { Kein Fehler }
          with filerec( Datei ) do
            begin
              move( DName[ 1 ], filerec( Datei ).Name,     { Dateiname }
                    length( DName ) );                     { zuweisen  }
              Handle := ax;                              { Dateihandle }
              RecSize := RecS;                    { Recordgr��e setzen }
              case ( Modus and $0F ) of     { Pascal-Dateimodus setzen }
                FM_R   : Mode := FMINPUT;
                FM_W   : Mode := FMOUTPUT;
                FM_RW  : Mode := FMINOUT;
              end;
            end;
        end
      else
        begin
          NetError := ax;                        { Fehlernummer merken }
          filerec( Datei ).Mode := FMCLOSED;    { Datei nicht ge�ffnet }
        end;
    end;
end;

{**********************************************************************}
{* NetClose  : Schliessen einer Datei                                 *}
{* Eingabe   : Datei                                                  *}
{* Ausgabe   : keine                                                  *}
{**********************************************************************}

procedure NetClose( var Datei );

var regs : registers;         { Prozessorregister f�r Interrupt-Aufruf }

begin
  if ( Filerec( Datei ).Mode <> FMCLOSED ) then         { Datei offen? }
    begin
      with regs do
        begin
          ah := FKT_CLOSE;          { Funktionsnummer Datei schliessen }
          bx := FileRec( Datei ).Handle;            { Handle der Datei }
          msdos( regs );                            { Interrupt-Aufruf }
        end;
      FileRec( Datei ).Mode := FMCLOSED;           { Datei geschlossen }
      NetError := NE_OK;                                 { Kein Fehler }
    end
  else
    NetError := NE_InvalidHandle;                  { Datei nicht offen }
end;

{**********************************************************************}
{* Locking     : Sperren bzw. Entsperren eines Dateibereiches         *}
{* Eingabe     : Handle der Datei, Operation, Offset zum Dateianfang, *}
{*               L�nge des zu (ent)sperrenden Bereiches               *}
{* Ausgabe     : true wenn erfolgreich                                *}
{* Globale Var.: NetError/W (Fehlerstatus f�r Aufruf)                 *}
{* Info        : Nur interne Verwendung, Aufruf durch NetLock         *}
{*               und NetUnlock                                        *}
{**********************************************************************}

function Locking( Handle    : word;
                  Operation : byte;
                  Offset    : longint;
                  Laenge    : longint ) : boolean;

var regs : registers;         { Prozessorregister f�r Interrupt-Aufruf }

begin
  with regs do
    begin
      ah := FKT_REC_LOCK;       { Funktionsnummer f�r interrupt-Aufruf }
      al := Operation;                          { 0 = Lock, 1 = Unlock }
      bx := Handle;                                      { Dateihandle }
      cx := offset shr 16;                            { Hi-Word Offset }
      dx := offset and $FFFF;                         { Lo-Word Offset }
      si := Laenge shr 16;                             { Hi-Word L�nge }
      di := Laenge and $FFFF;                         { Lo-Word Laenge }
      msdos( regs );                                { Interrupt-Aufruf }
      if ( ( flags and fcarry ) = 0 ) then         { Locking gelungen? }
        begin
          Locking := true;                               { Kein Fehler }
          NetError := NE_OK;
        end
      else
        begin
          Locking := false;
          NetError := ax;                        { Fehlernummer merken }
        end;
    end;
end;

{**********************************************************************}
{* NetLock     : Sperren von Records                                  *}
{* Eingabe     : Datei, Recordnummer, Anzahl zu sperrender Record     *}
{* Ausgabe     : true wenn erfolgreich                                *}
{* Globale Var.: NetError/W (Fehlerstatus f�r Aufruf)                 *}
{**********************************************************************}

function NetLock( var Datei;
                      RecNo  : longint;
                      Anzahl : longint ) : boolean;

begin
  NetLock := Locking( filerec( Datei ).Handle, 0,
                      filerec( Datei ).Recsize * RecNo,
                      filerec( Datei ).Recsize * Anzahl );
end;

{**********************************************************************}
{* NetUnLock   : Freigeben von gesperrten Records                     *}
{* Eingabe     : Datei, Recordnummer, Anzahl freizugebender Record    *}
{* Ausgabe     : true wenn erfolgreich                                *}
{* Globale Var.: NetError/W (Fehlerstatus f�r Aufruf)                 *}
{**********************************************************************}

function NetUnlock( var Datei;
                        RecNo  : longint;
                        Anzahl : longint ) : boolean;
begin
  NetUnLock := Locking( filerec( Datei).Handle, 1,
                        filerec( Datei ).Recsize * RecNo,
                        filerec( Datei ).Recsize * Anzahl );
end;

{**********************************************************************}
{* Is_NetWriteOk : Ausgabe in Datei erlaubt                           *}
{* Eingabe       : Datei                                              *}
{* Ausgabe       : true wenn Ausgabe erlaubt                          *}
{**********************************************************************}

function Is_NetWriteOk( var Datei ) : boolean;

begin
  with Filerec( Datei ) do
    Is_NetWriteOk := ( Mode = FMOUTPUT ) or ( Mode = FMINOUT );
end;

{**********************************************************************}
{* Is_NetReadOk : Eingabe aus Datei erlaubt                           *}
{* Eingabe      : Datei                                               *}
{* Ausgabe      : true wenn Eingabe erlaubt                           *}
{**********************************************************************}

function Is_NetReadOk( var Datei ) : boolean;

begin
  with Filerec( Datei ) do
    Is_NetReadOk := ( Mode = FMINPUT ) or ( Mode = FMINOUT );
end;

{**********************************************************************}
{* Is_NetOpen  : Datei ge�ffnet                                       *}
{* Eingabe     : Datei                                                *}
{* Ausgabe     : true wenn Datei ge�ffnet                             *}
{**********************************************************************}

function Is_NetOpen( var Datei ) : boolean;

begin
  with Filerec( Datei ) do
    Is_Netopen := ( Mode = FMINPUT ) or ( Mode = FMOUTPUT ) or
               ( Mode = FMINOUT );
end;

{**********************************************************************}
{* NetWrite    : In Datei schreiben                                   *}
{* Eingabe     : Datei, Daten                                         *}
{* Ausgabe     : keine                                                *}
{* Info        : Ausgabe mit Pascal-Prozeduren nur m�glich, wenn Datei*}
{*               im Input-Output-Modus er�ffnet wurde                 *}
{*               Achtung: es findet keine Typenpr�fung statt.         *}
{**********************************************************************}

procedure NetWrite( var Datei;
                    var Daten );

var regs : registers;         { Prozessorregister f�r Interrupt-Aufruf }

begin
  with regs do
    begin
      ds := seg( Daten );                          { Adresse der Daten }
      dx := ofs( Daten );
      ah := FKT_WRITE;               { Funktionsnummer Datei schreiben }
      bx := filerec( Datei ).Handle;                     { Dateihandle }
      cx := filerec( Datei ).Recsize;                   { Anzahl Bytes }
      msdos( regs );                                { Interrupt-Aufruf }
      if ( ( flags and fcarry ) = 0 ) then       { Schreiben gelungen? }
        NetError := NE_OK                                { Kein Fehler }
      else
        NetError := ax;                          { Fehlernummer merken }
    end;
end;

{**********************************************************************}
{* NetRead     : Aus Datei lesen                                      *}
{* Eingabe     : Datei, Variable zur Aufnahme der Daten               *}
{* Ausgabe     : Daten                                                *}
{* Info        : Eingabe mit Pascal-Prozeduren nur m�glich, wenn Datei*}
{*               im Input-Output-Modus er�ffnet wurde                 *}
{*               Achtung: es findet keine Typenpr�fung statt.         *}
{**********************************************************************}

procedure NetRead( var Datei;
                   var Daten );

var regs : registers;         { Prozessorregister f�r Interrupt-Aufruf }

begin
  with regs do
    begin
      ds := seg( Daten );                          { Adresse der Daten }
      dx := ofs( Daten );
      ah := FKT_READ;                 { Funktionsnummer Datei auslesen }
      bx := filerec( Datei ).Handle;                     { Dateihandle }
      cx := filerec( Datei ).Recsize;                   { Anzahl Bytes }
      msdos( regs );                                { Interrupt-Aufruf }
      if ( ( flags and fcarry ) = 0 ) then       { Schreiben gelungen? }
        NetError := NE_OK                                { Kein Fehler }
      else
        NetError := ax;                          { Fehlernummer merken }
    end;
end;

{**********************************************************************}
{* NetSeek     : Dateizeiger setzen                                   *}
{* Eingabe     : Datei, Recordnummer                                  *}
{* Ausgabe     : keine                                                *}
{* Info        : Pascal Prozedur Seek nur m�glich, wenn Datei im      *}
{*               Input-Output-Modus er�ffnet wurde                    *}
{**********************************************************************}

procedure NetSeek( var Datei;
                       RecNo : longint );

var regs : registers;         { Prozessorregister f�r Interrupt-Aufruf }

begin
  with regs do
    begin
      ah := FKT_LSEEK;            { Funktionsnummer Dateizeiger setzen }
      al := 0;                      { Position absolut zum Dateianfang }
      bx := filerec( Datei ).Handle;                     { Dateihandle }
      RecNo := RecNo * filerec( Datei ).Recsize;     { Offset in Bytes }
      cx := RecNo shr 16;                             { Hi-Word Offset }
      dx := RecNo and $FFFF;                          { Lo-Word Offset }
      msdos( regs );                                { Interrupt-Aufruf }
      if ( ( flags and fcarry ) = 0 ) then       { Schreiben gelungen? }
        NetError := NE_OK                                { Kein Fehler }
      else
        NetError := ax;                          { Fehlernummer merken }
    end;
end;

{-- Initialisierungsteil der Unit -------------------------------------}

begin
end.
