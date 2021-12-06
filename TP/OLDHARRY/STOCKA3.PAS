Program WahrscheinlichkeitNR1;
Uses Crt;
Var                         x:integer;
            e1,e2,e3,e4,e5,e6:real;
                  y,zae,i,o,w:real;
                       ch,aus:char;
BEGIN
clrscr;
RANDOMIZE;
Write(' Bildschirmausgabe der Zufallszahlen ? (Ja/Nein/Anzahl) ');
textbackground(green);textcolor(white);write('±±±±');
gotoxy(wherex-4,wherey);
textcolor(red);aus:=readkey;
CASE upcase(aus) of
   'J' : write(' Ja ');
   'N' : write('Nein');
   'A' : write('Anz.');
END;
writeln;
textcolor(red);textbackground(0);
writeln(' Stoppen der Z„hlung durch beliebigen Tastendruck !  Prozess l„uft....');

delay(400);textcolor(7);
if upcase(aus) = 'A' then begin gotoxy(13,4);write(' Zufallszahlen durchlaufen.');end;
REPEAT
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

{Auswertung}
writeln;writeln;
writeln('Anzahl der Zufallszahlen insgesamt: ',zae:10:0);
writeln('----------------------------------->==========');
writeln('ÚÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄ¿');
writeln('³ Zahl ³ H„ufigkeit ³' );
writeln('ÃÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄ´');
writeln('³    1 ³  ',e1:9:0,' ³');
writeln('³    2 ³  ',e2:9:0,' ³');
writeln('³    3 ³  ',e3:9:0,' ³');
writeln('³    4 ³  ',e4:9:0,' ³');
writeln('³    5 ³  ',e5:9:0,' ³');
writeln('³    6 ³  ',e6:9:0,' ³');
writeln('ÀÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÙ');

ch:=readkey;
ch:=readkey;
{writeln('E(s) insges.: ',e1+e2+e3+e4+e5+e6);writeln;}
END.