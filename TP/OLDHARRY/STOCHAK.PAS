Program WahrscheinlichkeitNRx;
Uses Crt,graph,dos;
Var                 d,x,maxx,xpix:integer;
    e1,e2,e3,e4,e5,e6,y,zae,i,o,w:real;
                w1,w2,w3,w4,w5,w6:integer;
                           ch,aus:char;
                             path:string;
                          grd,grm:integer;

label start,ent;
Procedure wrongMAXX;
BEGIN;
textcolor(15);writeln;
writeln(' Die Angabe liegt au·erhalb des zugelassenen Wertebereichs !');
halt;
END;
{-------------------------- Programmbeginn ------------------------}
BEGIN
clrscr;
{
write(' Pfad zu EGAVGA.BGI angeben (Standard: A:\) : ');textcolor(15);Read(path);
if path='' then BEGIN gotoxy(47,1);textcolor(15);writeln('A:\');path:='a:\';end;textcolor(7);
}

{$I-}       {Compilerbefehl: IOPrÅfung: AUS !
if fsearch('egavga.bgi',path)='' then BEGIN
textcolor(15);
writeln;
writeln(' FEHLER:');
writeln(' Die  Datei EGAVGA.BGI,  die  zur  Grafikausgabe  benîtigt  wird,');
writeln(' konnte nicht gefunden werden. Bitte prÅfen Sie Ihre Pfadangabe !');
halt;end;
}
write(' Wieviele Zufallszahlen sollen angezeigt werden (MAX: 3600!) ? ');textcolor(15);
readln(maxx);textcolor(7);
if ioresult<>0 then wrongmaxx;
if maxx>600*6 then wrongmaxx;if maxx<1 then wrongmaxx;
{$I+}        {I/O: AN !}

{     SWITCH TO VGA          }
detectgraph(grd,grm);
initgraph(grd,grm,'c:\tp\bgi\'{path});
settextstyle(defaultfont,horizdir,1);
outtext(' Waiting for monitor (Resolution-Switch)');
delay(2000);
{----------Grafik-Grundaufbau des Monis--------------}
line(10,450,620,450);moveto(600,450);outtext('x');moveto(621,447);outtext(#26);
line(10,450,10,50);moveto(15,50);outtext('y');moveto(7,43);outtext(#24);
setcolor(red);line(639,50,639,450);setcolor(7);
settextstyle(0,0,1);
moveto(1,400);outtext('1');moveto(1,350);outtext('2');
moveto(1,300);outtext('3');moveto(1,250);outtext('4');
moveto(1,200);outtext('5');moveto(1,150);outtext('6');


{==================== eigentlicher Programmbeginn ===================}

start:
RANDOMIZE;
{________________ Zufallszahlen_____________}
xpix:=15;w1:=15;w2:=15;w3:=15;w4:=15;w5:=15;w6:=15;
REPEAT

 w:=(random(6))+1;
 IF w = 1 then BEGIN inc(w1);putpixel(w1,400,7); END;
 IF w = 2 then BEGIN inc(w2);putpixel(w2,350,7); END;
 IF w = 3 then BEGIN inc(w3);putpixel(w3,300,7); END;
 IF w = 4 then BEGIN inc(w4);putpixel(w4,250,7); END;
 IF w = 5 then BEGIN inc(w5);putpixel(w5,200,7); END;
 IF w = 6 then BEGIN inc(w6);putpixel(w6,150,7); END;
 o:=o+1;
 xpix:=xpix+1;
 delay(2);
UNTIL o=MAXX;

moveto(200,460);outtext(' Bitte eine Taste drÅcken...');ch:=readkey;
{   Programm-Ende, Installieren des normalen CRT-Modes   }
ent:
restorecrtmode;
writeln(' Back in CRT-Mode!  Thanx for using PHL products, GEE ;-)');
{clrscreen;}
END.