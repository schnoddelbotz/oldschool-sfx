Program tets;
uses crt;
Var x,y,z :integer;
        s :string;
        sa:array[1..20] of string;
        sb:array[1..20] of char;
        ch:char;
BEGIN
clrscr;

sa[1]:=' Die erste  ';sb[1]:='a';
sa[2]:=' Die zweite ';sb[2]:='b';
sa[3]:=' Die dritte ';sb[3]:='c';

for x:=1 to 3 do begin
writeln(sa[x],' ist immer ',sb[x]);
end;

if sa[1]>sa[2] then begin end;



writeln(^M^J^J^J,'Ende !');
ch:=readkey;
END.