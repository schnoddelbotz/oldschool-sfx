Program MultiM3650CR;
Uses Crt,Dos;
Var x,y:integer;
     ch:char;
      f:text;

      meldung:string;
BEGIN
{$I-}
textmode(co80+font8x8);
clrscr;
write(' Multimeter.... initialisieren : ');
assign(f,'COM2');
append(f);
writeln(f,'ATZ');
close(f);

gotoxy(17,2);writeln('Fehler : ',IOResult);
writeln;
writeln(' Delay ...');delay(3000);
END.
{fehler}