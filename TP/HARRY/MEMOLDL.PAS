uses crt;
Var x:integer;
   ch:char;
    i,j:integer;
label cont;

BEGIN
textmode(co80+font8x8);
for j:=0 to 1 do
 for i:=0 to 32000 do begin
  x:=MEM[9437:i];  {spalten: $0040:$004a  $0040:$0051}
  if (x<27) or (X=127) then goto cont;
  if wherex>79 then inc(j);
  if j>47 then begin textcolor(15);writeln;writeln('press any key, q quit');ch:=readkey;
  if (upcase(ch)='Q') or (ch=#27) then exit;j:=0;textcolor(7);end;
  write(chr(x));
  cont:
 end;
textcolor(15);
writeln;writeln(' Press any key to exit');
ch:=readkey;




END.