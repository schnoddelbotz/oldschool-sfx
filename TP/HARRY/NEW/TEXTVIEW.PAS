Program NoName;
uses crt,jancrt;
var                    x,y,z,cur:integer;
                          ch:char;
                         totallines:integer;
                       numread:word;
                           s:string;
                           f:file;
                           l:array [1..600] of string[80]; {600*80=48k text}
BEGIN
clrscr;
assign(f,'c:\tp\harry\new\hallo.doc');reset(f,1);
write(' Reading file ..');

repeat
inc(totallines);write('.');
blockread(f,l[totallines],sizeof(l[totallines]),numRead);
until (numread=0) or (totallines=600);
write('... done!');delay(100);

clrscr;cur:=1;


fout(1,1,7,l[1]);
fout(1,2,7,l[2]);
fout(1,3,7,l[3]);

repeat
for x:=cur to cur+50 do begin
fout(1,x,7,l[x]);
end;
ch:=readkey;if ch='a' then inc(cur);
until ch=#27;


fout(1,50,17,' .... done.');
ch:=readkey;
END.