Program ShowPalette;
uses crt;
var x:integer;

begin
textbackground(black);
clrscr;
FOR x:=1 to 23 do
 BEGIN
 Textcolor(x);
  WRITEln('TEXTCOLOR:',x,'           ');
 delay(20);
 END;
window(20,1,39,25);
textbackground(white);clrscr;
FOR x:=1 to 23 do
 BEGIN
  TEXTcolor(X);
  WRITELN('TEXTCOLOR:',x);
  delay(20);
 END;
window(40,1,59,25);
textcolor(black);textbackground(black);
clrscr;
FOR x:=1 to 23 do
 BEGIN
  TEXTBACKGROUND(X);
  WRITELN('BACKGROUNDCOLOR:',x,' ');
  delay(20);
 END;
window(60,1,80,25);
textcolor(white);
clrscr;
FOR x:=1 to 23 do
 BEGIN
  TEXTBACKGROUND(X);
  WRITELN('BACKGROUNDCOLOR:',x);
  delay(20);
 END;
END.
