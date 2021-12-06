Program Chrspsec;
Uses Crt,Dos;
Var   x,y:integer;

      h:longint;
      f:text;
     yo:string;
     ch:char;
 hour,minute,second,sec100:word;
BEGIN
clrscr;
gettime(hour,minute,second,sec100);
x:=second;
writeln('Zeit zum Beginn ',x);

 while (second-x) < 1 do begin
gettime(hour,minute,second,sec100);
  {gotoxy(5,5);  write(second);}
  write('!');inc(h);write('-');inc(h);write(' ');inc(h);

 end;

writeln;textcolor(green);
writeln(' Chars per second  :',h/1:5:0);
delay(2000);
END.