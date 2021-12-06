var x:integer;
BEGIN
asm
mov ah,4fh
mov al,02h
mov bx,117h
int 10h
end;
writeln('1024x768x64k');
readln;
END.