{8192 war Pascal} {61000=$ war BIOS !!!-32000 bis 32000} {max 65535:65535 = $10000:$10000}
{spalten: $0040:$004a  $0040:$0051}
uses crt,jantools;
Var x:integer;
   ch:char;
    i,j:longint;
   jo:real;
label cont;

BEGIN
textmode(co80+font8x8);
for i:=000 to 42000 do begin {i:=0}
{jo:=0; while jo < 65535 do begin inc jo}
  x:=MEM[$ee48:i];
  if (x>31) and (x<127) then begin write(chr(x));inc(j);end;

  if j>3838 then begin textcolor(15);writeln;writeln('press any key, q quit');ch:=readkey;
  if (upcase(ch)='Q') or (ch=#27) then exit;j:=0;textcolor(7);end;


cont:
 end;
textcolor(15);
writeln;writeln(' Press any key to exit');
ch:=readkey;

dcls(30);


END.