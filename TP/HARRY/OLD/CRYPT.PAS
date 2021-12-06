Program Crypt;
uses crt;
var x,y,z:integer;
    s1,s2,s3:string;
    c1,c2,c3:string;
          ch:char;
BEGIN
clrscr;
s1:='Jan Hacker';
s2:='H.v.Tett.Str.20';
s3:='78465 Konstanz';
writeln(' Data given ....');
writeln;writeln(s1);writeln(s2);writeln(s3);writeln;
writeln(' Now cryting ...');writeln;

for x:=1 to length(s1) do begin
c1:=s1[x]+'b'+c1;
end;

for x:=1 to length(s2) do begin
c2:=s2[x]+'b'+c2;
end;

for x:=1 to length(s3) do begin
c3:=s3[x]+'b'+c3;
end;


writeln(c1);writeln(c2);writeln(c3);



writeln;
write(' done. press any key.');
ch:=readkey;
end.