Program WahrscheinlichkeitNR1;
Uses Crt,graph;
Var                 x,y,col:integer;
                     ch,aus:char;
                    grd,grm:integer;


label start,ent;
BEGIN
detectgraph(grd,grm);
initgraph(grd,grm,'d:\tp\bgi\');
settextstyle(defaultfont,horizdir,2);

{----------Grafik-Grundaufbau des Monis--------------}
line(1,479,639,479);line(1,1,1,479);line(1,1,639,1);line(639,1,639,479);
settextstyle(0,0,1);moveto(300,460);outtext(' Please wait while building up screen... ');
x:=3;y:=3;
start:
REPEAT
putpixel(x,y,col);
x:=x+1;col:=col+1;
if x=637  then begin y:=y+1;x:=3; end;
if col=15 then col:=1;
UNTIL y>477;

moveto(50,10);
setcolor(0);settextstyle(0,0,3);outtext('-GFX Performance Test-');
moveto(250,200);outtext('done.');
moveto(150,300);outtext('press any key...');
ch:=readkey;


END.