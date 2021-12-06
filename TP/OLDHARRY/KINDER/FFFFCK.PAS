Program NiceScreen;
USES Crt;
 VAR x:char;
 BEGIN
textbackground(black);clrscr;
window(1,1,80,1); textbackground(white);textcolor(blue);clrscr;
window(1,2,80,24);textbackground(blue);textcolor(red);clrscr;
window(1,25,80,25);textbackground(white);textcolor(blue);clrscr;
gotoxy(1,1);write(' Wie komme ich zur BILDSCHIRM-Position (1,1) ?? ');
readln;
end.