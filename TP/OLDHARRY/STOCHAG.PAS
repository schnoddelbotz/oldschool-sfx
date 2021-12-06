Program WahrscheinlichkeitNR1;
Uses Crt,graph;
Var                 d,x,maxx,xpix:integer;
    e1,e2,e3,e4,e5,e6,y,zae,i,o,w:real;
                           ch,aus:char;
                              dly:string;
                          grd,grm:integer;

Procedure StdCols; BEGIN Textcolor(7);textbackground(0);END;
Procedure CLRSCREEN;BEGIN; stdcols;
window(1,1,80,25);gotoxy(1,12);
 for x:=1 to 14 do begin insline;delay(25);end;gotoxy(1,1);
 for x:=1 to 11 do BEGIN delline;delay(25);end;textbackground(black);
END;
label start,ent;
{-------------------------- Programmbeginn ------------------------}
BEGIN
clrscr;
write(' Wieviele Zufallszahlen sollen berechnet werden ?');readln(maxx);
writeln(' Es werden nun ',maxx,' Zufallszahlen berechnet !');
detectgraph(grd,grm);
initgraph(grd,grm,'d:\tp\bgi\');
settextstyle(defaultfont,horizdir,2);
outtext(' Brechnung von Wrfelzufallszahlen...');

{----------Grafik-Grundaufbau des Monis--------------}
line(10,450,620,450);moveto(600,450);outtext('x');
line(10,450,10,50);moveto(15,50);outtext('y');
settextstyle(0,0,1);
moveto(1,400);outtext('1');moveto(1,350);outtext('2');
moveto(1,300);outtext('3');moveto(1,250);outtext('4');
moveto(1,200);outtext('5');moveto(1,150);outtext('6');


{==================== eigentlicher Programmbeginn ===================}

start:
stdcols;
RANDOMIZE;
{________________ Zufallszahlen_____________}
xpix:=15;
REPEAT
 zae:=zae+1;
 w:=(random(6))+1;
 IF w = 1 then BEGIN putpixel(xpix,400,7); END;
 IF w = 2 then BEGIN putpixel(xpix,350,7); END;
 IF w = 3 then BEGIN putpixel(xpix,300,7); END;
 IF w = 4 then BEGIN putpixel(xpix,250,7); END;
 IF w = 5 then BEGIN putpixel(xpix,200,7); END;
 IF w = 6 then BEGIN putpixel(xpix,150,7); END;
 o:=o+1;
 xpix:=xpix+1;
 delay(10);
UNTIL o=MAXX;

moveto(200,460);
outtext(' Bitte eine Taste drcken..');ch:=readkey;


{.............................Auswertung der Zufallszahlen..........}
{textcolor(blue);textbackground(white);
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
}
ent:
{clrscreen;}
END.