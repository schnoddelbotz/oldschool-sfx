Program Checksum;
uses dos;
var cs:real;
     f:file;
     numread:word;
     y:integer;
     x:longint;
     buf:array[1..64000] of char;
     dirinfo:searchrec;
     ch:char;
     wx,wy:integer;
     res:text;
BEGIN

writeln;
findfirst('*.*',Archive,dirinfo);
assign(res,'RESULZ_.CKS'); {$I-} rewrite(res); {$I+}
if ioresult <> 0 then begin writeln(' Could not create result-file ');exit;end;
writeln(res,'; ** CHKSALL ** Checksum-Calculator file. Do not modify...');

while doserror = 0 do begin

 cs:=0;
 assign(f,dirinfo.name);
 {$I-}
 reset(f,1);
 {$I+}
 if ioresult <> 0 then begin write(' I/O ERROR !');erase(res);exit;end;


 write(' Reading file ',dirinfo.name:12,'... ');
 write(res,dirinfo.name:14);
  repeat
   if y=0 then write(#8,'*');if y=1 then write(#8,'+');inc(y);if y>1 then y:=0;
   blockread(f,buf,sizeof(buf),numread);
    for x:=1 to numread do begin
     cs:=cs+ord(buf[x]);
    end;
  until numread=0;
 writeln('  Checksum: ',cs:12:0,' �');
 writeln(res,cs:16:0);
 close(f);
 findnext(dirinfo);


end;

writeln;
END.