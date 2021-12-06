Program MultiM3650CR;
Uses Crt,Dos;
Var x,y:integer;
     ch:char;
      f:text;
    str:string;

BEGIN
{++$I-++}
textmode(co80+font8x8);
clrscr;
write('  Multimeter.... initialisieren : ');
assign(f,'COM2');
rewrite(f);
{reset(f);}
str:='D';write(f,str);
x:=ioresult;

if x <> 0 then begin writeln('  Fehler ! (',x,')');writeln;
                     writeln('  Programm kann nicht fortgesetzt werden. Bitte eine Taste drÅcken.');
                     ch:=readkey;
                     exit;end;
if x  = 0 then begin writeln('  OK');end;

for x:=1 to 14 do begin
read(f);
write(f);
end;

close(f);


writeln;
writeln(' Delay ...');delay(3000);
END.
{fehler}