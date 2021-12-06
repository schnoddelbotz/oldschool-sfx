Program FASTREAD;
uses crt,dos;
var            f:file;
             buf:array [1..64000] of char;
             x,y:integer;
               c:char;
               s:string;
              s2:string [100];
           sect,hunt,tt:string [8];
         numread:word;
            p,tr,moep:real;
            h,min,sec,hun:word;
            hb,minb,secb,hunb:word;
procedure fout(x,y,farb:byte;simm:string);  {** FASST-Output}
var q:byte;add,fbo:word;
begin     add:=y*160-162+x shl 1;fbo:=word(farb) shl 8;
          for q:=1 to ord(simm[0]) do begin
          memw[$b800:add]:=fbo+ord(simm[q]);inc(add,2) end end;

label ente;
BEGIN
clrscr;
assign(f,'d:\tmp\mccs');reset(f,1);
gettime(h,min,sec,hun);hb:=h;minb:=min;secb:=sec;hunb:=hun;
settime(0,0,0,0);

for x:=1 to 15 do begin
str(x:2,s2);tr:=tr+filesize(F);str(tr/(1024*1024):5:2,s);
fout(1,1,blue,'Durchluaf Nr. '+s2+'/15');
fout(30,1,blue,'MBytes read: '+s);
repeat
blockread(f,buf,sizeof(buf),numRead);
p:=filepos(F)/filesize(f)*100;str(p:5:0,s2);fout(73,1,blue,s2+' %');
if keypressed then begin c:=readkey;goto ente;end;inc(Y);
if y=1 then fout(80,1,green,'\');
if y=2 then fout(80,1,green,'³');
if y=3 then fout(80,1,green,'/');
if y=4 then fout(80,1,green,'-');
if y=4 then y:=0;
until numread=0;
seek(f,0);
end;
gettime(h,min,sec,hun);

ente:
textcolor(white);writeln;writeln;
writeln('It took ',min,' minutes ',sec,' seconds and ',hun,' 1/100s to read ',+
tr/(1024*1024):3:2,' megabytes.');

str(sec,sect);
str(hun,hunt);if length(hunt)=1 then hunt:='0'+hunt;
tt:=sect+'.'+hunt;val(tt,moep,x);
writeln('That are ',tr/moep/(1024*1024):3:2,' MB/sec');
settime(hb,minb,secb,hunb);
close(f);
END.