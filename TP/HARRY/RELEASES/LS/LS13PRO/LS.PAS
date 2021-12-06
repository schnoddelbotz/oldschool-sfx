{LS Ver 1.3á written by phl in july 1995}
Uses crt,dos;
VAR     actpath,str:string;
         dir_record:searchrec;
               attr:word;
              tsize:real;
                 ch:char;
 fils,dirs,why,whya,lm:integer;
                 f1:file;
label ent,tent;
procedure spc;begin write('  ');inc(dirs);end;
procedure shs;{showsize}begin
write('',dir_record.size/1024:4:0,'kB');inc(fils);end;

BEGIN
if (paramstr(1)='') or (paramstr(1)='/P') or (paramstr(1)='/p') or (paramstr(1)='/?') or
(paramstr(1)='/S') or (paramstr(1)='/s') then str:='*.*' else str:=paramstr(1);
writeln;
whya:=wherey;lm:=0;

if (paramstr(1)='/?') or (paramstr(2)='/?') or (paramstr(2)='/?')then begin
writeln(' LS Ver. 1.3á   (c) 1995 by Hacker-Soft');
writeln;
writeln('   LS is a Command-Line program like the Dos-program DIR.  ');
writeln('   SYNTAX:  LS [files] [/P] [/?]');writeln;
writeln('    files  Fileargument: for e.g. *.EXE or *.DOC (Standard: *.*)');
writeln('    /P     Lists the files and pauses after 25 lines');
writeln('    /?     This help.');writeln;
writeln('            -----BETA-Version 1.3... SOON: /S-----');
goto tent;end;

if (paramstr(1)='/P') or (paramstr(2)='/P') or (paramstr(3)='/P')then lm:=1;
if (paramstr(1)='/p') or (paramstr(2)='/p') or (paramstr(3)='/p')then lm:=1;

textcolor(yellow);write(' Hidden ');textcolor(green);write(' Readonly ');
textcolor(red);write(' HiRoSy(Arc) ');textcolor(15);write(' Directory ');textcolor(7);write(' Archive ');
textcolor(blue);writeln('     LS ver 1.3á by PHL 1995');textcolor(15);
    getdir(0,actpath);
    writeln(' Directory of: ',actpath);

   Findfirst('*.*',$3f,Dir_record);while doserror<>18 do begin
    assign(f1,dir_record.name);getfattr(f1,attr);
{   writeln(' Datei : ',dir_record.name,'  attributnummer: ',attr);}
    if attr=16 then begin textcolor(15);write(dir_record.name:11);spc;end;     (* directory *)
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
         why:=0;textcolor(15);write(' Return continues, q quits. ');ch:=readkey;
         if upcase(ch)='Q' then goto ent;textcolor(7);writeln;end;
     end;
     if wherex>70 then writeln;
     findNext(Dir_record);
   end;
(*  Ende der Suche nach allen Dateien *)

ent:
    if wherex>5 then writeln;
 textcolor(15);
    write('  ',(tsize)/1000:8:2, ' kB used by ',fils:4,' files.   ');
    write('    DIRs: ',dirs:3,'      ');
    write(diskfree(0)/1000000:8:2,' MB free on hdd.');
tent:
writeln;
END.