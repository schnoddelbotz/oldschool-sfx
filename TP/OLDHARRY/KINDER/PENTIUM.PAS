Program P5FailureViewer;
Uses Crt;
Var x,y,z:real;
      a:integer;
BEGIN;
writeln(' This program shows you the little Pentium Bug !');
writeln('  Just uses the formula   x-(x-y)*y');
FOR a:=1 to 20 do begin
randomize;
x:=a;
y:=a+20;
z:=x-(x-y)*y;
write(' Bei ihrem Prozessor ergibt ',x:1:0,'-(',x:1:0,'-',y:1:0,')*',y:1:0,' =');
writeln(' ',z:10:20);
delay(30);
end;
end
.