Program ReadSerbFiles;
Uses crt;
Var a,b,cs,d,x,y,z,zs,errs,reperr,ls:integer;
               ch:char;
              adr,prn:text;
              lin,path,docname,s:string;
label ende,beginn,main,printit;
BEGIN
beginn:
errs:=0;
textmode(font8x8+3);
window(1,1,80,2);
textcolor(white);textbackground(red);clrscr;
writeln('   Program zur Erstellung von Namenslisten aus Seribenbriefdateien (P.E.N.S) ');
  write('       written by phl. execusivly for HACKER-IMMOBILIEN   (Ser. No. 1A)');

window(1,3,80,49);{Standard WINDOW}textbackground(white);clrscr;
for z:=1 to 3759 do begin write(chr(176)); end;
window(41,13,71,15);textbackground(white);clrscr;
window(40,12,70,14);textbackground(blue);clrscr;textcolor(white);
writeln;write('      Auswahl des Objekts');

{scroller}
window(5,5,28,34);
textbackground(blue);
clrscr;

writeln;
writeln(' Allensbacher Straáe 14');
writeln(' Brhlstraáe 5');
writeln(' Brhlstraáe 6');
writeln(' Dorfbachweg 1');
writeln(' Dorfbachweg 3');
writeln(' Dorfbachweg 5');
writeln(' Zur Halde');
writeln(' Hesselbergweg 1');
writeln(' Hesselbergweg 3');
writeln(' Kelhofstraáe 4-10');
writeln(' Kelhofstraáe 7');
writeln(' Kelhofstraáe 14');
writeln(' Kelhofstraáe 19');
writeln(' Kelhofstraáe 25');
writeln(' Zum Kirchenwald 1');
writeln(' Konstanzer Straáe 11');
writeln(' Konstanzer Straáe 16e');
writeln(' Mainaustraáe 48c');
writeln(' Obere Bndt 1');
writeln(' Radolfzeller Straáe 25');
writeln(' Am Seehang');
writeln(' H. v. Tett. Str. 33a');
writeln(' H. v. Tett. Str. 33bc');
writeln(' Torkelweg 10');
writeln(' WEG Yachthafen Wallh.');
writeln(' Zeller Straáe 13');
textcolor(red);
WRIteln(' ...Andere Datei...');
writeln('    >>> Quit ! <<<');

window(29,6,30,33);textbackground(white);clrscr;
window(3,6,4,33);textbackground(white);clrscr;
textcolor(black);
window(29,6,30,33);write(chr(17));a:=wherey;
window(3,6,4,33);write(chr(16));

window(1,50,80,50);
textcolor(white);textbackground(red);clrscr;
write('      [ESC]  Quit     ³     ',chr(24),',',chr(25),' Cursor hoch/runter     ³  RETURN best„tigt');



repeat
ch:=readkey;
 if ch=#0 then begin
   ch:=readkey;
   if ch=#72 then begin
   window(29,6,30,33);textbackground(white);clrscr;textcolor(black);clrscr;
   window(29,6,30,33);clrscr;gotoxy(wherex,a-1);write(chr(17));
   window(3,6,4,33);clrscr;gotoxy(wherex,a-1);write(chr(16));a:=wherey;end;
   if ch=#80 then begin
   window(29,6,30,33);textbackground(white);clrscr;textcolor(black);
   window(29,6,30,33);clrscr;gotoxy(wherex,a+1);write(chr(17));
   window(3,6,4,33);clrscr;gotoxy(wherex,a+1);write(chr(16));a:=wherey;end;

    window(1,50,80,50);textcolor(white);textbackground(red);clrscr;
    write('               Druch Return wrde jetzt Objekt Nr. ',a:2,' ausgew„hlt.');

    if a=28 then begin clrscr;
    write('                             Verl„át das Programm.');end;

    if a=27 then begin clrscr;
    write('      Erm”glicht den Zugriff auf Objekte, die hier nicht aufgefhrt sind.');
    end;

 end;

if ch=#13 then begin
window(1,50,80,50);textcolor(white);textbackground(red);clrscr;
if a=28 then goto ende;
write('                           Objekt ',a,' wurde gew„hlt !');
goto main;
end;

until ch=#27;

textbackground(white);clrscr;
textcolor(black);


ende:
textmode(3);
clrscr;textcolor(white);
writeln;
writeln(' THX 4 USING');textcolor(7);
if reperr=1 then writeln(' Im Programm ist anscheinend noch ein Fehler. Sofort JAN melden !');
exit;


main:
window(1,3,80,49);{Standard WINDOW}textbackground(white);clrscr;
for z:=1 to 3759 do begin write(chr(176)); end;

