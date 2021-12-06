Program TheWaiter;
Uses Crt,Graph;
Var grd,grm,x,y,max:integer;

BEGIN;

clrscr;
detectgraph(grd,grm);
initgraph(grd,grm,'d:\tp\bgi\');
y:=25;max:=480;

REPEAT

  FOR X:=50 to max do begin
  setcolor(x);
  circle(y,x+1,25);
  setcolor(black);
  circle(y,x,25+1);
  if x=480 then setcolor(green);
  END;
    y:=y+50;
    if y   > 650 then begin y:=25;max:=max-35;end;
    if max < 49  then begin y:=25;max:=480;   end;

UNTIL Keypressed;
end.