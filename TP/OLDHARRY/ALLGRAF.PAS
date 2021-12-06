Program TheWaiter;
Uses Crt,Graph;
Var grd,grm,x,y,from,z,too:integer;

BEGIN;

clrscr;
detectgraph(grd,grm);
initgraph(grd,grm,'d:\tp\bgi\');
settextstyle(defaultfont,horizdir,5);
from:=1;too:=14;

REPEAT

for x:=from to too do begin;
setcolor(x);
circle(y,x,2);
y:=y+1;
if y>600 then begin y:=1;from:=from+5;too:=too+4;end;
too:=too+1;

end;

UNTIL Keypressed;

end.