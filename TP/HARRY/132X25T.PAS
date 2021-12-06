uses crt;
var x:integer;
BEGIN
clrscr;
asm
mov ah,4fh
mov al,02h
mov bx,113h
int 10h
end;
writeln('132x50xText');
for x:=1 to 100 do begin textcolor(x);write(' hallo! ');end;
readln;
END.