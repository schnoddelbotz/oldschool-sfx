Program jaja;
uses jantools,crt;
var x,y,backupx,backupy:integer;
          c:^byte;

BEGIN
{randomize;
textmode(3+font8x8);
ucls(1,0);
gomaxy(givemaxx-34);writec(8,7,'    Press any key to continue ... ');
gotoxy(1,1);textbackground(9);writeln;write(' ');
repeat
x:=random(30);y:=random(30);
slowdisplr('                         This Program is  ....                                ',x,y,4);write(#8);delay(0);
slowdisprl('                         *S*H*A*R*E*W*A*R*E*                                 ',x+1,y+1,4);delay(0);
until keypressed;}


for x:=0 to 102 do begin
c:=ptr($b800,x*2);
write(chr(c^));
end;
delay(2000);

END.