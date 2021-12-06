Program Startup;
USES CRT,DOS;
{This Programs shows you your actual sysinfo at startups.}
BEGIN;
clrscr;
randomize;
window(1,1,70,20);textbackground(random(15));clrscr;
window(2,2,69,19);textbackground(random(15));clrscr;
writeln;
textcolor(random(15+15));
writeln(' Reading System informations.........');delay(1000);
gotoxy(2,2);textcolor(15);
write('HDDs...........                       MEM.........                 ');
writeln(' Drive C: ',diskfree(3),' bytes frei');
writeln(' Drive D: ',diskfree(4),' bytes frei');
writeln(' Drive E: ',diskfree(5),' bytes frei');
writeln;
writeln('Laufwerk C: also',Disksize(3)/Diskfree(3),'%...');
readln;
END.