Program REP;
uses crt;
var ch:char;
     x:integer;
procedure a;begin
textbackground(7);textcolor(red+blink);write('þ');
end;

procedure b;begin
textbackground(red);textcolor(7+blink);write('þ');
end;


BEGIN
clrscr;

for x:=1 to 49 do begin
if x mod 2 = 0 then begin
 a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;
 a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;
end else begin
 b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;
 b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;
end;
end;

 a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;
 b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;

ch:=readkey;
textbackground(blue);
clrscr;
textcolor(yellow);
writeln('textattr :',lo(textattr));
textcolor(red);
writeln('textattr :',lo(textattr));
textcolor(black);
gotoxy(1,1);x:=textattr;gotoxy(10,10);write(' an 1,1 :',x);
ch:=readkey;
END.