Program Nr26;

Var x:integer;
    z:real;
BEGIN;

{ Geometrie 2 - S.285 Nr. 26 }

for x:=1 to 360 do BEGIN
 z:=72*pi*sqr(x/360)*sqrt(1-(sqr(x/360)));
 writeln(' FÅr ',#232,' mit ',x:3,' betrÑgt das Volumen ',z:2:8);
end;

END.