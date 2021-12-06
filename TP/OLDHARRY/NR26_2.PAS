Program Nr26;
Uses Crt;
Var x:integer;
    z:real;
    c:char;
    f:text;
    n:string;
BEGIN;
clrscr;
Writeln(' Wohin mit den Ergebnissen? (Bildschirm/Datei) ');c:=readkey;
{ Geometrie 2 - S.285 Nr. 26 }
CASE upcase(c) of
  'B' : BEGIN write(' Ausgabe auf Bildschirm! ');assignCrt(f);rewrite(f);
              delay(1000); END;
  'D' : BEGIN write(' Dateiname: ');read(n);
              assign(f,n);ReWrite(f);END;
END;

for x:=1 to 360 do BEGIN
 z:=72*pi*sqr(x/360)*sqrt(1-(sqr(x/360)));
 writeln(f,' Fuer Phi mit ',x:3,' betraegt das Volumen ',z:2:8);
end;
if upcase(c)='D' then close(f);
END.