Program BarMhz;
{ This program shows your (possibly not real) frequency of your CPU}
USES CRT;
VAR X :integer;
BEGIN
textbackground(0);
randomize;
clrscr;
textcolor(4);window(5,5,75,14);textbackground(7);
 for x:=150 to 904 do
 begin;
 textcolor(random(15));
 write(' -=66 Mhz - Super Fast Processor=-  ');
 sound(random(4000));delay(2);
 nosound;
  end;
write('  -=66 Mhz S');
delay(1000);
textcolor(white);textbackground(black);
END.