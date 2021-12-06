Program NoName;
uses crt,jancrt;
var                    x,y,z:integer;
                          ch:char;
                           s:string;


BEGIN
clrscr;

for x:=1 to 15 do begin
  for y:=0 to 7 do begin
  sc(x+blink,y);write(' þ ');
  end;
 writeln;
end;

ch:=readkey;
END.