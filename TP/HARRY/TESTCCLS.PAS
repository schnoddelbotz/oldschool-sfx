Program testCCLS;
Uses crt,Jantools;
var x,c:integer;
   ch:char;
begin
textmode(3+font8x8);
clrscr;
for x:=1 to 80*givemaxy-20 do begin
inc(c);if c=15 then c:=1;
textcolor(c);
write('x');

end;
delay(100);
write(' JAJAJA ');
dcls(10);
ch:=readkey;
end.