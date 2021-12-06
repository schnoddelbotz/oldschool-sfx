Program Capture;
Uses Jantools,crt;
Var x:integer;
    c:^byte;
    datei:text;
BEGIN
assign(datei,'D:\TEMP\capture.col');
rewrite(datei);
{textmode(font8x8+3);}
{for x:=1 to 20 do begin
textcolor(x);write('H');delay(100);end;
textcolor(white);writeln;writeln;}
for x:=0 to (80*50) do begin

c:=ptr($B800,x);
case chr(c^) of
 #1 : begin textcolor(2);write(datei,#27,'[34m');end;
 #2 : begin textcolor(3);write(datei,#27,'[36m');end;
 #3 : begin textcolor(4);write(datei,#27,'[31m');end;
 #4 : begin textcolor(5);write(datei,#27,'[35m');end;
 #5 : begin textcolor(6);write(datei,#27,'[33m');end;
 #6 : begin textcolor(7);write(datei,#27,'[37m');end;
 #7 : begin textcolor(8);write(datei,#27,'[37m');end;
  #8  : begin textcolor(9); write(datei,#27,'[32m');end;
  #9  : begin textcolor(10);write(datei,#27,'[36m');end;
  #10 : begin textcolor(11);write(datei,#27,'[31m');end;
  #11 : begin textcolor(12);write(datei,#27,'[35m');end;
  #12 : begin textcolor(13);write(datei,#27,'[33m');end;
  #13 : begin textcolor(14);write(datei,#27,'[37m');end;
  #14 : begin textcolor(15);write(datei,#27,'[30m');end;
  #15 : begin textcolor(16);write(datei,#27,'[37m');end;
else write(datei,chr(c^));
end;
end;

write(datei,#27,'[37m');
textcolor(white);
close(datei);
writeln;writeln(' Caputre finished ! ');

END.