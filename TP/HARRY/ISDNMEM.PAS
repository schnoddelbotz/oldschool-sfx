uses crt;
Var x:integer;
   ch:char;
    j:integer;
    er:integer;
    i:longint;
label cont,ent;

BEGIN
j:=1;
textmode(co80+font8x8);
 FOR i:=24500 TO 58500 DO BEGIN
  x:=MEM[53000:i];  {spalten: $0040:$004a  $0040:$0051}
  if (x<27) or (X=127) then begin er:=1;goto cont;end;

  if wherex>79 then inc(j);
  if j>49 then begin textcolor(15);writeln;write('press any key, Q or ESC to quit');ch:=readkey;
               if (upcase(ch)='Q') or (ch=#27) then goto ent;
               j:=1;textcolor(7);writeln;end;

  write(chr(x));
  cont:
 if er=1 then begin sound(50);nosound;{textcolor(red);write('.');er:=0;textcolor(7);}end;

 END;

textcolor(15);
writeln;write(' Press any key to exit.... Total Main Memory: ',MemW[$40:$13],' kB.');
ch:=readkey;
ent:
textmode(co80);writeln('  READBIOS by PHL ;-) ');
END.