Program FindStrinFile;
Uses Crt,jantools;
Var x,y,z,x1,y1,s,sp:integer;
    suchstr,zeile,filename:string;
       datei1:text;
          ch:char;

BEGIN
textbackground(black);textcolor(7);
clrscr;write(' Such-String eingeben : ');readln(suchstr);
write(' Zu durchsuchende Datei: ');readln(filename);
assign(datei1,filename);reset(datei1);


WHILE not seekeof(datei1) DO BEGIN
readln(datei1,zeile);
inc(x);

 if wherey=givemaxy+1 then begin textcolor(white);write('    Press any key to continue ...  ');
 ch:=readkey;if ch=#27 then exit;textcolor(7);clrscr;end;


for z:=1 to 1 {lenth of zeile} do begin
  if Z=1 then inc(sp);

  x1:=wherex;y1:=wherey;textcolor(black);textbackground(white);
  gotoxy(60,1);write(' Zeile:',sp:10);
  gotoxy(x1,y1);textcolor(7);textbackground(8);


  if pos(suchstr,zeile)=1 then begin
  textcolor(white);
  writeln(' Begriff in Zeile ',sp,' gefunden....:');textcolor(7);
  writeln(Zeile);inc(y);

  end;

END;




END;

writeln;
textcolor(white);
if y=0 then Begin write(' Der Suchbergiff konnte nicht gefunden werden');end;
if y>0 then begin write(' Der Suchbegriff konnte ',y,' mal gefunden werden.');end;

END.