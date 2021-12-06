uses crt;
Var X,m:integer;
    ch:char;
BEGIN
m:=10;
for x:= 1 to 1000 do begin
if m<2 then m:=3;
clrscr;write(' FREQ.: ',x,' DLEAY : ',m);
if keypressed then ch:=readkey;
if ch=#27 then exit;
if ch='+' then m:=m+1;
if ch='-' then m:=m-1;
if ch=' ' then m:=m;
sound(x);
delay(m);
nosound;
end;
nosound;
end.