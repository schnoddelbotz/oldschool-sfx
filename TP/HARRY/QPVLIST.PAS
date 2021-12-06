Uses crt,dos;
VAR       actpath:string;
              x,y:integer;
               ch:char;
       dir_record:searchrec;
        ofilename:string;
            f1,f2:text;
label beg,ent;
Procedure Startscr;
  BEGIN
 y:=0;
 window(1,1,80,25);
 textbackground(1);textcolor(9);
{clr}
 for x:=1 to 1999 do begin write(#176);end;
 window(5,23,75,23);clrscr;textcolor(7);
 write('      C  - Ch Path    ³    M  -  Make Listfile    ³    ESC exits');
 window(1,1,80,2);textbackground(red);clrscr;textcolor(15);
 writeln('                              QPV List-File Creator');
 write('                           Add-On written in 1995 by PHL');


 window(10,5,70,21);textbackground(black);clrscr;
 window(9,4,68,20);textbackground(blue);clrscr;textcolor(15);
 write('ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·');
 write('³                        MAIN MENUE                        ³');
 write('³            Files available in this Directory...          ³');
 write('ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½');
 writeln;
window(12,8,65,18);textbackground(7);clrscr;textcolor(black);
    Findfirst('*.',$10,Dir_record);textcolor(4);while doserror=0 do begin
    write((dir_record.name):15,'   ');
    findNext(Dir_record);end;
    FindFirst('*.jpg',Archive+ReadOnly,Dir_Record);textcolor(black);
    While Doserror = 0 do begin
    write((dir_record.name):15,'   ');
    {,' ',(dir_record.size/1024):2:0,'kB');}y:=y+1;
    FindNext(Dir_Record);
    end;

window(1,25,80,25);textbackground(red);textcolor(15);
clrscr;
 getdir(0,actpath);
 write('  Path: ',actpath,'   ³  Disk-Space: ',diskfree(0)/1000000:4:2,' MB  ³ JPEGs found: ',y);
END;

Procedure ChgDirDialog;BEGIN y:=0;
 window(15,10,75,12);textbackground(red);clrscr;textcolor(15);
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

Procedure makefile;BEGIN
 window(15,10,75,12);textbackground(red);clrscr;textcolor(15);
 writeln;write('   Output File : ');textbackground(white);
 write('                                       ');gotoxy(19,2);
 readln(ofilename);textbackground(red);writeln;
 if ofilename='' then begin WRITE(' No file specified !');delay(1500);end;
 assign(f1,ofilename+'.QPL');
 rewrite(f1);
 FindFirst('*.jpg',Archive+ReadOnly,Dir_Record);textcolor(black);
    While Doserror = 0 do begin
    writeln(f1,actpath,'\',dir_record.name);
    FindNext(Dir_Record);
    END;
 close(f1);
 {$I-}
 if ioresult=0 then writeln(' The Listfile was created in file : ',ofilename+'.QPL and .BAT');
 {$I+}
 assign(f2,ofilename+'.bat');rewrite(f2);
 writeln(f2,'@echo off');writeln(f2,'echo\');
 writeln(f2,'REM Batch File created by QPVLIST ver 1.0');
 writeln(f2,'REM Run this file to view the generated Slideshow!');
 writeln(f2,'QPV /@',ofilename+'.qpl',' /S3');close(f2);
 sound(200);delay(2);nosound;
 delay(1800);
 startscr;
END;



BEGIN   {eigentlich Proggibeginn}
writeln(' QPVLIST ver 1.0 by PHL 1995');delay(500);
clrscr;
beg:
startscr;
ch:=readkey;
sound(200);delay(2);nosound;
if upcase(ch)='C' then chgdirdialog;
if ch=#27 then goto ent;
if upcase(ch)='M' then makefile;
goto beg;
ent:
window(1,1,80,25);gotoxy(1,25);
textcolor(7);textbackground(black);writeln;
writeln(' Thanks for using !');delay(500);
END.