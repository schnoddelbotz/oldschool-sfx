Program ExplodingWindows;
Uses Crt;
Var x,y,z,x1,x2,y1,y2,dlay,fromm,too:integer;
       ch:char;


Procedure Explodewin(x1,y1,x2,y2,dlay:integer);
begin

fromm:=x2;too:=x1;
for y:=y2 downto y1 do begin
window(1,25,80,25);textbackground(green);clrscr;write('WINDOW(',x1,',',y,',',x2,',',y2,')');

if fromm>too then dec(fromm);
window(fromm,y,x2,y2);clrscr;delay(1200);



end;



end;








BEGIN
textbackground(8);textcolor(15);
clrscr;
Writeln(' The window is exploding ...');


textbackground(blue);explodewin(3,3,40,15,130);


textbackground(black);
window(1,1,80,24);
gotoxy(1,25);write(' Press any key to continue ! ');
ch:=readkey;
END.