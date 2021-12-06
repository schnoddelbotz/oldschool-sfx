var x:integer;
BEGIN
asm
mov ah,4fh
mov al,02h
mov bx,111h
int 10h
end;
writeln('640x480x64k');
END.