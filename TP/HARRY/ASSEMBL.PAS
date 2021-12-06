var x:integer;
BEGIN
asm
mov ah,4fh
mov al,02h
mov bx,104h
int 10h
end;
writeln('1024xx64k');
END.