docname:='ADR_ABR.TXT';
if a=1  then path:='C:\WORD5\VERWALT\ABA14\';                     {wrong dir ! }
if a=2  then path:='C:\WORD5\VERWALT\BRšHL5\';
if a=3  then path:='C:\WORD5\VERWALT\BRšHL6\';
if a=4  then path:='C:\WORD5\VERWALT\DOBA1\';                     {wrong dir !!!}
if a=5  then path:='C:\WORD5\VERWALT\DOBA3\';
if a=6  then path:='C:\WORD5\VERWALT\DOBA5\';
if a=7  then path:='C:\WORD5\VERWALT\HALDE\';
if a=8  then path:='C:\WORD5\VERWALT\HESSEL1\';
if a=9  then path:='C:\WORD5\VERWALT\HESSEL3\';
if a=10 then path:='C:\WORD5\VERWALT\KEHL4-10\';
if a=11 then path:='C:\WORD5\VERWALT\KEHL7\';
if a=12 then path:='C:\WORD5\VERWALT\KEHL14\';
if a=13 then path:='C:\WORD5\VERWALT\KEHL19\';
if a=14 then path:='C:\WORD5\VERWALT\KEHL25\';
if a=15 then path:='C:\WORD5\VERWALT\KIWA1\';
if a=16 then path:='C:\WORD5\VERWALT\KO11\';
if a=17 then path:='C:\WORD5\VERWALT\KO16E\';
if a=18 then path:='C:\WORD5\VERWALT\MAI48C\';
if a=19 then path:='C:\WORD5\VERWALT\OB_Bš1\';
if a=20 then path:='C:\WORD5\VERWALT\RDZ25\';
if a=21 then path:='C:\WORD5\VERWALT\SEEHANG\';
if a=22 then path:='C:\WORD5\VERWALT\TETT33A\';
if a=23 then path:='C:\WORD5\VERWALT\TETT33BC\';
if a=24 then path:='C:\WORD5\VERWALT\TORKEL10\';
if a=25 then path:='C:\WORD5\VERWALT\WEG_YACH\';
if a=26 then path:='C:\WORD5\VERWALT\ZELLER13\';

if a=27 then begin
window(11,6,71,11);textbackground(white);clrscr;
window(10,5,70,10);textcolor(white);textbackground(blue);clrscr;
writeln;writeln(' Bitte den Dateinamen der Datei eingeben :');
write(' ');readln(path);docname:='';end;




window(11,6,71,11);textbackground(white);clrscr;
window(10,5,70,10);textcolor(white);textbackground(blue);clrscr;
writeln;
writeln('     Objekt ',a,' wurde gew„hlt ! Diesem Objekt ist die Datei');
write('     ',path+docname);gotoxy(47,wherey);write('zugewiesen.');
writeln;


assign(adr,path+docname);
{$I-}
reset(adr);
{$I+}
if ioresult = 0  then write('     (Die Datei existiert !)') else begin
   textcolor(white+blink);writeln('     Die Datei existiert aber nicht ! ');textcolor(white);
   write('     [Z]urck    [Q]uit');ch:=readkey;   errs:=1;reperr:=1;
   if upcase(ch)='Q' then goto ende else goto beginn;
end;


if errs=0 then begin
window(18,19,63,25);textbackground(white);clrscr;
window(17,18,62,24);textbackground(blue);clrscr;
writeln;
writeln('         Soll die Namensliste jetzt auf ');
writeln('         den Drucker ausgegeben werden ?');
writeln;
write('            [J]a   [Q]uit   [Z]urck');
ch:=readkey;
if upcase(ch)='J' then goto printit;
if upcase(ch)='Q' then goto ende;
if upcase(ch)='Z' then goto beginn;
if ch=#13 then goto printit else goto beginn;
end;







goto beginn;




printit:
window(1,3,80,49);{Standard WINDOW}textbackground(white);clrscr;
for z:=1 to 3759 do begin write(chr(176)); end;
assign(prn,'lpt1');
{$I-}
rewrite(prn);
writeln(prn,'       ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
writeln(prn,'       ³           Adressdaten-Auflistung fr Objekt Nummer ',a:2,'         ³');
writeln(prn,'       ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
writeln(prn);
{$I+}
if ioresult=0 then begin writeln(' Die Ausgabe l„uft .....');delay(1500);end else
                   begin window(11,6,71,11);textbackground(white);clrscr;
                         window(10,5,70,10);textcolor(white);textbackground(blue);clrscr;writeln;
                         writeln('   Der Drucker ist nicht bereit.');writeln;
                         write('   [N]euer Versuch    [Q]uit');
                         ch:=readkey;if upcase(ch)='N' then goto printit else goto beginn;end;



while not eof(adr) do begin
  readln(adr,s);zs:=0;for cs:=1 to length(s) do begin s[cs]:=upcase(s[cs]);end;


for ls:=pos(';',s) to length(s) do begin
  if s[ls]=';' then begin inc(zs);
   if zs=1 then begin writeln(prn,'');end;
   if zs=2 then begin writeln(prn,'');end;
   if zs=3 then begin writeln(prn,'');end;
   if zs=4 then begin s:=''end;
  end else begin if zs<4 then write(prn,s[ls]);end;
end;


writeln(prn);writeln(prn);
end;




goto beginn;
END.

{assign(adr,'D:\TEMP\DOBA1\ADR_ABR.TXT');reset(adr);}
{while not eof(adr) do begin
readln(adr,lin);for a:=1 to length(lin) do lin[a]:=upcase(lin[a]);
if x=0 then begin b:=pos('FRAU',lin);end;
for c:=b to length(lin) do write(lin[c]);



{writeln(lin);
x:=1;
end; }
