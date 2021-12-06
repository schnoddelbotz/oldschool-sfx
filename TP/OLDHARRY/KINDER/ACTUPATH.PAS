Program test;
Uses DOS,crt;
Var x:integer;
    s,c:string;

BEGIN
 For x:=3 to 6 do BEGIN
 if x=3 then c:='C';
 if x=4 then c:='D';
 if x=5 then c:='E';
 Getdir(x,s);
 write(s, '  º  ');
 END;
END.