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
for x:=298 downto 1 do write('    (c) by PHL  �  [ESC]  - Ende  �  Taste - Weiter  �  [F1] - Hilfe     ');
  for x:=19 to 14000 do sound(x);
  for x:=14000 downto 19 do sound(x);
  NoSound;
window(25,7,55,15);
textbackground(red);textcolor(white);
clrscr;
write('�������I��N��F��O���!�!������ͻ');
write('�                             �');
write('� ExpoLoga ist mein moentaner �');
write('� Zeitvertreib ,  ich  bin    �');
write('� Sch�ler am AvH in KN, stehe �');
write('� in Mathe auf 5 und versuche �');
write('� mir  so  das  Thema  zu     �');
write('� vereinfachen. USE IT!       �');
write('��������������������������;��');
{gotoxy(9,8);
textbackground(white);textcolor(red);
write(' ESC � ENDE ');}
M:=readkey;
if M=#27 then exit;
window(1,2,80,24);textbackground(blue);textcolor(red);clrscr;
for x:=1 to 497 do write(' ExpoLoga by PHL - ExpoLoga ');
window(10,4,73,20);
textbackground(lightgray);textcolor(black);
clrscr;
gotoxy(1,1);for x:=1 to 64 do write('�');
gotoxy(1,1);for x:=1 to 16 do writeln('�');gotoxy(1,1);write('�');
gotoxy(64,1);write('�');
gotoxy(1,17);for x:=1 to 63 do write('�');gotoxy(1,17);write('�');
for x:=2 to 16 do
  BEGIN
   gotoxy(64,x);
   write('�');
  END;
gotoxy(63,17);write('�');gotoxy(64,16);write('�');
window(11,5,72,19);
for x:=1 to 500 do write('  MERKE: MATHE MACHT SPASS!!! (W�RG!!!!) ');
delay(1000);
menu:
;clrscr;
textcolor(blue);
writeln('<<<<<<_________________M____E____N____�_________________>>>>>>');
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
write('������������������������������������������������������������Ŀ');
write('�  d  �  Zuwachsfaktor     �  c  �  1. Glied  der  Folge     �');
write('������������������������������������������������������������Ĵ');
write('�  n  �  Das n-te Glied    �  F1 �  Hilfe  �  ESC � Zur�ck   �');
write('��������������������������������������������������������������');
writeln;
writeln('  Die Formel lautet  n ���> c + (n-1) * d');
writeln;
write('  Gib den Zuwachsfaktor (d)  an: ');readln(d);
write('  Gib das 1. Glied der Folge an: ');readln(c);
write('  Von welchem Glied an soll berechnet werden ?: ');readln(n);
write('  Bis zu welchem Glied?: ');readln(z);
writeln;
q:=trunc(d);
r:=trunc(c);
writeln(' Deine Vorschrift lautet: n ��> ',c:10:3,' + (n-1) * ',d:10:3);
delay(5000);
clrscr;
for n:=n to z do
 begin
  writeln('n=',n,' ��>',c+(n-1)*d:20:6);
 end;
readln;
goto menu;
gfb:
write('GFB');delay(5000);
goto menu;
readln;
END.