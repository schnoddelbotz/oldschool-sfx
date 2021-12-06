Uses crt,dos;
VAR         actpath:string;
         dir_record:searchrec;
               attr:word;
              tsize:real;
                 ch:char;
 fils,dirs,why,whya:integer;
                 f1:file;
label ent;
procedure spc;begin write('  ');inc(dirs);end;
procedure shs;{showsize}begin
write('',dir_record.size/1024:4:0,'kB');inc(fils);end;

BEGIN
whya:=wherey;
textcolor(yellow);write(' Hidden ');textcolor(green);write(' Readonly ');
textcolor(red);write(' HiRoSy(Arc) ');textcolor(15);write(' Directory ');textcolor(7);write(' Archive ');
textcolor(blue);writeln('     LS ver 1.0á by PHL 1995');textcolor(15);
    getdir(0,actpath);
    writeln(' Directory: ',actpath);
    Findfirst('*.*',$3f,Dir_record);
    while doserror<>18 do begin
    assign(f1,dir_record.name);
    getfattr(f1,attr);
{   writeln(' Datei : ',dir_record.name,'  attributnummer: ',attr);}
    if attr=16 then begin textcolor(15);write(dir_record.name:14);spc;end;     (* directory *)
    if attr=18 then begin textcolor(yellow);write(dir_record.name:14);spc;end; (* hidden directory *)
    findNext(Dir_record);end;
if wherex < 10 then begin inc(why);end;
if why>23 then begin
why:=0;textcolor(15);write(' Return continues, q quits. ');ch:=readkey;
if upcase(ch)='Q' then goto ent;textcolor(7);end;
writeln;

    Findfirst('*.*',$3f,Dir_record);
    while doserror<>18 do begin
    assign(f1,dir_record.name);
    getfattr(f1,attr);
    if attr=32 then begin textcolor(7);write(dir_record.name:14);shs;end;      (* archive *)
    if attr=34 then begin textcolor(yellow);write(dir_record.name:14);shs;end; (* hidden archive *)
    if attr=33 then begin textcolor(green);write(dir_record.name:14);shs;end;  (* readonly archive*)
    if attr=39 then begin textcolor(red);write(dir_record.name:14);shs;end;    (* all: H S A R *)
    if attr=7  then begin textcolor(red);write(dir_record.name:14);shs;end;    (* H S R *)

       tsize:=tsize+(dir_record.size);

 if wherex < 10 then begin inc(why);end;
 if why>23 then begin
 why:=0;textcolor(15);write(' Return continues, q quits. ');ch:=readkey;
 if upcase(ch)='Q' then goto ent;textcolor(7);writeln;end;
     if wherex>70 then writeln;
     findNext(Dir_record);end;


ent:
    if wherex>5 then writeln;
 textcolor(15);
    write((tsize)/1000:8:3, ' kB used by files. ');
    write('  DIRs: ',dirs:3,'   Files: ',fils:4,'  ');
    write(diskfree(0)/1000000:8:2,' MB free on hdd.  ');

END.