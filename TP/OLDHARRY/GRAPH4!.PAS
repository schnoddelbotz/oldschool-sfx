Program TheWaiter;
Uses Crt,Graph;
Var grd,grm,x,y,max,z,a:integer;

BEGIN;

clrscr;
detectgraph(grd,grm);
initgraph(grd,grm,'c:\tp\bgi\');
settextstyle(defaultfont,horizdir,250);
y:=25;max:=480;
moveto(10,43);
setcolor(blue);
outtext('PHL');

REPEAT

  FOR X:=40 to max do begin
  setcolor(x);
  circle(y,x+1,25);
  setcolor(black);
  circle(y,x,25+1);
  if x=480 then setcolor(green);

END;

    y:=y+50;
    moveto(10,43);setcolor(1);outtext('PHL');
    if y   > 650 then begin y:=25;max:=max-35;end;
    if max < 49  then begin y:=25;max:=480;   end;

UNTIL Keypressed;
end.