Program WahrscheinlichkeitNR1;
Uses Crt;
Var x,e1,e2,e3,e4,e5,e6,z:integer;
                    y:real;
BEGIN
RANDOMIZE; {Install Random-Processor}

 FOR x:=1 to 10000 DO BEGIN
 y:=RANDOM(7);
 write(y:4:0);

{ z:=(y:4:0);
 delay(0);
  CASE z OF BEGIN
  1 : BEGIN e1:=e1+1;
  2 : BEGIN e2:=e2+2;
  END;
             }
 END;

delay(1000);
END.