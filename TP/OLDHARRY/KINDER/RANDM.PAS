Program MINE;
USES Crt;
VAR x:integer;
Begin
clrscr;
RANDOMIZE;
textbackground(Random(25));textcolor(Random(25));
window(Random(25),Random(80),Random(25),Random(80));
repeat
     write('Hello Yo dirty Motherfucka ');
until keypressed;
END.