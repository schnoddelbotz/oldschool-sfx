Program REP;
uses jancrt,crt;
var ch:char;
     x:integer;
     s:string;
procedure a;begin
textbackground(7);textcolor(red+blink);write('Û');
end;

procedure b;begin
textbackground(red);textcolor(7+blink);write('Û');
end;
label cont;

BEGIN
textmode(3+font8x8);textbackground(1);clrscr;
gotoxy(10,10);
a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;
gotoxy(10,11);
b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;
for x:=12 to 34 do begin gotoxy(10,x);if x mod 2 = 0 then begin a;b; end else begin B;a end; gotoxy(68,x);
if x mod 2 = 0 then begin a;b; end else begin B;a end;end;gotoxy(10,35);
b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;
gotoxy(10,36);
a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;a;b;
fout(53,13,7,'             ');fout(52,14,7,'  IMPORTANT! ');fout(51,15,7,'             ');
window(30,29,60,31);textbackground(black);clrscr;textcolor(white);
s:=' Please not that this program   is *NOT* shareware !    It''s   spreadware.  If  you   don''t   spread it after a '+
' period of   5 days,your PC will blow  up   into pieces ! ';
for x:=1 to length(s) do begin if keypressed then begin ch:=readkey;goto cont;end;write(s[x]);delay(70);end;delay(400);
textcolor(7+blink);write('    # BOOM !!#');delay(800);


cont:
fout(60,47,15,' (press any key) ');
ch:=readkey;
END.