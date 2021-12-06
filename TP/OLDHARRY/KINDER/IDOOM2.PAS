Uses crt;
VAR x:integer;
BEGIN
clrscr;
writeln(' PKSFX ver 7.9 (c) by PHL. FAST !! ');
writeln;
writeln('  Processing Archive: DOOM2.ZIP');
writeln;writeln;
write(' DOOM2.WAD ');
for x:=1 to 540 do begin write('.');delay(4);end;
writeln('done.');writelN;
write(' DOOM2.EXE ');for x:=1 to 170 do begin write('.');delay(4);end;
writeln('done.');writeln;
write(' PRGFILS.ALL');for x:=1 to 280 do begin write('.');delay(4);end;
writeln('done.');writeln;
writeln('  14 Files - 15 MB done. (c) by PHL');
writeln('  Writing files to disk....');sound(80);delay(5000);nosound;
writeln('  ;-) THAT WUZ COOOOOL..... DO YA FUCKIN ASSHOLE HAVE A P5 OR WHAT?');
END.