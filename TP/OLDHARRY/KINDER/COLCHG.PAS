Program BarMhz;
{ Changes your Textcolor and Textbackground - also Random available !}
USES CRT;
Label beg;
VAR X :integer;
    a :char;
    r :real;
BEGIN
beg:
RANDOMIZE;
clrscr;
{window(3,3,40,12);}
writeln('       SUPER - MENUE');
writeln;
writeln('    a.  Change  Textcolor');
writeln('    b.  Change  Textbackground');
writeln('    c.  Textcolor       Random');
writeln('    d.  Textbackground  Random');
writeln('    e.  BackGr & TxtClr Random');
writeln;
writeln('    x.  E X I T - Q U I T  !!');
a:=readkey;
if a='x' then exit;
if a='a' then
begin
write(' Enter a number (usually 0-15): ');readln(x);
textcolor(x);
goto beg;
end;
if a='b' then begin
write(' Enter a number (usually 0-15): ');readln(x);
textbackground(x);
goto beg;
end;
if a='c' then begin
textcolor(random(15));goto beg;
end;
if a='d' then begin
textbackground(random(15));goto beg;
end;
if a='e' then
textbackground(random(15));textcolor(random(15));
goto beg;
gotoxy(1,15);
{window(1,1,80,25);}
END.