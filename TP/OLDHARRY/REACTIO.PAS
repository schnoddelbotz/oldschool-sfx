Program Ractio;
Uses crt;
var x,y,z:integer;
      a:real;
     ch:char;
Procedure Startscr;
 BEGIN
 textbackground(1);textcolor(9);
 clrscr;
 for x:=1 to 1999 do begin write(#176);end;
 window(1,1,80,2);textbackground(red);clrscr;textcolor(15);
 writeln('                             REAKTIONSZEIT  -  TEST');
 write  ('                         < Pr„dikat: unntz  aber sch”n >');
 window(1,25,80,25);clrscr;
 window(10,5,70,21);textbackground(black);clrscr;
 window(9,4,68,20);textbackground(blue);clrscr;textcolor(15);
{ window(12,8,65,18);textbackground(7);clrscr;textcolor(black);}
 END;

BEGIN
RANDOMIZE;
startscr;
 write('ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·');
 write('³                        Mog„„„„n                          ³');
 writeln;
 write('             Teste Deine beschissene Reaktionszeit!         ');
 write('   Einfach ein 5-Mark Stck in den 5 1/4" Laufwerkschacht   ');
 write('   und schon kann es losgehen. Diese Gelegenheit solltest   ');
 write('   Du  Dir  nicht  entgehen lassen.  Wer weiá, vielleicht   ');
 write('   ist  es  einmal  von groáer  Wichtigkeit in deinem zu-   ');
 write('   knftigen Leben, denn .................to be continued   ');
 writeln;
 write('³                                                          ³');
 write('ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½');
writeln;writeln;writeln('           Bitte ne Taste drcken ...... ');
ch:=readkey;
startscr;
writeln;
writeln('    Erster Akt. ');writeln;writeln;
writeln(' Sobald dieses Zeichen: ',#251,#251,#251,' in der Statuszeile ');
writeln(' erscheint,  eine beliebige Taste drcken.');writeln;writeln;
writeln(' Wenn Bereit die Taste >j< drcken....  ');
window(1,25,80,25);textbackground(red);clrscr;
textcolor(18);write('          STATUS-ZEILE               -             STATUSZEILE');
textcolor(15);
REPEAT
ch:=readkey;
until ch='j';
clrscr;
delay( random(10000) );
gotoxy((random(80)),1);
write(#251,#251,#251);

REPEAT
y:=y+1;
delay(1);
until keypressed;
startscr;writeln;writeln(' Ergebnis des ersten Tests: ',y,' ms');
writeln;writeln(' Bitte die Taste >a< drcken');
REPEAT
ch:=readkey;
until ch='a';
startscr;textcolor(15);
writeln;
writeln('   Zweiter Akt.');writeln;writeln;
writeln('  Nun  mssen  statt  einer beliebigen Taste');
writeln('  vorgegebene  Buchstaben  gedrckt  werden.');
writeln('  Sie  erscheinen  kurz  vor  Ausl”sung  des');
writeln('  Zufallsgenerators, d.h. genung Zeit um die');
writeln('  ben”tigte Taste vorher zu suchen ....');
writeln;writeln('  Taste >n< drcken, wenn bereit ...');

window(1,25,80,25);textbackground(red);clrscr;
REPEAT
ch:=readkey;
until ch='n';
window(1,25,80,25);textbackground(red);clrscr;
for x:=1 to 10 do begin
 clrscr;
 delay( random(4000) );
 gotoxy((random(80)+10),1);
 write(#251,#251,#251);
 REPEAT
 y:=y+1;
 delay(1);
 until keypressed;
 gotoxy(1,1);write(' Warten ...');delay(100);
END;
clrscr;
write(y);write('     ');write(z);
delay(3000);
END.