Program SDfo;
uses crt,jancrt;
var feld:array[1..8000] of byte;
      ch:char;
      x,z,y,wos,colat:integer;
      s,ss:string[5];



BEGIN
textmode(259);
textbackground(cyan);textcolor(red);clrscr;
writeln(^m^j'yo');

winshdw(10,10,20,10,blue);
ch:=readkey;
winshdw(10,10,20,10,blue);
ch:=readkey;
winshdw(10,10,20,10,blue);
ch:=readkey;
winshdw(10,10,20,10,blue);
ch:=readkey;
winshdw(10,10,20,10,blue);
ch:=readkey;
winshdw(10,10,20,10,blue);
ch:=readkey;


END.
{restore:move(feld,ptr($B800,0)^,8000);}
