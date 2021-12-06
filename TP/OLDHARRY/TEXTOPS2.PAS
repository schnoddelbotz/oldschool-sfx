Program TestTextAndFileOps;
Uses Crt;
Var x,y,z,posx,posy:integer;
    a,b,c          :word;
    ch             :char;
Procedure CLRSCREEN;BEGIN
window(1,1,80,24);
gotoxy(1,12);
 for x:=1 to 14 do begin insline;delay(15);end;
gotoxy(1,1);
 for x:=1 to 11 do BEGIN delline;delay(15);end;
textbackground(black);
clrscr;
END;

BEGIN
textcolor(7);
clrscr;
for z:=1 to 350 do begin
write(z:5);
end;
window(2,25,79,25);textbackground(blue);clrscr;write('  X=',wherex:2,' Y=',wherey:2);
write('         ≥ Wer wo was-checker by PHL ≥    Scheiss-Progi ich wei· !');
window(1,1,80,24);textbackground(black);
REPEAT

textcolor(white);
 ch:=readkey;
 Case Ch of
  'a'..'z' : BEGIN textcolor(white);write(ch); END;
  '0'..'0' : BEGIN textcolor(white);write(ch); END;
  'Ñ'      : BEGIN textcolor(white);write(ch); END;
  'Å'      : BEGIN textcolor(white);write(ch); END;
  'î'      : BEGIN textcolor(white);write(ch); END;
  ' '      : BEGIN write(' '); END;
  'R' : insline;
  'S' : delline;
  #75 : BEGIN gotoxy(wherex-1,wherey); END;   {4}
  #77 : BEGIN gotoxy(wherex+1,wherey); END;   {6}
  #72 : BEGIN gotoxy(wherex,wherey-1); END;   {8}
  #80 : BEGIN gotoxy(wherex,wherey+1); END;   {2}
  #79 : BEGIN gotoxy(wherex-1,wherey+1); END; {1}
  #81 : BEGIN gotoxy(wherex+1,wherey+1); END; {3}
  #71 : BEGIN gotoxy(wherex-1,wherey-1); END; {7}
  #73 : BEGIN gotoxy(wherex+1,wherey-1); END; {9}
 end;
  y:=wherey;x:=wherex;
  textcolor(red);
  write(' X=',wherex,' Y=',wherey, ' ',ch);
  textcolor(white);gotoxy(x,y);

UNTIL ch=#27;
clrscreen;
delay(10);
END.