uses crt;
Var x:integer;
   ch:char;
   i,j:integer;

BEGIN
textmode(co80+font8x8);
for i:=0 to 15 do
 for j:=0 to 15 do begin


x:=MEM[$0040:i*16+j];  {spalten: $0040:$004a}  {$0040:$0051}
writeln(i*16+j,'  =  ',x);
ch:=readkey;


end;

END.