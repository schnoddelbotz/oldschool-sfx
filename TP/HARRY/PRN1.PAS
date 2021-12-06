Program UsePrinter;
uses crt;
var    x,y,z: integer;     {Variablen zum Berechnen}
          ch:char;
         str,all:string;
var prn:text;              {Variablen fÅr Dateizuweisungen}

label beg,ent;

BEGIN
clrscr;
assign(prn,'LPT1');rewrite(prn);

beg:
clrscr;
writeln;
writeln('        Drucker-Schriftarten setzen');
writeln(' Kursivtext setzen  ................... k ');
writeln(' Fetten Text setzen  .................. f ');
writeln(' Text CG Times setzen  ................ c ');
writeln(' Text unterstrichen setzen  ........... u ');
writeln(' Seitenauswurf ........................ ! ');
writeln(' E.N.D.E  ........................... [ESC]');
writeln;
writeln;
write('    Your choice : ');ch:=readkey;

if ch=#27 then begin exit;end;

if ch='1' then begin
clrscr;
writeln(' Enter your text (max 255 char) ...... enter when done');
writeln(' -----------------------------------------------------');writeln;
readln(str);
goto beg;
end;

if upcase(ch)='K' then begin
write(prn,#27,#40,#115,#49,#83);
writeln;writeln(' Kursiv ! '); delay(500);
goto beg;
end;

if upcase(ch)='F' then begin
write(prn,#27,#40,#115,#51,#66);Writeln;
writeln;writeln(' Fett ! '); delay(500);
goto beg;
end;

if upcase(ch)='C' then begin
write(prn,#27,#40,#115,#52,#49,#48,#49,#84);Writeln;
writeln;writeln(' Gothic ! '); delay(500);
goto beg;
end;

if upcase(ch)='U' then begin
write(prn,#27,#38,#100,#49,#68);Writeln;
writeln;writeln(' Unterstrichen ! '); delay(500);
goto beg;
end;

if ch='!' then begin
write(prn,#12);
goto beg;
end;



writeln(' bye.');

end.