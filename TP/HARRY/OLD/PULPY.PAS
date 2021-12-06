Program pulpless;
Uses crt;
Var x,y,z:integer;
        s:string;
     c,ch:char;
    f1,f2:text;
BEGIN
clrscr;
assign(f1,'d:\temp\pulpcopy.phl');
assign(f2,'d:\temp\done_so_.far');
reset(f1);rewrite(f2);

while not eof(f1) do begin

readln(f1,s);

 for x:=1 to length(s) do begin
 if s[x]+s[x+1]='  ' then begin inc(z);delete(s,x,1);end;
 end;

writeln(f2,s);
{writeln(s);}
end;



writeln('found ',z,' doublespaces');





close(f1);close(f2);
ch:=readkey;
END.