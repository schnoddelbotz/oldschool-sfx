Program ScrSvr;
Uses CRT;
 VAR w,X,y,z : Integer;
           l : real;

BEGIN
textbackground(white);
clrscr;
textbackground(black);
Writeln('screen saver for commandline - by phl');
z:=1;
y:=1;
window(1,1,80,25);
REPEAT
randomize;
FOR x:=1 to 25 do begin
 z:=z;
 lowvideo;
 textbackground(6);
 textcolor(x);
 writeln('  ');
 delay(1);
 clrscr;
 highvideo;
END

UNTIL Keypressed;
END.
