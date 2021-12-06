Program READ_INI;
uses crt;
  var f:text;
      c:char;
      x,qx,qy,code:integer;
      s,s2:string;
BEGIN
clrscr;textcolor(7);
writeln(' Reading FON2.INI...');assign(f,'fon2.ini');reset(f);writeln;textcolor(white);

repeat
readln(f,s);

if length(s)>0 then begin

  if s[1]+s[2]+s[3]+s[4]+s[5]='QUITY' then begin
  writeln(' Quitting with ... Y = ',s[7],s[8]);
  s2:=s[7]+s[8];val(s2,qy,code);
  end;

end;

until eof(f);



if qy=25 then textmode(3);
if qy=50 then textmode(3+font8x8);

writeln(' Screenmode read from INI-File: 80*',qy);
close(f);
END.