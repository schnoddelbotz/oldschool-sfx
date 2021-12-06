Program fon2; {today: let's do a blockrea :)
               quattro: don't read around, just help me ! ;-)}
uses crt;

Var     kn,ab:file;
           res:text;
           bl:array [1..32000] of char;
           wl:array [1..2000] of char;
           ch:char;
        x,z,wx,wy,la,wlx,look:integer;
          y,blxr:longint;
          uc,funds,sy,o,m,lr:integer;
      numRead:word;
       rel:reaL;
               s,ss:string;

label cont,ente,beg;
BEGIN
beg:

rel:=0;numread:=0;blxr:=0;
textmode(3+font8x8);
window(1,1,80,50);textbackground(white);clrscr;
assign(kn ,'d:\Tmp\kn-asc.txt');reset(kn,1);
assign(res,'d:\tmp\phl.tmp');rewrite(res);

textcolor(blue);for look:=1 to 49 do begin gotoxy(1,look);write('³');gotoxy(80,look);write('³');end;textcolor(white);
window(1,50,80,50);textbackground(blue);clrscr;
write('  Could ya PLEASE enter this god damin string that we might continue ?#$!');
window(1,1,80,1);textbackground(blue);clrscr;
write(' -- PHLs FON á (tm) now uses blockread ! Look, how fast it is ! -- [..........]');
textbackground(white);window(2,1,79,50);

writeln;textcolor(blue);
writeln;write(' Enter Search-String ([q],[ret] exits) : °°°°°°°°');gotoxy(wherex-8,wherey);readln(ss);
window(2,2,79,49);textcolor(black);clrscr;
if ss='' then begin close(kn);close(res);goto beg;end;
if upcase(ss[1])='Q' then begin close(kn);close(res);exit;end;
for uc:=1 to length(ss) do begin ss[uc]:=upcase(ss[uc]);end;
textcolor(white);
window(1,50,80,50);textbackground(blue);clrscr;write(' Searching for : ', ss);
textbackground(white);

window(2,2,79,49);gotoxy(1,1);clrscr;

repeat
if keypressed then begin ch:=readkey; if ch=#27 then goto ente; end;
blockread(kn,bl,sizeof(bl),numRead);inc(blxr);rel:= ( blxr*32000 / filesize(kn)*100);
window(1,1,80,1);
gotoxy(69,1);textcolor(red);
        if rel>100 then begin write('±±±±±±±±±±');goto cont; end;
         if rel>90 then begin write('±±±±±±±±±',#26,'');goto cont; end;
         if rel>80 then begin write('±±±±±±±±',#26,'.');goto cont; end;
         if rel>70 then begin write('±±±±±±±',#26,'..');goto cont; end;
         if rel>60 then begin write('±±±±±±',#26,'...');goto cont; end;
         if rel>50 then begin write('±±±±±',#26,'....');goto cont; end;
         if rel>40 then begin write('±±±±',#26,'.....');goto cont; end;
         if rel>30 then begin write('±±±',#26,'......');goto cont; end;
         if rel>20 then begin write('±±',#26,'.......');goto cont; end;
         if rel>10 then begin write('±',#26,'........');goto cont; end;
         if rel<10 then begin write(#26,'.........');goto cont; end;

textcolor(black);
cont:
window(2,2,79,49);
gotoxy(wx,wy-1);


writeln;

 for x:=1 to 32000 do begin
 write(bl[x],^M);

if length(ss)=1 then  if bl[x]=  ss[1] then begin
if length(ss)=2 then  if bl[x+1]=ss[2] then begin
if length(ss)=3 then  if bl[x+2]=ss[3] then begin
if length(ss)=4 then  if bl[x+3]=ss[4] then begin
if length(ss)=5 then  if bl[x+4]=ss[5] then begin
if length(ss)=6 then  if bl[x+5]=ss[6] then begin
if length(ss)=7 then  if bl[x+6]=ss[7] then begin

{  if bl[x]=  'H' then begin
  if bl[x+1]='A' then begin
  if bl[x+2]='C' then begin
  if bl[x+3]='K' then begin
  if bl[x+4]='E' then begin
  if bl[x+5]='R' then begin
  if bl[x+6]=' ' then begin}
{  if bl[x+7]=' ' then begin}


         for z:=1 to 200 do begin
         write(res,bl[z+x-100]);
         end;wx:=wherex;wy:=wherey;

if length(ss)=1  then end;
if length(ss)=2  then end;
if length(ss)=3  then end;
if length(ss)=4  then end;
if length(ss)=5  then end;
if length(ss)=6  then end;
if length(ss)=7  then end;{end;} {max 8 chrs zum suchen ....}

 end;


until numread=0;

gotoxy(2,2);
writeln;reset(res);
writeln(' The following stings were found on your search for ',ss,' : ');textcolor(black);
repeat
 readln(res,s);inc(lr);
 sy:=pos(ss,s);

 if s[1]='"' then begin
  if sy<>0 then begin {writeln(lkn)};
  o:=0;
   for m:=1 to length(s) do begin
       if s[m]='#' then s[m]:=' ';
       if s[m]='"' then begin
        inc(o); if o=1 then begin textcolor(blue);write('NAME: ');textcolor(black);end;
                if o=3 then begin textcolor(blue);gotoxy(40,wherey);write('STRASSE: ');textcolor(black);end;
                if o=5 then begin writeln;textcolor(blue);write('ORT : ');textcolor(black);end;
                 if o=7 then begin textcolor(blue);gotoxy(40,wherey);write('TELEFON: ');textcolor(black);end;
       end else write(s[m]);
   end;
 writeln;writeln;
    if wherey > 46 then begin writeln;write(' Any key for next page, q to quit ');
                              ch:=readkey;if upcase(ch)='Q' then goto ente;
                              clrscr;writeln;end;
 end;

{ writeln;writeln; {nach jeder Nummer}
 end;
until eof(res);

close(res);

if lr=1 then begin write(' Not one, you know :)');end;


window(1,50,80,50);textbackground(blue);clrscr;
textcolor(white);
write('   ---->  *** any [key]  to quit, [space] to have fun .AGAIN.  ***   <----');
ch:=readkey;
if ch=#32 then goto beg;

ente:
window(1,1,80,50);
textbackground(black);textcolor(7);
clrscr;
END.