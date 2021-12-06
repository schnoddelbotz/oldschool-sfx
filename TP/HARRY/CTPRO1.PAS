BEGIN
asm
mov AH = 4Fh
mov AL=00h
ES:DI
end;
Vesainfoblock=record
 VESASignature : ARRAY[0..3] OF CHAR;
 VESAVersion   : WORD;
 OEMStringPtr  : PChar;
 Capabilities  : Longint;
 VideomodePrt  : Pointer;
 Totalmemory   : WORD;
 Reserved      : ARRAY[1..242] OF MODE;
END;
asm
AX
end;
END.