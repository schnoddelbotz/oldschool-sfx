Program Addpathy;
Uses Crt,jantools;

Var newpath,actpath,line:string;
                      ch:char;
                     file1:text;
                   x,i,numoflinks,a,posinl,posoflast,l,l1,paths:integer;
                     path2rm,path2add:string;
Procedure Help; BEGIN
Backupwin;
window(15,10,65,17);textbackground(red);clrscr;textcolor(15);
writeln('            < < <  Help  > > >');
writeln('     Hmmmm. Too lazy to write help ! Fuck help !');
writeln('     Can''t you read ? you see, at the bottom of');
writeln('          the screen, there''s enough help !');
writeln('                      So, cu !');writeln;
write('        <<< Press any key to continue ..... >>>');
ch:=readkey;
restorewin;END;

Procedure RMPath; BEGIN
Backupwin;
window(15,10,65,17);textbackground(red);clrscr;textcolor(15);
writeln('   << << << << Enter Path  to remove >> >> >> >>');writeln;
textbackground(blue);gotoxy(wherex+2,wherey);
writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');textcolor(white);
gotoxy(wherex+2,wherey-1);
readln(path2rm);

textcolor(white);textbackground(red);writeln;writeln('  Okay .... soon be done.');delay(1000);
{ch:=readkey;}
restorewin;
END;

Procedure AddPath; BEGIN
 Backupwin;
 window(15,10,65,17);textbackground(red);clrscr;textcolor(15);
 writeln('   << << << <<   Enter Path  to add   >> >> >> >>');writeln;
 textbackground(blue);gotoxy(wherex+2,wherey);
 writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');textcolor(white);
 gotoxy(wherex+2,wherey-1);
 readln(path2add);
 {$I-}
 textcolor(white);textbackground(red);
 chdir(path2add);if ioresult<>0 then begin writeln;writeln(' This path does not exist !');delay(1000);restorewin;exit; end else

 begin writeln;writeln(' The path will soon be added !');delay(1000);
 {add path as last one ...}
  WHILE not seekeof(file1) do begin
   readln(file1,line);
      for i:=1 to length(line) do begin line[i]:=UpCase(line[i]);end;
    if pos('PATH',line)=1 then begin line:=line+path2add;writeln(file1,line);end;
   {$I+}
   {ch:=readkey;}delay(1000);

  END;
 end;
   restorewin;
END; {of Procedure}

label mainmenu;



BEGIN
textmode(co80);




window(1,1,80,25);
textbackground(white);textcolor(red);
clrscr;

{INFO about pathadder}
window(45,6,75,18);textbackground(cyan);clrscr;
writeln('  << (P)ath(A)dder by PHL >>');
writeln;
writeln(' PA does it all for you  ');
writeln(' - add paths to your file');
writeln('   called Autoexec.bat.');
writeln(' - it removes pathes.');
writeln(' - cool, what?');
writeln(' but easier as using edit, ');
writeln('  OH YES !!!');
writeln(' C.U. Stupid porgrammer');

{end of info about PA}


assign(file1,'c:\tp\harry\ae.bat');
reset(file1);
posoflast:=5;
textcolor(blue);
window(1,1,80,1);textbackground(red);clrscr;
write('   THE Path-Adder ... coded by Ã´ê›Kîç ... use this program or you''ll die !  ');

WHILE not seekeof(file1) do begin
 readln(file1,line);
 for i:=1 to length(line) do begin line[i]:=UpCase(line[i]);end;
  if pos('PATH',line)=1 then begin
{   writeln(line);writeln;}


   window(2,3,38,22);textbackground(blue);clrscr;textcolor(white);

    for x:=1 to length(line) do begin
      if wherey>19 then begin window(42,3,79,22);textbackground(blue);clrscr;textcolor(white);end;
      inc(posinl);

      if line[x]=';' then begin inc(numoflinks);
        for paths:=posoflast+1 to posinl-1 do begin write(line[paths]);end;
        writeln;
        posoflast:=posinl;
      end;
    end;

    for x:=posoflast+1 to length(line) do begin write(line[x]);end;
    writeln;


  end;


end;


mainmenu:
REPEAT
window(1,23,80,25);textbackground(green);clrscr;textcolor(black);
writeln('        ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·');
writeln('        º    F1 - Help         -:-  F3 - Verify  -:-  F7 - Add Path     º');
write('        ³    F8 - Remove Path  -:-  F10 - Exit   -:-  Installed Links:',numoflinks+1:2,'³');

 ch:=readkey;
 if ch=#0 then begin
  ch:=readkey;
 case ch of

  #59 : begin help;end;
  #65 : begin addpath;end;
  #66 : begin rmpath end;
  #61 : begin {test existension f3}end;
  #45 : begin writeln;textcolor(red);WRITELN(' QUICK EXIT !!! ');delay(200);clrscr;exit;end;
 end;

{  write(ord(ch));delay(3000);}
 end;
until ch=#68; {f10 ... exit ... ALT-X would be #45}


 writelN;write('                    >>> A N Y key to exit - ESC to resume <<< ');
 ch:=readkey;if ch=#27 then goto mainmenu;
close(file1);
END.