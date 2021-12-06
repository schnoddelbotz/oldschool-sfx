Program NoName;
uses crt,mgcomtp0;
var                    x,y,z:integer;
                          ch:char;
                           s:string;

BEGIN
clrscr;
delay(500);
write(' Okay ... resetting ...');opencom(2,ports);writeln(' done.');

repeat
readch(1);
until keypressed;

Write(' Did it all ...');write(' closing port ...');closecom(1);write(' done.');
ch:=readkey;
END.