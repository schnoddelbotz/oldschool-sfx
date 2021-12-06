Program MultiM3650CR;
Uses Crt,Dos;
Var x,y:integer;
     ch:char;
      f:text;

      meldung:string;
BEGIN
{+++$I-+++}
textmode(co80+font8x8);
clrscr;
write(' Multimeter.... initialisieren : ');
assign(f,'COM2');
reset(f);
readln(f);
writeln(f);
close(f);
gotoxy(17,2);writeln('Fehler : ',IOResult);
writeln;
writeln(' Delay ...');delay(3000);
END.
{fehler}