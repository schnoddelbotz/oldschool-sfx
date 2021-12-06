Program WahrscheinlichkeitNR1;
Uses Crt;
Var                       d,x:integer;
    e1,e2,e3,e4,e5,e6,y,zae,i,o,w:real;
                           ch,aus:char;
                           dly:string;
label start,ent;

Procedure StdCols; BEGIN Textcolor(7);textbackground(0);END;
Procedure CLRSCREEN;BEGIN; stdcols;
window(1,1,80,25);gotoxy(1,12);
 for x:=1 to 14 do begin insline;delay(25);end;gotoxy(1,1);
 for x:=1 to 11 do BEGIN delline;delay(25);end;textbackground(black);
END;
{----------------- Programmbeginn ------------------------}
BEGIN
clrscr;
val(paramstr(1),d,d);
IF PARAMCOUNT<>1 THEN BEGIN
writeln('                        =Í STOCHA 0.395á von phl Í=');
writeln(' Syntax: STOCHA n');
writeln(' Wobei n die Zeit in ms angibt, die zw. jeder Zufallszahl vergehen soll.');
writeln(' =======================================================================');
writeln;
writeln('  Das  soll  verhindern,  daá der RANDOM-Proz. auf schnelleren  Rechnern');
writeln('  abr”delt. (Etwa ab 486-SX ist dies der Fall; dann reicht fr n ca.10.)');writeln;
writeln('  ----------------------------------------------------------------------');
writeln;
writeln('  n     kann     im     Bereich   [1 .. 65535]   liegen.');
writeln('  0     verhindert  "RANDOMIZE"  in  der  CASE - Schleife   generell.');
writeln('  (einfach ausprobieren was i.O. ist durch Ausgabe der Zufallszahlen.)');
delay(1500);exit;END;
writeln('Verz”gerungszeit zwischen jeder Randomzahl: ',d);delay(1000);
{==================== eigentlicher Programmbeginn ===================}
clrscr;
start:
stdcols;
RANDOMIZE;
writeln;
Write(' Bildschirmausgabe der Zufallszahlen ? (Ja/Nein/Anzahl/ESC) ');
textbackground(green);textcolor(white);write('±±±±');gotoxy(wherex-4,wherey);
textcolor(red);aus:=readkey;
CASE upcase(aus) of 'J':write(' Ja ');'N':write('Nein');'A':write('Anz.');END;
IF aus=#27 then begin stdcols;clrscr;exit; end;
writeln;textcolor(red);textbackground(0);
writeln(' Stoppen der Z„hlung durch beliebigen Tastendruck !  Prozess l„uft....');
delay(200);stdcols;
if upcase(aus) = 'A' then begin gotoxy(13,4);write(' Zufallszahlen durchlaufen.');end;
window(1,25,80,25);textbackground(blue);clrscr;textcolor(white);
for x:=1 to 41 do begin
write('  Wrfel-Zufallszahlengenerator ³ gekritzelt `95 von PHL ³ dedicated to STOCKI');
delay(15);
end;
stdcols;window(1,1,80,24);gotoxy(1,4);
{________________ Zufallszahlen_____________}
REPEAT

 if d<>0 then BEGIN RANDOMIZE;delay(d); END;
 zae:=zae+1;
 w:=(random(6))+1;
if upcase(aus)='J' then write(w:2:0);
if upcase(aus)='A' then begin gotoxy(3,4);write(zae:10:0); end;
 IF w = 1 then e1:=e1+1;
 IF w = 2 then e2:=e2+1;
 IF w = 3 then e3:=e3+1;
 IF w = 4 then e4:=e4+1;
 IF w = 5 then e5:=e5+1;
 IF w = 6 then e6:=e6+1;

UNTIL KeyPressed;
delay(500);
{.............................Auswertung der Zufallszahlen..........}
textcolor(blue);textbackground(white);
for x:=1 to 14 do begin gotoxy(1,1);insline;delay(20);end;
writeln;
writeln('                Anzahl der Zufallszahlen insgesamt: ',zae:10:0);
writeln('                ----------------------------------->==========');
writeln('                      ÚÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄ¿');
writeln('                      ³ Zahl ³ H„ufigkeit ³  % % %  ³');
writeln('                      ÃÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄ´');
writeln('                      ³ 1    ³  ',e1:9:0,' ³',(e1/zae*100):8:3,' ³');
writeln('                      ³ 2    ³  ',e2:9:0,' ³',(e2/zae*100):8:3,' ³');
writeln('                      ³ 3    ³  ',e3:9:0,' ³',(e3/zae*100):8:3,' ³');
writeln('                      ³ 4    ³  ',e4:9:0,' ³',(e4/zae*100):8:3,' ³');
writeln('                      ³ 5    ³  ',e5:9:0,' ³',(e5/zae*100):8:3,' ³');
writeln('                      ³ 6    ³  ',e6:9:0,' ³',(e6/zae*100):8:3,' ³');
writeln('                      ÀÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÙ');
textcolor(black);
write('         Prozess nocheinmal durchfhren ? ');textbackground(0);
ch:=readkey;textcolor(7);
ch:=readkey;if upcase(ch) = 'J' then goto start else goto ent;
ent:
clrscreen;
END.