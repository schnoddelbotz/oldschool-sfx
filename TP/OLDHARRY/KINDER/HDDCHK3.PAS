Program Startup;
USES CRT,DOS;
VAR a,b,c,d,e,x,f,g,h:real;
                  y:integer;
                  s:string;
Label syntxinf,ent,contd;
BEGIN;
clrscr;
window(1,1,40,12);textbackground(15);clrscr;
window(2,2,39,11);textbackground(8);clrscr;
writeln;
textcolor(4);
writeln(' BootUp  HDD-Space Checker by PôL');
writeln(' =================================');
writeln(' Info: ---->    Diese Version von ');
writeln('   HDDCHK ist auf 3  installierte ');
writeln('   Festplatten ausgelegt. Wer was ');
writeln('   andres will: Lies HHDCHKx.DOC  ');
writeln;textcolor(5);
writeln(' Reading HDD informations.........');
textcolor(9);
f:=diskfree(3)/1000000;g:=diskfree(4)/1000000;h:=diskfree(5)/1000000;
writeln('   Drive C: ',f:3:2);writeln('   Drive D: ',g:3:2);writeln('   Drive E: ',h:3:2);
writeln('--------------------------------');
a:=diskfree(3)/disksize(3);b:=diskfree(4)/disksize(4);x:=diskfree(5)/disksize(5);
c:=a*100;d:=b*100;e:=x*100;
writeln('   Drive C: ---> ',c:3:2);
writeln('   Drive D: ---> ',d:3:2);
writeln('   Drive E: ---> ',e:3:2);
for y:=7 to 9 do
BEGIN;
 gotoxy(27,y);writeln('% free');
END;
FOR y:=3 to 5 DO
 BEGIN;
  gotoxy(26,y);writeln('MB free');
 END;
gotoxy(14,10);textcolor(4);
writeln('Total ',f+g+h:3:2,' MB free.');
gotoxy(30,1);writeln('done.');
window(1,1,80,25);gotoxy(1,12);textbackground(white);
writeln('   Main Memory: ',maxavail/964+4:3:1,' (',memavail/988+4:3:1,') kB free');
textcolor(7);textbackground(black);
END.