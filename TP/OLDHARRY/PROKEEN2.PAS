Program NiceScreen;
USES Crt,dos;
 VAR x,p,h:integer;
     a,c,m,j:char;
     s,z:string;
 Label beg,errent,norment,break,goodent;
 BEGIN
beg:
textbackground(black);clrscr;
window(1,1,80,1); textbackground(white);textcolor(blue);clrscr;
for x:=490 downto 1 do write('          COMMANDER KEEN6 - Aliens Ate my Babysitter !        ');
window(1,2,80,24);textbackground(blue);textcolor(red);clrscr;
for x:=1 to 500 do write('    PHLs Installprogram    ');
window(1,25,80,25);textbackground(white);textcolor(blue);clrscr;
for x:=298 downto 1 do write('    (c) by PHL  ³  [ESC]  - Ende  ³  Taste - Weiter  ³  Game (c) by ID   ');
  for x:=19 to 14000 do sound(x);
  for x:=14000 downto 19 do sound(x);
  NoSound;
window(25,7,55,15);
textbackground(red);textcolor(white);
clrscr;
write('ÉÍÍÍÍÍÍIÍÍNÍÍFÍÍOÍÍÍ!Í!ÍÍÍÍÍÍÍ»');
write('º                             º');
write('º Mit  diesem  Programm  kann º');
write('º Commander  Keen 6  auf  die º');
write('º Festplatte  installiert     º');
write('º werden.  Um   fortzufahren  º');
write('º eine  Taste  drcken....    º');
write('º                             ½');
write('ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾¯¯');
gotoxy(9,8);
textbackground(white);textcolor(red);
write(' ESC ÷ ENDE ');
M:=readkey;
if M=#27 then exit;
window(1,2,80,24);textbackground(blue);textcolor(red);clrscr;
for x:=1 to 500 do write('    PHLs Installprogram    ');
window(10,4,73,20);
textbackground(lightgray);textcolor(black);
clrscr;
writeln;
writeln;
write('  Bitte den Kennbuchstaben des Diskettenlaufwerks angeben:  :');
gotoxy(60,3);textcolor(red);textbackground(green);write('°');
a:=readkey;gotoxy(60,3);write(a);if a=#27 then goto break;
textbackground(lightgray);textcolor(black);
write('                                                                    ');
write('  Bitte den Kennbuchstaben der Festplatte angeben:          :');
gotoxy(60,5);textcolor(red);textbackground(green);write(#176);
c:=readkey;gotoxy(60,5);write(c);if c=#27 then goto break;
textbackground(lightgray);textcolor(black);
writeln;writeln;
write('  Bitte Zielpfad angeben:');
gotoxy(26,7);textcolor(red);textbackground(green);write('°°°°°°°°°°°°°°°°°°°°°°°°°°');
gotoxy(18,8);textcolor(black);textbackground(lightgray);write('z.Bsp.: \GAMES\CK6');
gotoxy(26,7);textcolor(red);textbackground(green);readln(z);
textbackground(lightgray);textcolor(black);
window(1,2,80,24);textbackground(blue);textcolor(red);clrscr;
for x:=1 to 500 do write('    PHLs Installprogram    ');
window(10,4,73,20);
textbackground(lightgray);textcolor(black);
clrscr;
writeln;
writeln(' Nach Ihren Angaben wird das Spiel nun auf Laufwerk ',c,':');
writeln(' installiert, im Pfad ',c,':',z,' !');
writeln(' Die Install-Diskette liegt nach Ihren Angaben im Laufwerk ',a,': !');
delay(2000);
textcolor(16);
writeln;
writeln('         ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
writeln('         ³ Soll das Spiel jetzt nach Ihren Anagaben ³');
writeln('         ³ installiert werden ?      (J/n)          ³');
writeln('         ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
j:=readkey;
if j='n' then goto errent;
if j='N' then goto errent;
if j=#27 then goto break;
window(10,4,73,20);
textbackground(lightgray);textcolor(black);
clrscr;
writeln;
writeln('   Installation l„uft, bitte etwas Geduld.....');
writeln;
writeln(' --> Prfe auf ausreichenden Speicherplatz...');
IF c='c' then p:=3;if c='d' then p:=4;if c='e' then p:=5;if c='f' then p:=6;
IF c='C' then p:=3;if c='D' then p:=4;if c='E' then p:=5;if c='F' then p:=6;
if diskfree(p)<900000 then
begin
writeln('     Es  ist  zu  wenig  Speicherplatz  vorhanden,');
writeln('     um das Spiel auf Laufwerk ',c,': zu installieren!');
writeln('     Taste drcken....');
sound(220);
delay(1000);
nosound;
m:=readkey;
goto errent;
end;
write('      Es ist ausreichend Platz vorhanden (',diskfree(p),' byte)');
writeln;
write(' --> Erstelle Zielverzeichnis...');
s:=(c+':'+z);
mkdir(s);
writeln(' DONE.');
{$M 8000,0,8000}
write(' --> Kopiere Dateien...   0 %');
exec('C:\COMMAND.COM','/C COPY '+a+':keen6.exe '+c+':'+z+' > nul');
 if doserror=0 then
 BEGIN
 gotoxy(25,7);
 textcolor(16);
 write('10  % ');
 END;
exec('C:\COMMAND.COM','/C COPY '+a+':TIPS!.exe '+c+':'+z+' > nul');
 if doserror=0 then
 BEGIN
 gotoxy(25,7);
 textcolor(16);
 write('20  % ');
 end;
exec('C:\COMMAND.COM','/C COPY '+a+':A*.ck6 '+c+':'+z+' > nul');
 if doserror=0 then
 BEGIN
 gotoxy(25,7);
 textcolor(16);
 write('30  % ');
 end;
exec('C:\COMMAND.COM','/C COPY '+a+':d*.ck6 '+c+':'+z+' > nul');
 if doserror=0 then
 BEGIN
 gotoxy(25,7);
 textcolor(16);
 write('40  % ');
 end;
exec('C:\COMMAND.COM','/C COPY '+a+':g*.ck6 '+c+':'+z+' > nul');
 if doserror=0 then
 BEGIN
 gotoxy(25,7);
 textcolor(16);
 write('50  % ');
 end
 else writeln('Michi, tolle idee!');
exec('C:\COMMAND.COM','/C COPY '+a+':e*.ck6 '+c+':'+z+' > nul');
 if doserror=0 then
 BEGIN
 gotoxy(25,7);
 textcolor(16);
 write('100 % ');
 end;
goto goodent;
errent:
window(25,15,58,18);
textbackground(red);textcolor(white);
clrscr;
writeln(' Spiel wurde nicht installiert !!');
writeln(' Um es  korrekt  zu installieren,');
writeln(' Das  Programm erneut  aufrufen !');
write('  ğğğğğğğğğğğğğğğğğğğğğğğğğğğğğğ');
m:=readkey;
textcolor(white);textbackground(black);
exit;
break:
window(10,4,73,20);
textbackground(lightgray);textcolor(red);
clrscr;
writeln;
writeln(' INSTALLATION ABGEBROCHEN !!!');
writeln;
writeln('     Installationsprogramm erneut aufrufen, um das');
writeln('     Spiel korrekt zu installieren.');
writeln;
writeln('              Bitte eine Taste drcken');
m:=readkey;
exit;
goodent:
writeln;
writeln('      ÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸');
writeln('      Æ Spiel ordnungsgem„á installiert ! µ');
writeln('      ÔÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾');
writeln('        òò  I LOVE `î N î R G I î !!  óó');
writeln;
writeln('                              Taste drcken....');
REPEAT
 BEGIN
  for x:=14000 downto 19 do sound(x);
  for x:=19 to 14000 do sound(x);
  nosound;
  delay(500);
 END
UNTIL KeyPressed;
window(1,1,80,25);
textbackground(black);textcolor(white);
clrscr;
writeln(' OKAY. KEEN 6 befindet sich nun auf der Festplatte.');
writeln(' Um es zu starten, folgendes eingeben:');
writeln(' ',c,':');
writeln(' CD',z);
writeln(' KEEN6');
for h:=3 to 5 do
begin
delay(1000);
gotoxy(20,h);
writeln('[RETURN]');
end;
gotoxy(1,7);
writeln('Um Tips & Tricks zu erhalten im selben Verzeichnis TIPS! eingeben.');
writeln;
writeln('Gruá an alle von PHL.');
END.