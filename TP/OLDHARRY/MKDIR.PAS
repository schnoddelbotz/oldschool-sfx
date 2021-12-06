Program UsesAPP;
Uses dialogs,crt,views,dos;
Var x,delta:integer;
   ch:char;
    a:string;
BEGIN
textbackground(0);textcolor(7);
clrscr;
writeln('  Der ultimative Verzeichnisersteller...');
writeln('Benutzte DOS-Version      : ',Dosversion);
writeln('Freier Hauptspeicher      : ',maxavail/1000:3:3,' kB');
delay(1000);
clrscr;
gotoxy(1,1);
textbackground(blue);clreol;
write('  Verzeichniserstellung f걊 WORD-Verzeichnisse - (c) 1995 by PHL for his MUM');
gotoxy(1,25);clreol;
window(1,2,80,24);textbackground(white);clrscr;textcolor(red);writeln;writeln;writeln;
writeln('        旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커');
writeln('        � Verzeichniserstellung f걊 WORD-Verzeichnisse

ch:=readkey;
END.