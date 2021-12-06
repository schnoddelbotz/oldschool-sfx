Program BackforByte;
Uses Crt;
Var x,y:integer;
    feld:array[1..4000] of byte;
      f1:text;
BEGIN

textcolor(7);textbackground(8);
clrscr;



writeln('........KLEINER GOTTVERDAMMTER TEST !!!...........');
writeln('...............Ich wies nich....................');
writeln('.......................fghfghfghfghfghfghfg........');

move(ptr($B800,1)^,feld,4000);


writeln('                Backuped ....  CLS follows              ! ');delay(1000);
clrscr;



move(feld,ptr($B800,1)^,4000);


writeln('Now it is back from Mem ');

delay(1000);

end.
