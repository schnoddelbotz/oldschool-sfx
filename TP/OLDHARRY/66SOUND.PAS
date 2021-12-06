Program BarMhz;
{ This program shows your (possibly not real) frequency of your CPU}
USES CRT;
VAR X,y,z,u :integer;
BEGIN
randomize;
clrscr;
writeln(' Staring operation...');

 for x:=1 to 50 do
 begin;
 y:=random(14000);z:=random(100);u:=random(200);
 sound(y+100);delay(15);
 sound(z);delay(50);
 sound(u);delay(5);
 nosound;
 writeln(' X=',x:3,'  Y=',y:7,'  Z=',z:4,'  U=',u:4);
 end;

writeln(' Operation done. ');
write(' WELCOME TO PLANET TECHNO-SOUND !');
delay(1500);
textcolor(white);textbackground(black);
END.