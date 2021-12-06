Program FullDISK;
uses dos,crt;
var                   f:file;
                      x:longint;
                      y,wx,wy,lv:integer;
                      ch:char;
                      s:string;
                      buf:array [1..64000] of char;
                      count,result,res:word;
label ente;
BEGIN
clrscr;
assign(f,'test.doc');rewrite(F,1);
for x:=1 to 64000 do begin inc(Y);if y=254 then y:=1;buf[x]:=chr(y);end;
wx:=wherex;wy:=wherey;

repeat
 blockwrite(f,buf,sizeof(buf),result);
if keypressed then begin ch:=readkey;if ch=#27 then goto ente end;


 str( (diskfree(0)/disksize(0)*100):3:0,s);val(s,x,res);
 gotoxy(1,wy);
 write(' Percent left : ',x,' %');

gotoxy(1,wy+1);write(' Spcae left (in kBytes):',diskfree(0)/1024:10:0);
until (diskfree(0)<64001);

ente:
writeln;
writeln(' Okay, now there are ',diskfree(0),' bytes left on the drive !');
writeln(' Our file is ',filesize(F),' bytes large :)');
close(f);
END.