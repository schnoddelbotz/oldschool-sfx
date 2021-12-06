Program Liner;
Uses crt;
var x,y,z:longint;
        c:char;
      s,t:string;
        f:text;

BEGIN
clrscr;
assign(f,paramstr(1));reset(f);
window(1,1,80,50);textbackground(black);textcolor(7);clrscr;
write('Now at line...',x:10);

WHILE NOT EOF(f) DO BEGIN
window(1,1,80,1);textbackground(black);textcolor(white);
gotoxy(20,1);write(x:10);
inc(x);

window(15,3,65,17);textbackground(blue);textcolor(white);clrscr;
readln(f,s);
write(s);
delay(10);

if keypressed then begin c:=readkey;if c=#27 then exit;end;
END;

writeln;
writeln(' Access granted.');
delay(900);
END.