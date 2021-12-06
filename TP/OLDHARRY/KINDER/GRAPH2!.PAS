Program TheWaiter;                      {programmed by phl}
Uses Crt,Graph;
Var grd,grm,x:integer;
      c:char;                           {remove this line / compiled}
procedure drci;BEGIN;circle(10,10,3);END;


BEGIN;

clrscr;
detectgraph(grd,grm);
initgraph(grd,grm,'d:\tp\bgi\');

FOR X:=1 to 239 do begin
setcolor(red);
circle(x+100,x,x);
{delay(20);}
setcolor(blue);
if x=239 then setcolor(white);
circle(x+99,x,x);
END;

c:=readkey;
end.