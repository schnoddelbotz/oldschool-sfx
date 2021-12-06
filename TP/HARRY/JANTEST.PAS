Program Testforjans;
uses jantools,crt;
var ch:char;
x,z:integer;
{    s,z:integer;}
BEGIN
textmode(font8x8+3);
clrscr;
ucls(5,1);


writeln(' Spalten : ',MEM[$0040:$004a]);
writeln(' Zeilen  : ',MEM[$0040:$0084]);
ch:=readkey;
END.