Program nicki;
uses crt;
var f1,f2:file;
       ch:char;
      err:integer;
      buf:array [1..64000] of char;
      nva:char;
  numread,numwritten:word;

BEGIN
writeln;
assign(f1,'DESCENT2.EXE');
assign(f2,'DESCENT2.BAK');
{$I-}
reset(f1,1);
{$I+}
if ioresult<>0 then begin writeln(' descent2.exe not found - exiting ...(Copy diz proggy to DESCENT2-Directory)');exit;end;

{$I-}
rewrite(f2,1);
{$I+}
if ioresult<>0 then begin writeln(' descent2.bak could not be created ...');exit;end;

write(' Backing up your DESCENT2.EXE to DESCENT2.BAK.');

repeat
  write('.');
  BlockRead(F1, Buf, SizeOf(Buf), NumRead);
  BlockWrite(F2, Buf, NumRead, NumWritten);
until (NumRead = 0) {or (NumWritten <> NumRead)};


if filesize(f2)=filesize(f1) then begin
write(^M^J^M^J,' Changing one value in DESCENT2.EXE...');
seek(f1,974917);
blockread(f1,ch,sizeof(ch));
 if ch=chr(117) then begin
  seek(f1,974917);
  nva:=#235;
  blockwrite(f1,nva,sizeof(nva));
  writeln('...done.');
 end else begin writeln;writeln(' Wrong Descent2-Version ... or patch already used.');exit;end;
end else begin err:=1;writeln;writeln(' error occured while copying ! -sorry');end;


if err=0 then begin writeln(' You may now start DESCENT2 without FAKED2 and without the CD ...');
writeln(' But you''ll need the "CRAZY"-Installtion-Level...');
writeln(' But you can Trunc the Movies... 1kb is enuf...');
writeln(' ...da HAcKer');
end;
writeln;
END.