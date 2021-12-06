Program OwnGfxFormat;
Uses Graph,crt;
var           x,y,z,err,drv,mode:integer;
                 conv,a,b,c,zahl:integer;
                           x1,y1:integer;
                              ch:char;
                              f3:file;

                            buf2:array [1..22] of byte;
                             buf:array [1..102] of byte;
                    numread,size:word;
                            p,p1:pointer;

label ente,cont,c1,c2,c3;
BEGIN
textmode(3+font8x8);writeln(' Loading. Please wait ...');
{$I-} assign(f3,'buttons.gfx');reset(f3,1); {$I+}
if ioresult<>0 then writeln(' Sorry. Graphic-Files missing.');
Drv:=Detect;InitGraph(Drv,Mode,'c:\tp\bgi\');
if GraphResult = grOk then goto cont else goto ente;cont:
outtextxy(5 ,5 ,' Loading ... ');delay(500);
outtextxy(5 ,15,' Checking Files ...');delay(500);
outtextxy(5 ,25,' Looking for mouse ...');delay(500);
setcolor(white);clrscr;setcolor(blue);
line(0,0,0,getmaxy);line(0,0,getmaxx,0);line(getmaxx,0,getmaxx,getmaxy);line(0,getmaxy,getmaxx,getmaxy);
line(1,1,1,getmaxy);line(1,1,getmaxx,1);line(getmaxx-1,1,getmaxx-1,getmaxy-1);line(1,getmaxy-1,getmaxx-1,getmaxy-1);
line(0,9,getmaxx,9);line(0,11,getmaxx,11);line(0,40,getmaxx,40);line(0,42,getmaxx,42);

 repeat
  blockread(f3,buf,sizeof(buf),numRead);
   for conv:=1 to numread-2 do begin
   if buf[conv]=87 then buf[conv]:=15;
   if buf[conv]=244 then goto c1;
   putpixel(conv+25,z+17,buf[conv]);
   end;
  inc(z);
  until (numread=0);
c1:
size:=imagesize(15,8,115,32);getmem(P,size);
getimage(26,17,125,39,p^);
for c:=1 to 5 do begin putimage(145+b,17,p^,0);b:=b+120;end;

z:=0;buf[conv]:=1;
seek(f3,2053);
repeat
  blockread(f3,buf2,sizeof(buf2),numRead);
   for conv:=1 to numread-2 do begin
   if buf2[conv]=87 then buf2[conv]:=15;
   if buf[conv]=244 then goto c2;
   putpixel(conv+125,z+58,buf2[conv]);
   end;
  inc(z);
  until numread=0;
c2:
size:=imagesize(126,58,145,75);getmem(P,size);
getimage(126,58,145,75,p^);

for b:=1 to 27 do
 for c:=1 to 35 do putimage(c*20-20,b*18+28,p^,0);



z:=0;buf[conv]:=1;
seek(f3,2468);
repeat
  blockread(f3,buf2,sizeof(buf2),numRead);
   for conv:=1 to numread-2 do begin
   if buf2[conv]=87 then buf2[conv]:=15;
   if buf[conv]=244 then goto c2;
   putpixel(conv+325,z+388,buf2[conv]);
   end;
  inc(z);
  until numread=0;
getimage(325,388,345,409,p^);
putimage(100,100,p^,4);
c3:

setcolor(white);
outtextxy(30,22,'infoúúúúúúú');outtextxy(151,22,'searchúúúúú');
setcolor(black);outtextxy(271,22,'do it now !');setcolor(white);
outtextxy(390,22,'úúúúoptions');outtextxy(510,22,'úúúúúúúquit');


repeat
ch:=readkey;
if ch='y' then begin if y1<450 then begin y1:=y1+5;putimage(x1,y1,p^,0);end;end;
if ch='a' then begin y1:=y1-5;putimage(x1,y1,p^,0);end;
if ch='d' then begin x1:=x1+5;putimage(x1,y1,p^,0);end;
if ch='s' then begin x1:=x1-5;putimage(x1,y1,p^,0);end;
until ch=#27;




CloseGraph;

{for x:=1 to 15 do begin
textcolor(x);writeln(' Farbe ',x);
end;
ch:=readkey;}
writeln;
writeln(' Thanks for using our products. ');
close(f3);
ente:
end.