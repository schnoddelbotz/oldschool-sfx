Program WahrscheinlichkeitNR1;
Uses Crt;
Var x:integer;
      e0,e1,e2,e3,e4,e5,e6:real;
                   y,z,zae:real;
                        ch:char;
BEGIN
RANDOMIZE; {Install Random-Processor}
zae:=0;

REPEAT
 y:=(RANDOM(6))+1;
 write( y:2:0 );
  zae:=zae+1;
  IF y = 0 then e0:=e1+1;
  IF y = 1 then e1:=e1+1;
  IF y = 2 then e2:=e2+1;
  IF y = 3 then e3:=e3+1;
  IF y = 4 then e4:=e4+1;
  IF y = 5 then e5:=e5+1;
  IF y = 6 then e6:=e6+1;
UNTIL Keypressed;

{Auswertung}
writeln;
writeln('Es wurden ',zae:10:0,' Mîglichkeiten geprÅft.');writeln;
writeln('Zahl        HÑufigkeit');
writeln(' 0           ',e0:10:0);
writeln(' 1           ',e1:10:0);
writeln(' 2           ',e2:10:0);
writeln(' 3           ',e3:10:0);
writeln(' 4           ',e4:10:0);
writeln(' 5           ',e5:10:0);
writeln(' 6           ',e6:10:0);
writeln(e0+e1+e2+e3+e4+e5+e6:10:0);

ch:=readkey;
ch:=readkey;
END.