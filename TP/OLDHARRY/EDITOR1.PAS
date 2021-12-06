Program FileOps;
Uses Crt,dos;
Var           x,y,z:integer;
             f1,scr:text;
                  s:string;
                  n:string[12];
                 ch:char;
         d,m,ye,dow:word;
label ent,edt;
BEGIN
getdate(ye,m,d,dow);
GetDir(0,s);
clrscr;
textcolor(7);
Write('Bitte den Namen der Datei angeben : ');readln(n);
assign(f1,n);{append(f1)}rewrite(f1);

window(1,25,80,25);textbackground(blue);clrscr;
write('   JANs EDITOR Ver. 0.01á       ³      Datum: '{,dow,', der '},d:2,'.',m:2,'.',ye:4,'      ³   Cursorpos:');
window(1,1,80,1);textbackground(blue);clrscr;write(' Datei : ',n,'    ³    Aktueller Pfad: ',s);
edt:
window(1,2,80,24);textbackground(3);textcolor(0);clrscr;


repeat
ch:=readkey;
CASE ch of
{ 'a'..'z' : BEGIN write(ch);write(f1,ch);END;
  'A'..'Z' : BEGIN write(ch);write(f1,ch);END;
  '0'..'9' : BEGIN write(ch);write(f1,ch);END;
'„','','”': BEGIN write(ch);write(f1,ch);END;
'','š','™': BEGIN write(ch);write(f1,ch);END;
'.',':','!','"','?',',' : BEGIN write(ch);write(f1,ch); END;}
  #27      : BEGIN END;
  #32      : BEGIN write(' ');write(f1,' ');END;
  #13      : BEGIN gotoxy(1,wherey+1);write(f1,#13);END;
  #08      : BEGIN write(#08);write(f1,#08); END;

else BEGIN write(ch);write(f1,ch);END;
END;

until ch=#27;

window(1,25,80,25);textbackground(blue);clrscr;textcolor(white);
write('   >>>  Soll die Datei ',n,' gespeichert werden (J/N)  <<<');
ch:=readkey;
case upcase(ch) of
  'J' : BEGIN close(f1);goto ent; END;
  'N' : BEGIN erase(f1);goto ent; END;
{else goto edt;}
END;
delay(100);
ent:
textbackground(black);textcolor(7);
END.