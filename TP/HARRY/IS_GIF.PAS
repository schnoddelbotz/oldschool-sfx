Program ErkenneGIF;
Uses Crt,Dos,jantools;
Var      x,y,z,pospoint,pagewait:integer;
            ch:char;
        f1,scr:text;
    dir_record:searchrec;
            fl,zerlegt,nuname,ext:string;

procedure gop;begin
gotoxy(20,wherey);
end;

procedure copy2gif;begin
{$M $4000,0,0 }
swapvectors;
exec('c:\command.com', ' /C copy '+dir_record.name+' '+zerlegt+'.gif');
swapvectors;
end;

procedure ren2gif;begin
{$M $4000,0,0 }
swapvectors;
exec('c:\command.com', ' /C ren '+dir_record.name+' '+zerlegt+'.gif');
swapvectors;
end;

procedure convquest; begin
write(' Copy/Rename ',dir_record.name,' to .GIF ? (c/r/N) ');Z:=0;ch:=readkey;
if upcase(ch)='C' then z:=1;
if upcase(ch)='R' then z:=2;

if z=1 then begin {copy}
copy2gif;
if ioresult = 0 then writeln(' FILE HAS BEEN COPYED  TO ',zerlegt,'.GIF');
end;

if z=2 then begin {rename}
if ioresult = 0 then writeln(' FILE HAS BEEN RENAMED TO ',zerlegt,'.GIF');
ren2gif;
end;

if z=0 then writeln;
end;

procedure conv; begin
{$M $4000,0,0 }
swapvectors;
exec('c:\command.com', ' /C ren '+dir_record.name+' '+zerlegt+'.gif');
swapvectors;
end;


procedure helpdisp; begin
writeln;write('   ');
slowdisplr('GIF DETECTOR v.1.1',8,15,80);textcolor(7);textbackground(8);writeln;
writeln;writeln('     Parameters:');
writeln('  /A    Renames automatically all files to .GIFs');
writeln('  /C    Ask for Copy or Rename on each file');
writeln;writeln('  PLACEBO EFFECT   ');halt;end;


BEGIN
{$I-}
textcolor(7);textbackground(8);
if paramcount=0 then pagewait:=1;
if paramstr(1)='/c' then begin y:=1;pagewait:=1;end;if paramstr(1)='/C' then begin y:=1;pagewait:=1;end;
if paramstr(1)='/a' then begin pagewait:=0;y:=2;end;if paramstr(1)='/A' then begin pagewait:=0;y:=2;end;
if paramstr(1)='/?' then helpdisp;
if wherey > 20 then clrscr else writeln;

Findfirst('*.*',Archive,Dir_Record);
 While DosError <> 18 do begin
    x:=0;
    write(dir_record.name,' .................. ');
    assign(f1,dir_record.name);reset(f1);read(f1,fl);{writeln(fl)};close(f1);

    zerlegt:=dir_record.name;
    pospoint:=pos('.',zerlegt);
    delete(zerlegt,pospoint,8);




    if fl[1]='G' then inc(x);
    if fl[2]='I' then inc(x);
    if fl[3]='F' then inc(x);
    if fl[4]='8' then inc(x);
    if fl[5]='7' then inc(x);
    if fl[5]='9' then begin inc(x);inc(x);end;

    if x=5 then begin gop;textcolor(5);writeln('THIS IS A GIF87 !');textcolor(7);
    if y=1 then convquest;if y=2 then conv;end;

    if x=6 then begin gop;textcolor(4);writeln('THIS IS A GIF89 !');textcolor(7);
    if y=1 then convquest;if y=2 then conv;end;

    if x<5 then begin gop;writeln(' Sorry, no GIF');end;

    findnext(Dir_record);

     if pagewait=1 then begin
         if wherey = givemaxy+1 then begin write(' Press any key ...');ch:=readkey;
         if cH=#27 then exit;clrscr;end;
     end;
 END;


writeln;
gotoxy(50,wherey);
slowdisprl(' GIF Detector by Phl. ',8,7,40);

{$I+}
END.