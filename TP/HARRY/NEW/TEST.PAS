uses crt;
Var ch:char;
begin
clrscr;

repeat
textcolor(7);
gotoxy(1,1);Writeln('Press any key!');ch:=readkey;
if ch=#0 then begin
ch:=readkey;writeln('Special key: ', ord(ch),'     ');end
else writeln('Usal char, it is ',ord(ch),'     ');

until ch=#27;

END.