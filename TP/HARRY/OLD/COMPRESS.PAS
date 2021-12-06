Program Compressor;
Var f1,f2:text;
        s:string;
        x:integer;
BEGIN

assign(f1,'d:\tmp\kn-asc.txt');reset(f1);
assign(f1,'d:\tmp\kn-asc.S');rewrite(f1);

while not eof(f1) do begin
 readln(f1,s);
 writeln(s);
end;



end.