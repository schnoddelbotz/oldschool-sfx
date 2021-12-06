Program FindStr2;
Uses Crt,Jantools;
Var x,y,zz,x1,y1,found:integer;
    suchstr,dateiname,zeile:string;
    datei1:text;
       ch:char;
BEGIN
textcolor(white);textbackground(8);
clrscr;
gotoxy(1,givemaxy-5);
write(' Datei die durchsucht werden soll: ');readln(dateiname);
write(' Such-String:');readln(suchstr);
{$I-}
assign(datei1,dateiname);reset(datei1);
if ioresult = 0 then begin gotoxy(60,wherey-2);textbackground(white);textcolor(black);
writeln('   CHECK OK    ');delay(100); end else begin writeln;writeln(' NOT A FILE');EXIT;END;
{$I+}
window(1,1,80,1);textbackground(white);clrscr;textcolor(black);
write(' File :',dateiname,' ³   Findstr by PHL  ³   Aktuelle Zeile : .................');
window(1,2,80,givemaxy+1);textbackground(black);textcolor(white);clrscr;


while not seekEof(datei1) do begin
inc(zz);
x1:=wherex;y1:=wherey;window(1,1,80,1);gotoxy(70,1);textcolor(black);textbackground(white);write(zz:10);
textcolor(7);textbackground(8);window(1,2,80,givemaxy+1);gotoxy(x1,y1);
readln(datei1,zeile);

 if pos(suchstr,zeile) > 0 then begin
    inc(found);
{           if length(zeile) > 10 then begin delete(zeile,10,10);end;}
    writeln(' Zeile ',zz,' : ',zeile);

      if wherey=givemaxy-1 then begin write('         Press any key to continue .... ');
      ch:=readkey; if ch=#27 then exit; clrscr;end;

 end;




END; {der while not seekEof-Schleife}


textcolor(white);
Writeln;
writeln('                         SEARCH FINISHED.');
writeln('                        Totally found : ', found);
writeln('                       Press any key to exit !');
ch:=readkey;

END.