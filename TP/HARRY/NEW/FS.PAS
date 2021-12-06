Program fon2;
uses crt;
Var                                bl:array [1..63700] of char;
                                   sss,ss,s:string;
                                    f:file;
                              numRead:word;
                                  rel,pro:reaL;
                              z,x1,y1,y2,x2,nice:integer;
                               blxr,x:longint;
                                   ch:char;


procedure fout(x,y,farb:byte;simm:string);  {** FASST-Output}
var q:byte;add,fbo:word;
begin     add:=y*160-162+x shl 1;fbo:=word(farb) shl 8;
          for q:=1 to ord(simm[0]) do begin
          memw[$b800:add]:=fbo+ord(simm[q]);inc(add,2) end end;

label next;
BEGIN
clrscr;textmode(3+font8x8);
if length(paramstr(1))=0 then begin writeln(' Please Specify a file !');exit;end;
assign(f ,paramstr(1)); {$I-}reset(f,1); {$I+} if ioresult <> 0 then begin
writeln(' Sorry, but file does not exist. Press any key ...');ch:=readkey;exit;end;


ss:='°°°±±';
window(1,1,80,49);textbackground(white);y1:=1;sss:='  ';


repeat
 blockread(f,bl,sizeof(bl),numRead);

  pro:=filepos(f)/filesize(f)*100;str(pro:3:0,s);
  fout(58,50,white,' Seraching : ... '+s+' % ');


  for x:=1 to numread do begin
   if bl[x]  =ss[1] then
   if bl[x+1]=ss[2] then
   if bl[x+2]=ss[3] then
   if bl[x+3]=ss[4] then
   if bl[x+4]=ss[5] then begin

   if bl[x+10]<>' ' then goto next;

      for z:=1 to 75 do begin
      sss:=sss+(bl[z+x-1]);
      end;
      if y1=50 then begin clrscr;y1:=1;end;
      fout(1,y1,120,sss);sss:='  ';
      inc(y1);

   next:
  if keypressed then ch:=readkey;if ch=#27 then begin close(f);textcolor(blue);write('bye');delay(2000);exit;end;

   end;
   end;


until numread=0;


textcolor(white);textbackground(black);
ch:=readkey;
window(1,1,80,50);clrscr;
END.