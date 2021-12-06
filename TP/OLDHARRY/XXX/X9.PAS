program x8;
uses crt,dos;




var t:char;
s:string; {verzeichnis}


begin
textmode(co80+font8x8);textbackground(0);textcolor(7);


writeln('Was soll installiert werden ? :  1,2,3');


write('Verzeichnis:');

readln(s);


textbackground(1);textcolor(11);

gotoxy(10,10);writeln('ÚÄÄÄÄÄÂÄÄÄÄÄÄ¿ ');
gotoxy(10,11);writeln('³ Ja  ³ Nein ³ ');
gotoxy(10,12);writeln('               ');
gotoxy(10,13);writeln('               ');


textbackground(0);textcolor(7);

t:=readkey;
{
if t='1' then exec('command.com','copy config1.sys ',s);
if t='2' then exec('command.com','copy config2.sys config.sys');
 }
end.