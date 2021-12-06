uses crt,dos;
var              buf:array [1..70] of byte;
                 ch :char;
               x,y,c:real;
   x1,x2,y1,y2,c1,c2:integer;
                f,f2:file;
           DirRecord:Searchrec;
            numfiles:integer;
                   s:string;

{write(ord(buf[19]));write(' ');writeln(ord(buf[20]));}
label skip;
BEGIN
textcolor(15);WRITELN(^m^j'  Name          Width  Heigth  Colors     Filesize');textcolor(7);
{chdir('c:\tp\harry\ovl');}
findfirst('*.bmp',archive,DirRecord);
assign(f2,'inhalte.gfx');rewrite(f2,1);

while doserror=0 do begin
 inc(numfiles);
 assign(f,dirrecord.name);reset(f,1);
 if filesize(f)<70 then begin dec(numfiles);goto skip;end;
 blockread(f,buf,sizeof(buf));

  s:=^m^j+' '+DirRecord.Name+':  ';
  blockwrite(f2,s,length(S));
  blockwrite(f2,buf,70);

 x1:=buf[19];x2:=buf[20];y1:=buf[23];y2:=buf[24];
 c1:=buf[50];c2:=buf[51];

 x:=(x1 / 256 +x2) *256;y:=(y1 / 256 +y2) *256;
 c:=(c1 / 256 +c2);
 writeln(' ',dirrecord.name:13,'  ',x:4:0,'    ',y:4:0,'    ',c:4:0,'      ',(filesize(f)/1024):7:2,'k [',c1,' ',c2);
 skip:
 close(f);
 findnext(dirrecord);
end;

textcolor(15);writeln(^m^j'  Found ',numfiles,' files.');textcolor(7);
close(f2);

ch:=readkey;
END.

{ x1:=buf[19];x2:=buf[20];y1:=buf[23];y2:=buf[24];c1:=buf50];c2:=buf[51];}