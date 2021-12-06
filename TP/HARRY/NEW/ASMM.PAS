Program NoName;
uses crt;
var                    x,y,z:integer;
                          ch:char;
                           s:string;

BEGIN
clrscr;write(' Calling INT 19h !!!');

asm
ah = 19h
int 19h
end;

write(' called it.');
ch:=readkey;
END.