{$N+} {$G+} {$q-} {$r-} {$S-}

Program Checksum;
uses dos;
var
             f : file;
           res : text;
      cs,ct,ts : real;
      at,nores : integer;
           x,z : longint;
           buf : array[1..64100] of char;
       dirinfo : searchrec;
   attr,numread:word;
           dir : string;
label next;
BEGIN

writeln;

if length(paramstr(1)) > 2 then begin findfirst(paramstr(1),Archive,dirinfo);end
else begin findfirst('*.*',$3f,dirinfo); end;

if paramstr(2)='/NORES' then nores:=1;

if nores=0 then begin
assign(res,'RESULTS.CKS'); {$I-} rewrite(res); {$I+}
if ioresult <> 0 then begin writeln(' Could not create result-file RESULTS.CKS');exit;end;
writeln(res,'; ** CHKSALL ** Checksum-Calculator file. Do not modify...');getdir(0,dir);
writeln(res,'PATH=',dir);
end;

if nores=0 then writeln(' CHKSALL will save results to RESULTS.CKS      Û = reading, ğ = calculating.') else
                writeln(' CHKSALL will save NO  .....  results ...      Û = reading, ğ = calculating.');
writeln('      --Filename--    --Size (kbytes)--    --Action--    --Checksum--      ');
writeln(' úúúÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄúúú');



while doserror = 0 do begin

 cs:=0;
 assign(f,dirinfo.name);
 getfattr(F,attr);

 if attr =  48 then goto next;

 {write(dirinfo.name,attr);}
 if attr = $10 then goto next;
 if attr = $10 and $20 then goto next;

 if attr <> 32 then begin
 setfattr(f,32);at:=1;
 end;

 if dirinfo.name='RESULTS.CKS' then goto next;

 {$I-}
 reset(f,1);
 {$I+}
 if ioresult <> 0 then begin write(' I/O ERROR !');if nores=0 then erase(res);exit;end;

 ts:=ts+filesize(f);
 write( dirinfo.name:16,'            ', filesize(f)/1000:9:3,'           ');
 if nores=0 then write(res,dirinfo.name:14);
  repeat
   write(#8,'Û');
   blockread(f,buf,sizeof(buf),numread);
   write(#8,'ğ');
    for x:=1 to numread do begin
     cs:=cs+ord(buf[x]);
    end;
  until numread=0;
 ct:=ct+cs;
 writeln(#8,#251,'         ',cs:10:0);
 if nores=0 then writeln(res,cs:16:0,filesize(f):20);
 close(f);


 if at=1 then begin setfattr(f,attr);at:=0;end;
 inc(z);
 next:
 findnext(dirinfo);


end;

writeln(' úúúÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄúúú');
writeln(' Total:',z:3,' files',ts/1000:21:3,'         done.   ',ct:13:0);
if nores=0 then begin
writeln(res,'Total Checksum  : ',ct:12:0);
writeln(res,'; Program Terminated succesfully.');
close(res);
end;
END.