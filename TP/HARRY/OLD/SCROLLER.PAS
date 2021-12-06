Program ScrollBar;
Uses Crt;
Var
        a,b:integer;
        ch:char;

BEGIN
textmode(font8x8+3);
window(1,1,80,50);clrscr;

window(5,5,18,12);
textbackground(blue);
clrscr;

writeln;
writeln(' DATEI__1.TXT');
writeln(' DATEI__2.TXT');
writeln(' DATEI__3.TXT');
writeln(' DATEI__4.TXT');
writeln(' DATEI__5.TXT');
writeln(' DATEI__6.TXT');


window(19,6,20,11);textbackground(white);clrscr;
window(3,6,4,11);textbackground(white);clrscr;



textcolor(black);
window(19,6,20,11);write(chr(27));a:=wherey;
window(3,6,4,11);write(chr(26));

repeat

ch:=readkey;
 if ch=#0 then begin
   ch:=readkey;


   if ch=#72 then begin clrscr;
   window(19,6,20,11);clrscr;gotoxy(wherex,a-1);write(chr(27));
   window(3,6,4,11);gotoxy(wherex,a-1);write(chr(26));a:=wherey;end;


   if ch=#80 then begin clrscr;
   window(19,6,20,11);clrscr;gotoxy(wherex,a+1);write(chr(27));
   window(3,6,4,11);gotoxy(wherex,a+1);write(chr(26));a:=wherey;end;


 end;


until ch=#27;


{ch:=readkey;window(1,1,80,25);textbackground(black);

if ch=#0 then begin ch:=readkey;write(ord(ch));delay(500);end;}

END.