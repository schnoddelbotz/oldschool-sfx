Program WahrscheinlichkeitNRx;
Uses Crt,graph,dos;
Var                    fd,d,x,m,s,xpix:integer;
                                ch,aus:char;
                                path:string;
                             grd,grm:integer;
                             jan,tomax:longint;

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
write(' Pfad zu EGAVGA.BGI angeben (Standard: c:\tp\bgi) : ');textcolor(15);Read(path);
if path='' then BEGIN gotoxy(53,1);textcolor(15);writeln('C:\TP\BGI');
path:='c:\tp\bgi\';end;textcolor(7);


{$I-}       {Compilerbefehl: IOPrÅfung: AUS !}
if fsearch('egavga.bgi',path)='' then BEGIN
textcolor(15);
writeln;
writeln(' FEHLER:');
writeln(' Die  Datei EGAVGA.BGI,  die  zur  Grafikausgabe  benîtigt  wird,');
writeln(' konnte nicht gefunden werden. Bitte prÅfen Sie Ihre Pfadangabe !');
halt;end;
{$I+}        {I/O: AN !}
write(' Bitte Anzahl der Pixel angeben :');read(tomax);
{     SWITCH TO VGA          }
detectgraph(grd,grm);
initgraph(grd,grm,path{'d:\tp\bgi\'});
settextstyle(defaultfont,horizdir,1);
outtext(' PHL GFX. Wie Silicon GFX. Blo· halt nicht so gut.');

{----------Grafik-Grundaufbau des Monis--------------
setlinestyle(1,0,0);
line(10,450,620,450);moveto(600,450);outtext('x');moveto(621,447);outtext(#26);
line(10,450,10,50);moveto(15,50);outtext('y');moveto(7,43);outtext(#24);
settextstyle(0,0,1);
moveto(1,400);outtext('1');moveto(1,350);outtext('2');
moveto(1,300);outtext('3');moveto(1,250);outtext('4');
moveto(1,200);outtext('5');moveto(1,150);outtext('6');


{==================== eigentlicher Programmbeginn ===================}
xpix:=1;
start:
RANDOMIZE;
{________________ Action, man !_____________}
outtextxy(510,470,'Treiber: ');outtextxy(575,470,getdrivername);


for jan:= 1 to tomax do begin
  putpixel(random(640),random(480),jan);
 if keypressed then begin ch:=readkey;if ch=#27 then exit;end;
 xpix:=xpix+1;
end;
setcolor(15);
moveto(200,470);outtext(' Bitte eine Taste drÅcken...');ch:=readkey;


ent:
restorecrtmode;
writeln(' Back in CRT-Mode!  Thanx for using PHL GFX products, GEE ;-)');
delay(100);
{clrscreen;}
END.