Program tester2;
uses jancrt,crt;
var x,y,z: integer;c:char;s:string;

begin
textmode(3+font8x8);
textbackground(blacK);textcolor(7);clrscr;
y:=1;
writeln('                           Colors useable with FOUT');
writeln('                           ========================');
textcolor(0);


for z:=1 to 255 do begin
 inc(y);
 str(z:3,s);
 fout(x*13+1,y+2,z,'  Color '+s+'  ');write(x);gotoxy(1,1);
 if y=48 then begin inc(x);y:=0;end;
 if z=127 then begin inc(x);y:=0;end;
end;
ch:=readkey;
clrscr;
end.
