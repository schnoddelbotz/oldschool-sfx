Program TheWaiter;                      {programmed by phl}
Uses Crt,Graph;
Var grd,grm:integer;
      c:char;                           {remove this line / compiled}
BEGIN;

clrscr;
detectgraph(grd,grm);
initgraph(grd,grm,'d:\tp\bgi\');
circle(10,10,3);

c:=readkey;
end.