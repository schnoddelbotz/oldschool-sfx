Program HDDCHK; { hi guys out there.. greetx from phl}
USES Crt,Dos;
Var x:integer; {val}
    pro:real;
     ch:char;
BEGIN
{take this away !!!!!textbackground(black);clrscr;do it!!!!!}
clrscr;
window(42,14,72,22);textbackground(black);clrscr;textcolor(7);
for x:=1 to 248 do begin write('±');end;
window(40,13,70,20);textbackground(blue);clrscr;
clrscr;
writeln;textcolor(15);
writeln(' Copyright by PHL 95');
writeln(' Reading HDD Infos...');writeln;
writeln(' DRIVE  FREE SPACE   %%%%%');writeln;
writeln('  C:     ',(diskfree(3)/1000000):4:2,' MB',( diskfree(3)/disksize(3)*100 ):8:2);
writeln('  D:     ',(diskfree(4)/1000000):4:2,' MB',( diskfree(4)/disksize(4)*100 ):8:2);
writeln('  ------------------------');
pro:= (diskfree(3)+diskfree(4)) / (disksize(3)+disksize(4));
writeln('  BOTH   ',((diskfree(3)+diskfree(4))/1000000):4:2,' MB',(pro*100):8:2);
window(1,1,80,25);
gotoxy(1,1);
ch:=readkey;
END.