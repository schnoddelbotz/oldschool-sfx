Program MORSEN;       {by Jan Hacker - (c) 1995 - Ver. 0.195á}
Uses Crt,DOS;
Procedure LS;
BEGIN
sound(1000);delay(500);nosound;delay(100);
END;
Procedure SS;
BEGIN
sound(1000);delay(100);nosound;delay(100);
END;
Var a,b,c:char;
label start;
BEGIN
clrscr;
writeln('            READ THIS AND FUCK OFF :');
writeln;
writeln(' Morse-Programm M ™ S I - (c) by Jan the Hacker 1995');
writeln(' Version  0.195 á - Beta-Version - Do not distribute');
delay(1000);
start:
textbackground(white);textcolor(red);
clrscr;
writeln;
writeln(' M ™ S I - Automatic Morser - Quite easy to use - RTFM !');
writeln;textcolor(black);
writeln('   Press SPACE to morse in "freehand"-mode, or enter the char to send !');
writeln('   ESC exits. No Help available yet (DON`T cry... i`ll create it !)');
writeln('   Small Characters only !!!!!! (YET)');
a:=readkey;
if a=#27 then exit;
writeln('kurz kurz lang lang');ss;ss;ls;ls;goto start;
delay(1000);
END.