Program WahrscheinlichkeitNR1;
Uses Crt;
Var                             x:integer;
    e1,e2,e3,e4,e5,e6,y,zae,i,o,w:real;
                           ch,aus:char;
label start,ent;
Procedure CLRSCREEN;BEGIN window(1,1,80,25);gotoxy(1,12);
 for x:=1 to 14 do begin insline;delay(25);end;gotoxy(1,1);
 for x:=1 to 11 do BEGIN delline;delay(25);end;textbackground(black);
END;

BEGIN
start:
clrscr;
RANDOMIZE;
writeln;
Write(' Bildschirmausgabe der Zufallszahlen ? (Ja/Nein/Anzahl) ');
textbackground(green);textcolor(white);write('±±±±');gotoxy(wherex-4,wherey);
textcolor(red);aus:=readkey;
CASE upcase(aus) of 'J':write(' Ja ');'N':write('Nein');'A':write('Anz.');
END;
writeln;textcolor(red);textbackground(0);
writeln(' Stoppen der Z„hlung durch beliebigen Tastendruck !  Prozess l„uft....');
delay(200);textcolor(7);
if upcase(aus) = 'A' then begin gotoxy(13,4);write(' Zufallszahlen durchlaufen.');end;
window(1,25,80,25);textbackground(blue);clrscr;textcolor(white);
for x:=1 to 41 do begin
write('  Wrfel-Zufallszahlengenerator ³ gekritzelt `95 von PHL ³ dedicated to STOCKI');
delay(15);
end;
textbackground(black);textcolor(7);window(1,1,80,24);gotoxy(1,4);
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
delay(500);
textcolor(blue);textbackground(white);
for x:=1 to 14 do begin gotoxy(1,1);insline;delay(20);end;
writeln;
writeln('                Anzahl der Zufallszahlen insgesamt: ',zae:10:0);
writeln('                ----------------------------------->==========');
writeln('                         ÚÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄ¿');
writeln('                         ³ Zahl ³ H„ufigkeit ³' );
writeln('                         ÃÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄ´');
writeln('                         ³ 1    ³  ',e1:9:0,' ³');
writeln('                         ³ 2    ³  ',e2:9:0,' ³');
writeln('                         ³ 3    ³  ',e3:9:0,' ³');
writeln('                         ³ 4    ³  ',e4:9:0,' ³');
writeln('                         ³ 5    ³  ',e5:9:0,' ³');
writeln('                         ³ 6    ³  ',e6:9:0,' ³');
writeln('                         ÀÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÙ');
textcolor(black);
write('         Prozess nocheinmal durchfhren ? ');textbackground(0);
ch:=readkey;textcolor(7);
ch:=readkey;if upcase(ch) = 'J' then goto start else goto ent;
ent:
clrscreen;
END.