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

            while (x+second) < 59 do begin
             gettime(hour,minute,second,sec100);
             gotoxy(5,5);
             write(sec100);
            end;

{textcolor(green);writeln;
writeln(h); delay(3000);}
END.