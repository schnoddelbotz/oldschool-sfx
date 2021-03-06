Unit JanCrt;
INTERFACE
Uses crt,dos;

const normchr=[#225]+[#33..#126]+[#129..#165];
       extchr=[#59..#68]+[#80]+[#72]+[#73]+[#9]+[#81]+[#13]+[#27];

var   lv,wx,wy,wx2,x,pl:integer; {laufvariable,wherex+y}
               ins,vieracht:integer;
                     ch,xrc:char;
                    xrs,xrb:string;
                       feld:array[1..8000] of byte;

procedure XR(x:integer;sss:string;bgc,txc:integer;fc:char); {eXtended Readln}
procedure fout(x,y,farb:byte;simm:string);
function givemaxx:integer;
function givemaxy:integer;
procedure backupwin;
procedure restorewin;
procedure winshdw(a,b,c,d,wincol:integer);
procedure Xplwin(a,b,c,d,wincol:integer);
procedure xclrscr;var clsy,clsl,aaa:integer;
procedure sc(txc,bgc:byte);

Implementation

Procedure XR(x:integer;sss:string;bgc,txc:integer;fc:char);begin
xrs:='';xrc:=#900;
wx:=wherex;wy:=wherey;textbackground(bgc);textcolor(txc);
for lv:=1 to x do write(fc);
gotoxy(wx,wy);write(sss);gotoxy(wx,wy);xrs:=sss;

repeat
 ch:=readkey;

 if ch =#8 {del}then if wherex>wx then begin gotoxy(wherex-1,wherey);write(fc);gotoxy(wherex-1,wherey);
                delete(xrs,wherex-wx+1,1);wx2:=wherex;gotoxy(wx,wy);
                for lv:=1 to x do write(fc);gotoxy(wx,wy);;write(xrS);gotoxy(wx2,wherey);
                end else begin sound(750);delay(20);nosound;delay(15);end;

 if ch =#32 then begin
         if ins=1 then begin
            if length(xrs)<x then begin write(' ');xrs:=xrs+' ';
            insert(' ',xrs,wherex-wx);wx2:=wherex;gotoxy(wx,wy);delete(xrs,length(xrS),1);
            for lv:=1 to x do write(fc);gotoxy(wx,wy);write(xrS);gotoxy(wx2,wherey);
            end else begin sound(750);delay(20);nosound;delay(15);end;
         end;
         if ins=0 then begin
            wx2:=wherex;
            if wherex-wx<X then begin
            delete(xrs,wherex-wx+1,1);insert(' ',xrs,wherex-wx+1);
            gotoxy(wx,wy);for lv:=1 to x do write(fc);
            gotoxy(wx,wy);write(xrS);gotoxy(wx2+1,wy);
            end else begin sound(750);delay(20);nosound;delay(15);end;
         end;
 end;

 if ch in normchr then begin
  if ins=1 then begin
   if length(xrS)<x then begin gotoxy(wherex+1,wy);
   insert(ch,xrs,wherex-wx);wx2:=wherex;gotoxy(wx,wy);for lv:=1 to x do write(fc);
   gotoxy(wx,wy);write(xrS);gotoxy(wx2,wherey);end else begin sound(750);delay(20);nosound;delay(15);end;
  end;
  if ins=0 then begin
   wx2:=wherex;if wherex-wx<X then begin delete(xrs,wherex-wx+1,1);insert(ch,xrs,wherex-wx+1);
   gotoxy(wx,wy);for lv:=1 to x do write(fc);gotoxy(wx,wy);write(xrS);gotoxy(wx2+1,wy);
   end else begin sound(750);delay(20);nosound;delay(15);end;
  end;
 end;

  if ch =#0 then begin ch:=readkey;
   if ch =#82 {INS-Toggle}then begin if ins=1 then ins:=0 else inc(ins);end;
   if ch =#75 then if wherex>wx   then gotoxy(wherex-1,wherey) else begin sound(750);delay(20);nosound;delay(15);end;
   if ch =#77 then if wherex<wx+x then if length(xrs)+wx>wherex then gotoxy(wherex+1,wherey)
              else begin sound(750);delay(20);nosound;delay(15);end;
   if ch =#83 then begin delete(xrs,wherex-wx+1,1);wx2:=wherex;gotoxy(wx,wy);
              for lv:=1 to x do write(fc);gotoxy(wx,wy);write(xrS);gotoxy(wx2,wherey);end;
   if ch =#71 then gotoxy(wx,wy);
   if ch =#79 then gotoxy(length(xrs)+wx,wy);
  if ch in extchr then xrc:=ch;
{extchr=[#59..#68f1-f10]+[#80runter]+[#72hoch]+
        [#73pgup]+[#9tab]+[#81pgdn]+[#13ret]+[#27esc];}
  end;
{  if ch in extchr then xrc:=ch;}
  if ch= #13 then xrc:=#13;
  if ch= #27 then xrc:=#27;
  if ch= #9  then xrc:=#9;

until xrc in extchr;
xrc:=ch;{Das e[X]it-char wird uebergeben....}
if xrc=#27 then begin gotoxy(wx,wy);xrs:=sss;for lv:=1 to x do write(fc);gotoxy(wx,wy);write(xrs);end;
end; {of procedure XR}



procedure fout(x,y,farb:byte;simm:string);  {** FASST-Output}
var q:byte;add,fbo:word;
begin     add:=y*160-162+x shl 1;fbo:=word(farb) shl 8;
          for q:=1 to ord(simm[0]) do begin
          memw[$b800:add]:=fbo+ord(simm[q]);inc(add,2) end end;



function givemaxx:integer;
begin givemaxx:=MEM[$0040:$004a];end;

function givemaxy:integer;
begin givemaxy:=MEM[$0040:$0084];end;

procedure BackupWIN;
BEGIN
if givemaxy=24 then vieracht:=4000;{bei 80x25=2000 Char+2000 Farb-bytes}
if givemaxy=49 then vieracht:=8000;
move(ptr($B800,0)^,feld,vieracht);
END;

Procedure RestoreWin;
BEGIN
move(feld,ptr($B800,0)^,vieracht);
END;

{procedure winshdw(a,b,c,d,wincol:integer);begin;
 for wos:=b to d do for x:=1 to c-a+1 do fout(a+x,wos+1,8,'�');
 window(a,b,c,d);textbackground(wincol);clrscr;
end;}

{***********************************+}

procedure winshdw(a,b,c,d,wincol:integer);var colat,wos:integer;begin;
colat:=0;wos:=0;
move(ptr($B800,0)^,feld,8000);
colat:=b*80+c;
colat:=FELD[colat*2];
repeat dec(colat);
(*str(colat:3,xrs);fout(3,1,15,xrs);delay(175);*)
until (colat mod 8=0) or (colat=8) or (colat<1);
if colat<8 then colat:=8;
 for wos:=b to d+1 do for x:=1 to c-a+1 do begin if wos=b then ch:='�' else ch:='�';
 if wos=d+1 then ch:='�';
 fout(a+x,wos,colat,ch);end;
 window(a,b,c,d);textbackground(wincol);clrscr;
end;

{procedure winshdw(a,b,c,d,wincol:integer);var ch:char;begin;
 for wos:=b to d+1 do for x:=1 to c-a+1 do begin if wos=b then ch:='�' else ch:='�';
 if wos=d+1 then ch:='�';
 fout(a+x,wos,8,ch);end;
 window(a,b,c,d);textbackground(wincol);clrscr;
end;}


{***********************************+}

procedure Xplwin(a,b,c,d,wincol:integer);var wos:integer;begin;
 pl:=b; for wos:=a to c do begin if pl<d then inc(pl);
 window(a,b,wos,pl);textbackground(wincol);clrscr;delay(2);
 end;
 for wos:=b to d do for x:=1 to c-a+1 do fout(a+x,wos+1,8,'�');
 window(a,b,c,d);textbackground(wincol);clrscr;
end;

procedure xclrscr;var clsy,clsl,aaa:integer;begin
if givemaxy=49 then begin
 for clsy:=1 to 25 do begin
 fout(1,clsy*2-1,0,'                                                                                ');
 end;
 delay(250);
 for clsy:=1 to 40 do begin
 for aaa:=1 to 50 do begin fout(clsy*2,aaa,0,' ');end;
 end;
 delay(250);
 for clsy:=1 to 25 do begin
 for aaa:=1 to 80 do begin fout(aaa,clsy*2,0,' ');delay(1);end;
 end;
end;{of 49-cls}
gotoxy(1,1);
end;{of xcls}

procedure sc(txc,bgc:byte);begin
textcolor(txc);textbackground(bgc);end;


END.