Program FileOps;
Uses Crt;
Var           x,y,z:integer;
             f1,scr:text;
            outpf,n:string;
                 ch:char;
label fileerror,ent;
BEGIN
clrscr;
Write('Bitte den Namen der Datei angeben : ');readln(n);
write('Outputfile angeben : ');readln(outpf);
{$I-}
assign(f1,n);reset(f1);IF IORESULT=0 THEN writeln('FILE CHECK OK') else goto fileerror;
assigncrt(scr);rewrite(scr);
{$I+}
readln(f1);
flush(f1);

close(f1);
writeln(' Delay....');
delay(1000);
goto ent;
fileerror:
writeln (' Datei nicht gefunden !!! ');
goto ent;
ent:
END.