{LS Ver 1.3á written by phl in july 1995}
Uses crt,dos;
VAR     actpath,str:string;
         dir_record:searchrec;
               attr:word;
              tsize:real;
                 ch:char;
 fils,dirs,why,whya,lm,sd:integer;
                 f1:file;
label ent,tent,nots;
procedure spc;begin write('  ');inc(dirs);end;
procedure shs;{showsize}begin
write('',dir_record.size/1024:4:0,'kB');inc(fils);end;
procedure fii;begin textcolor(15);write('---');end;


BEGIN
if (paramstr(1)='') or (paramstr(1)='/P') or (paramstr(1)='/p') or (paramstr(1)='/?') or
(paramstr(1)='/S') or (paramstr(1)='/s') then str:='*.*' else str:=paramstr(1);
whya:=wherey;lm:=0;sd:=0;

if (paramstr(1)='/?') or (paramstr(2)='/?') or (paramstr(3)='/?')then begin
writeln;
writeln('   LS Ver. 1.3á   (c) 1995 by Hacker-Soft');
writeln('   LS is a Command-Line program like the Dos-program DIR.  ');
writeln('    SYNTAX:  LS [files] [/P] [/?]');writeln;
writeln('   files  Fileargument: for e.g. *.EXE or *.DOC (Standard: *.*)');
writeln('   /P     Lists the files and pauses after 25 lines');
writeln('   /S     Recurse Subdirectories  [ BETA !!! ]');
writeln('   /?     This help.');writeln;textcolor(red);
write('      ');fii;write('           BETA-Version 1.3         ');fii;writeln;
goto tent;end;

if (paramstr(1)='/P') or (paramstr(2)='/P') or (paramstr(3)='/P')then lm:=1;
if (paramstr(1)='/p') or (paramstr(2)='/p') or (paramstr(3)='/p')then lm:=1;

if (paramstr(1)='/S') or (paramstr(2)='/S') or (paramstr(3)='/S')then sd:=1;
if (paramstr(1)='/s') or (paramstr(2)='/s') or (paramstr(3)='/s')then sd:=1;

getdir(0,actpath);
{    writeln(' Directory : ',actpath);}
{    draw the LS headline in color   }
fii;textcolor(yellow);write(' Hidden ');fii;textcolor(green);
write(' Readonly ');fii;textcolor(red);write(' HiRoSy(Arc) ');fii;
textcolor(15);write(' Directory ');fii;textcolor(7);write(' Archive ');fii;
textcolor(blue);write('LS v1.3á');fii;

  Findfirst('*.*',$3f,Dir_record);while doserror<>18 do begin
  assign(f1,dir_record.name);getfattr(f1,attr);
{   writeln(' Datei : ',dir_record.name,'  attributnummer: ',attr);}
{    test:}
    if attr=16 then begin textcolor(15);write(dir_record.name:11);spc;     (* directory *)
                 if sd=1 then begin
      if (dir_record.name='.') or (dir_record.name='..') then goto nots;
{anzeigen von unterverzeichnissen !!!}
   writeln;
   writeln(' Directory :',actpath,'\',dir_record.name);
   chdir(dir_record.name);
   Findfirst(str,$3f,Dir_record);
    while doserror<>18 do begin
    assign(f1,dir_record.name);
    getfattr(f1,attr);
    if attr=32 then begin textcolor(7);write(dir_record.name:14);shs;end;      (* archive *)
    if attr=34 then begin textcolor(yellow);write(dir_record.name:14);shs;end; (* hidden archive *)
    if attr=33 then begin textcolor(green);write(dir_record.name:14);shs;end;  (* readonly archive*)
    if attr=39 then begin textcolor(red);write(dir_record.name:14);shs;end;    (* all: H S A R *)
    if attr=7  then begin textcolor(red);write(dir_record.name:14);shs;end;    (* H S R *)
    tsize:=tsize+(dir_record.size);
     IF LM=1 then begin
      if wherex < 10 then begin inc(why);end;
      if why>23 then begin
         why:=0;textcolor(15);fii;write(' Return continues, q quits. ');fii;ch:=readkey;
         if upcase(ch)='Q' then goto ent;textcolor(7);writeln;end;
     end;
     if wherex>70 then writeln;
     findNext(Dir_record);
   end;
{ende: anzeigen von unterverzeicnissen}
{goto test;}
nots:
chdir(actpath);
end;   {des auflistens von dateien in unterverzeichnissen}
chdir(actpath);
end; {der anzeiege von dateien  mit attribut 16 (if attr=16 etc...)}
chdir(actpath);
    if attr=18 then begin textcolor(yellow);write(dir_record.name:11);spc;end; (* hidden directory *)
    if wherex>70 then writeln;
       IF LM=1 then begin;
        if wherex < 10 then begin inc(why);end;
        if why>23 then begin
           why:=0;textcolor(15);write(' Return continues, q quits. ');ch:=readkey;
           if upcase(ch)='Q' then goto ent;textcolor(7);end;
       end;
   findNext(Dir_record);
    end;
(* Ende der Suche nach Verzeichnissen *)
if wherex>5 then writeln;
(* Beginn der Suche nach allen Dateien *)
   Findfirst(str,$3f,Dir_record);
(*   Findfirst('*.*',$3f,Dir_record);*)
    if sd=1 then begin textcolor(15);writeln(' Directory : ',actpath);end;
    while doserror<>18 do begin
    assign(f1,dir_record.name);
    getfattr(f1,attr);
    if attr=32 then begin textcolor(7);write(dir_record.name:14);shs;end;      (* archive *)
    if attr=34 then begin textcolor(yellow);write(dir_record.name:14);shs;end; (* hidden archive *)
    if attr=33 then begin textcolor(green);write(dir_record.name:14);shs;end;  (* readonly archive*)
    if attr=39 then begin textcolor(red);write(dir_record.name:14);shs;end;    (* all: H S A R *)
    if attr=7  then begin textcolor(red);write(dir_record.name:14);shs;end;    (* H S R *)
    tsize:=tsize+(dir_record.size);
     IF LM=1 then begin
      if wherex < 10 then begin inc(why);end;
      if why>23 then begin
         why:=0;textcolor(15);fii;write(' Return continues, q quits. ');fii;ch:=readkey;
         if upcase(ch)='Q' then goto ent;textcolor(7);writeln;end;
     end;
     if wherex>70 then writeln;
     findNext(Dir_record);
   end;
(*  Ende der Suche nach allen Dateien *)

ent:

    if wherex>5 then writeln;
 textcolor(15);
fii;write((tsize)/1000:8:2, ' kB used by ',fils:4,' files. ');fii;
    write(' DIRs: ',dirs:2,' ');fii;
    write(diskfree(0)/1000000:8:2,' MB free on hdd. ');fii;
writeln;
tent:
END.