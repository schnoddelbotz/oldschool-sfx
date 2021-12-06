Program HDDCHK; { hi guys out there.. greetx from phl}
USES Crt,Dos;
Var x,x1,y1,y2:integer; {val}
    max,may:integer;
    pro:real;
     ch:char;
label error,ent;
BEGIN

if paramcount < 3 then goto error;
val(paramstr(1),x1,x1);
if x1>48 then goto error;
val(paramstr(2),y1,y1);
if y1>16 then goto error;
val(paramstr(3),y2,y2);
if y2>24 then goto error;

window((x1+2),(y1+1),(x1+32),(y1+9));textbackground(black);clrscr;textcolor(7);
for x:=1 to 248 do begin write('±');end;
window(x1,y1,(x1+30),(y1+7));textbackground(blue);clrscr;
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
goto ent;
error:
writeln;
writeln(' SYNTAX :');
writeln(' DISKSPACE x1 y1 y2');
writeln;
writeln(' X1 = X-Position des Rahmens (MAX. = 48)');
writeln(' Y1 = Y-Position des Rahmens (MAX. = 16');
writeln(' Y2 = Y-Ausgangs-Pos. wo das Prompt landet. (MAX. = 24');
writeln;
writeln(' Thanx for using, phl.');
ent:
gotoxy(1,y2);
END.