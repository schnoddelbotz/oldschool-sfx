uses crt;
var x:integer;
BEGIN
clrscr;
sound(200);delay(100);nosound;


asm
mov ah,4fh
mov al,02h
mov bx,117h
int 10h
end;
sound(400);delay(100);nosound;
writeln('800x600x64k');
textcolor(19);
writeln('!');
writeln('ich hasse kleinkinder');
for x:=1 to 30 do begin textcolor(x);writeln('1');end;

sound(80);delay(100);nosound;
delay(1000);
END.