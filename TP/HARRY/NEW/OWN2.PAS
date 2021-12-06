Program OwnGfxFormat;
Uses Graph,crt,dos,jancrt;
var           x,y,drv,mode,color:integer;
                 conv,a,b,c,zahl:integer;
                           x1,y1:integer;
                              ch:char;
                              f3:file;
                             buf:array [1..640] of char;
                    numread,size:word;
                            p,p1:pointer;

{procedure janno;
var         x,y,z,disp,posi,tags:integer;
               numFiles,num2disp:integer;  {Anzahl d Dateien, Anz d Anzugeigenden Dateien}
{                             tag:array [1..2000] of char;
                           namen:array [1..2000] of string[12];
                           attrs:array [1..2000] of word; {speichert die attribute}
 {                           attr:word;
                       dirRecord:SearchRec;
                              ch:char;
                               f:file;
                    enablemarker:boolean;

procedure ReadFiles;begin
 fout(80,1,15,'Û');
    numfiles:=0;
    for x:=1 to 2000 do begin namen[x]:='';tag[x]:=#0;end;
    FindFirst('*.*',Archive+directory,DirRecord);
    While Doserror <> 18 do begin
    inc(numFiles);
    namen[numFiles]:=dirrecord.name;
    assign(f,dirrecord.name);getFattr(f,attrs[numFiles]);
    if dirrecord.name='.' then dec(numfiles);
    FindNext(DirRecord);
    END;
    posi:=1;disp:=1;
 fout(80,1,15,' ');
end;

procedure display;begin
   z:=0;
   for x:=disp to disp+num2disp do begin
   textbackground(blue);textcolor(15);
   if attrs[x]=16 then textcolor(lightcyan);
   if tag[x]=#254 then textcolor(Lightgreen);
   inc(z);if z=posi then begin textcolor(black);textbackground(cyan);
                         if attrs[posi+disp-1]=16 then textcolor(8);
                         if tag[posi+disp-1]=#254 then textcolor(yellow);
                         end;
   write(namen[x]:13);writeln(tag[x]);
   end;
end;

BEGIN

chdir('d:\linux\dev');
readfiles;
clrscr;textcolor(15);textmode(259);
disp:=1;posi:=1; {posi: scroller-position !
num2disp:=49 dec(num2disp);
enablemarker:=true;
display;

repeat
gotoxy(1,1);
if ch<>#9 then ch:=readkey else ch:=#8;

if enablemarker=true then begin
 if ch=#32 then begin
   if tag[disp+posi-1] = #254 then begin
    tag[disp+posi-1]:=#0;
    if (posi<numfiles) and (posi<num2disp+1) then begin inc(posi); end
    else begin if disp+posi<numfiles then inc(disp);end;
   end
  else
   begin
    tag[disp+posi-1]:=#254;
    if (posi<numfiles) and (posi<num2disp+1) then begin inc(posi); end
    else begin if disp+posi<numfiles then inc(disp);end;
 end;
end;


end;

if ch=#0 then begin ch:=readkey;
 if ch=#132 then if disp <>1 then begin posi:=1;disp:=1;end else begin if namen[1]='..' then chdir('..');readfiles;end;
 if ch=#118 then if numfiles>num2disp then begin posi:=num2disp+1;disp:=numfiles-posi+1;end;
 if ch=#32 then begin gotoxy(1,1);write('  Drive :     ');ch:=readkey;{$I-chdir(ch+':');{$I+}
{    gotoxy(1,1);
    if ioresult = 0 then readfiles else write(' drive error !');end;
 if ch=#72 then begin
   if posi>1 then dec(posi) else if disp>1 then dec(disp);
 end;{of up}
{ if ch=#80 then begin
  if (posi<numfiles) and (posi-1<num2disp) then begin inc(posi); end
    else begin if disp+posi-1<numfiles then inc(disp);end;
 end;{of dn}
{ if ch=#73 then begin
  if disp=1 then posi:=1;
  if numfiles<num2disp then posi:=1 else begin
  fout(20,19,19,'pgup!');
  end;
 end;{of pgup}
{ if ch=#81 then begin
  if numfiles<num2disp+1 then posi:=numfiles else begin
   fout(20,19,19,'pgdn!');
  end;
 end;
end;{of ... if ch=0}

{display;
if (ch=#13) then begin
 assign(f,namen[disp+posi-1]);GetFAttr(f,attr);
 if (attr=48) or (attr=16) then begin chdir(namen[disp+posi-1]);readfiles;ch:=#9;end;
end;
until (ch=#27) or (ch=#13);

end;{of "janno"}
label ente,cont,c1,c2,c3;
BEGIN










textmode(3+font8x8);writeln(' Loading. Please wait ...');
assign(f3,'c:\tp\harry\ovl\insert.bmp');reset(f3,1);
Drv:=0;
InitGraph(drv,mode,'c:\tp\bgi\');
if GraphResult = grOk then goto cont else goto ente;cont:
outtextxy(5 ,5 ,' Loading ... ');delay(500);
outtextxy(5 ,15,' Checking Files ...');delay(500);
outtextxy(5 ,25,' Looking for mouse ...');delay(500);
setcolor(white);clrscr;setcolor(blue);
line(1,1,getmaxx,getmaxy);

{seek(f3,1078);y:=480;
 repeat
  blockread(f3,buf,sizeof(buf),numRead);
  for x:=640 downto 1 do begin
  putpixel(x,y,ord(buf[x]) div 16);
  end;
   dec(y);
 until (y<2);
delay(1000);clrscr;}



seek(f3,1078);y:=480;
 repeat
  blockread(f3,buf,sizeof(buf),numRead);
  blockread(f3,buf,sizeof(buf),numRead);
   for x:=640 downto 1 do begin
  putpixel(x,y,ord(buf[x]) div 16);
  end;
  dec(y,2);
 until (y<2);

seek(f3,1718);y:=480;
 repeat
  blockread(f3,buf,sizeof(buf),numRead);
  blockread(f3,buf,sizeof(buf),numRead);
   for x:=1 to 640 do begin
  putpixel(x,y-1,ord(buf[x]) div 16);
  end;
  dec(y,2);
 until (y<2);



ch:=readkey;

CloseGraph;
close(f3);
ente:
end.