Program FindStr2;
Uses Crt,Jantools,dos;
Var x,y,zz,x1,y1,found:integer;
    suchstr,dateiname,zeile:string;
    datei1:text;
       actpath:string;
       ch:char;
       dir_record:searchrec;



procedure getstring;begin;
clrscr;
write(' Nach welchem String soll gesucht werden ?');
readln(suchstr);
end;









PROCEDURE SEARCHINFILE;BEGIN

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

      if wherey>givemaxy-1 then begin textcolor(white);write('         Press any key to continue .... ');
      ch:=readkey; if ch=#27 then exit; textcolor(7);clrscr;end;

 end;




END; {der while not seekEof-Schleife}


textcolor(white);
Writeln;
writeln('                         SEARCH FINISHED.');
writeln('                        Totally found : ', found);
writeln('                       Press any key to exit !');


close(datei1);
exit;
END; {der sear.....procedure}






Procedure Choosefile;BEGIN
 window(15,20,75,22);textbackground(red);clrscr;textcolor(15);
 writeln;write(' Enter file... : ');textbackground(white);
 write('                                       ');gotoxy(19,2);
 readln(dateiname);textbackground(red);writeln;
 {$I-}
 assign(datei1,dateiname);
 reset(datei1);
 if ioresult <> 0 then begin
 writeln('        FILE DOES NOT EXIST ...  !');
 for x:=500 to 900 do begin sound(x);delay(1);nosound;end;
 delay(1000);
 {$I+}
 end;
window(1,1,80,25);textbackground(black);clrscr;
END;




Procedure ChgDirDialog;BEGIN
 window(15,20,75,22);textbackground(red);clrscr;textcolor(15);
 writeln;write(' Enter new path : ');textbackground(white);
 write('                                       ');gotoxy(19,2);
 readln(actpath);textbackground(red);writeln;
 {$I-}
 chdir(actpath);
 if ioresult <> 0 then begin
 writeln('        PATH DOES NOT EXIST ... SO PATH NOT CHANGED !');
 for x:=500 to 900 do begin sound(x);delay(1);nosound;end;
 delay(1000);
 {$I+}
 end;

END;









BEGIN









 window(10,5,70,21);textbackground(black);clrscr;
 window(9,4,68,20);textbackground(blue);clrscr;textcolor(15);
 write('ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·');
 write('³                        MAIN MENUE                        ³');
 write('³  C - Choose File          ....      D - Change Directory ³');
 write('ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½');
 writeln;
window(12,8,65,18);textbackground(7);clrscr;textcolor(black);
    Findfirst('*.',$10,Dir_record);textcolor(4);while doserror=0 do begin
    write((dir_record.name):15,'   ');
    findNext(Dir_record);end;
    FindFirst('*.*',Archive+ReadOnly,Dir_Record);textcolor(black);
    While Doserror = 0 do begin
    write((dir_record.name):15,'   ');
    {,' ',(dir_record.size/1024):2:0,'kB');}y:=y+1;
    FindNext(Dir_Record);
    end;


ch:=readkey;
if upcase(ch)= 'D' then CHGDIRDIALOG;
if upcase(ch)= 'C' then begin CHOOSEFILE;clrscr;getstring;clrscr;searchinfile;end;
if ch        = #27 then exit;










END.