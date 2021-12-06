Program Startup;
USES CRT,DOS;
VAR c,d,e:real;
{This Programs shows you your actual sysinfo at startups.}
BEGIN;
clrscr;
randomize;
window(1,1,40,10);textbackground(15);clrscr;
window(2,2,39,9);textbackground(8);clrscr;
writeln;
textcolor(5);
writeln(' BootUp  HDD-Space Checker by PôL');
writeln;
writeln(' Reading HDD informations.........');
textcolor(9);
writeln(' Drive C: ',diskfree(3),' bytes frei');
writeln(' Drive D: ',diskfree(4),' bytes frei');
writeln(' Drive E: ',diskfree(5),' bytes frei');
writeln;
c:=disksize(3)/diskfree(3);
d:=disksize(4)/diskfree(4);
e:=disksize(5)/diskfree(5);
writeln('   Laufwerk C: also ',c:3:2,' %...');
writeln('   Laufwerk D: also ',d:3:2,' %...');
writeln('   Laufwerk E: also ',e:3:2,' %...');
window(1,1,80,25);gotoxy(1,11);
END.