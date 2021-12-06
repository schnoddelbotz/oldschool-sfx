BEGIN
write(' Press [return] to quickboot (only in mode without aspi)');readln;
asm
int 19h
end;
END.