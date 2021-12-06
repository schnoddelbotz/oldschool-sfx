Program ExpoLoga;
USES Crt,Graph;
 VAR d,c,a,b:real;
     x,q,r,n,z:integer;
     e,f,g,h,M:char;
     i,j,k,l:string;
 Label begyn,ent,errmsg1,errmsg2,afb,gfb,menu;
 BEGIN
begyn:
textbackground(black);clrscr;
window(1,1,80,1); textbackground(white);textcolor(blue);clrscr;
for x:=490 downto 1 do write('          ExpoLoga - Exponential und Logarithmusfunktionen    ');
window(1,2,80,24);textbackground(blue);textcolor(red);clrscr;
for x:=1 to 497 do write(' ExpoLoga by PHL - ExpoLoga ');
window(1,25,80,25);textbackground(white);textcolor(blue);clrscr;
for x:=298 downto 1 do write('    (c) by PHL  ³  [ESC]  - Ende  ³  Taste - Weiter  ³  [F1] - Hilfe     ');
  for x:=19 to 14000 do sound(x);
  for x:=14000 downto 19 do sound(x);
  NoSound;
window(25,7,55,15);
textbackground(red);textcolor(white);
clrscr;
write('ÉÍÍÍÍÍÍIÍÍNÍÍFÍÍOÍÍÍ!Í!ÍÍÍÍÍÍÍ»');
write('º                             º');
write('º ExpoLoga ist mein moentaner º');
write('º Zeitvertreib ,  ich  bin    º');
write('º Schler am AvH in KN, stehe º');
write('º in Mathe auf 5 und versuche º');
write('º mir  so  das  Thema  zu     º');
write('º vereinfachen. USE IT!       ½');
write('ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¾¯¯');
{gotoxy(9,8);
textbackground(white);textcolor(red);
write(' ESC ÷ ENDE ');}
M:=readkey;
if M=#27 then exit;
window(1,2,80,24);textbackground(blue);textcolor(red);clrscr;
for x:=1 to 497 do write(' ExpoLoga by PHL - ExpoLoga ');
window(10,4,73,20);
textbackground(lightgray);textcolor(black);
clrscr;
gotoxy(1,1);for x:=1 to 64 do write('Í');
gotoxy(1,1);for x:=1 to 16 do writeln('º');gotoxy(1,1);write('É');
gotoxy(64,1);write('»');
gotoxy(1,17);for x:=1 to 63 do write('Í');gotoxy(1,17);write('È');
for x:=2 to 16 do
  BEGIN
   gotoxy(64,x);
   write('º');
  END;
gotoxy(63,17);write('¾');gotoxy(64,16);write('½');
window(11,5,72,19);
for x:=1 to 500 do write('  MERKE: MATHE MACHT SPASS!!! (WšRG!!!!) ');
delay(1000);
menu:
;clrscr;
textcolor(blue);
writeln('<<<<<<_________________M____E____N____š_________________>>>>>>');
writeln;
textcolor(black);
writeln;
writeln('    1. Arithmetrische Folge berechnen (konstanter Zuwachs)');
writeln;
writeln('    2. Geometrische Folge berechnen (konst. Wachtumsfaktor)');
writeln;
writeln('    3. Zeichnen von mehreren Folgen (NOT AVAILABLE YET!)');
writeln;
writeln('    4. Ende');
gotoxy(30,14);write('Deine Wahl:');
e:=readkey;
if e='1' then goto afb;
if e='2' then goto gfb;
if e='3' then goto begyn;
if e=#13 then goto menu;
if e='4' then exit;
if e=#27 then exit;
afb:
write('AFB');
clrscr;
write('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
write('³  d  ğ  Zuwachsfaktor     ³  c  ğ  1. Glied  der  Folge     ³');
write('ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´');
write('³  n  ğ  Das n-te Glied    ³  F1 ğ  Hilfe  ³  ESC ğ Zurck   ³');
write('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
writeln;
writeln('  Die Formel lautet  n ÄÄÄ> c + (n-1) * d');
writeln;
write('  Gib den Zuwachsfaktor (d)  an: ');readln(d);
write('  Gib das 1. Glied der Folge an: ');readln(c);
write('  Von welchem Glied an soll berechnet werden ?: ');readln(n);
write('  Bis zu welchem Glied?: ');readln(z);
writeln;
q:=trunc(d);
r:=trunc(c);
writeln(' Deine Vorschrift lautet: n ÄÄ> ',c:10:3,' + (n-1) * ',d:10:3);
delay(5000);
clrscr;
for n:=n to z do
 begin
  writeln('n=',n,' ÄÄ>',c+(n-1)*d:20:6);
 end;
readln;
goto menu;
gfb:
write('GFB');delay(5000);
goto menu;
readln;
END.