Uses crt,dos;
VAR       actpath:string;
       dir_record:searchrec;
             attr:word;
            tsize:real;
               f1:file;
procedure spc;begin write('    ');end;
BEGIN
    getdir(0,actpath);
    writeln('    Directory: ',actpath);writeln;
    Findfirst('*.*',$3f,Dir_record);
    while doserror<>18 do begin
    assign(f1,dir_record.name);
    getfattr(f1,attr);
{   writeln(' Datei : ',dir_record.name,'  attributnummer: ',attr);}
    if attr=16 then begin textcolor(15);write(dir_record.name:14);spc;end;      (* directory *)
    if attr=18 then begin textcolor(yellow);write(dir_record.name:14);spc;end;      (* hidden directory *)
    if attr=32 then begin textcolor(7);write(dir_record.name:14);spc;end;      (* archive *)
    if attr=34 then begin textcolor(yellow);write(dir_record.name:14);spc;end; (* hidden archive *)
    if attr=33 then begin textcolor(green);write(dir_record.name:14);spc;end;  (* readonly archive*)
    if attr=39 then begin textcolor(red);write(dir_record.name:14);spc;end;    (* all: H S A R *)
    if wherex>70 then writeln;findNext(Dir_record);end;
    writeln;writeln;
    tsize:=tsize+(dir_record.size);textcolor(7);
    write((tsize)/1024:8:4, ' kB used by files. ');
    write(diskfree(0)/1000000:8:2,' MB free on hdd.  ');
    writeln('Free Memory: ',(maxavail+25000)/1024:3:1,'kB');
END.