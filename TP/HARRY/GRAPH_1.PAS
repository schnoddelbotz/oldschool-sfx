
Uses crt;
Var x:integer;
    str:string;
     ch:char;


BEGIN

str:=('C:\COMM\TERMINAT\');

textbackground(7);
clrscr;
window(20,10,60,13);textcolor(yellow);textbackground(blue);clrscr;
textbackground(red);
gotoxy(3,2);
write('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');delay(500);
gotoxy(3,2);write(str);
gotoxy(length(str)+3,wherey);
ch:=readkey;

case ch of
 'j' : then begin write('j');end;
 #27 : then begin exit;end;
END;






gotoxy(10,3);textcolor(white);textbackground(blue);
writeln(' string jetzt:',str);
writeln('delay...');delay(2000);

END.
