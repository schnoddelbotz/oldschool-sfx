Program Readfile;
Uses Crt,Dos;
Var f:text;
    h:string;
   dateiname:string;
   ch:char;
BEGIN;
clrscr;
write(' Datei angeben: ');readln(dateiname);
assign(f,dateiname);
reset(f);
{writeln(f,' Jan ist doof !');}

WHILE not seekeof(F) DO BEGIN
readln(f,h);
writeln(h);
END;

close(f);
ch:=readkey;
END.