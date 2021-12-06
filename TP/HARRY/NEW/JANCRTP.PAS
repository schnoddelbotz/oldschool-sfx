Unit JanCrtp;
INTERFACE
Uses crt;
const normchr=[#225]+[#33..#126]+[#129..#165];
var       lv,wx,wy,wx2:integer; {laufvariable,wherex+y}
                 ins:integer;
               ch:char;
                xrs:string;
procedure XR(x:integer;sss:string;bgc,txc:integer;fc:char); {eXtended Readln}
Implementation
Procedure XR(x:integer;sss:string;bgc,txc:integer;fc:char);begin
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
   if ch =#59 then {f1}   xrs:=#459;
   if ch =#60 then {f2}   xrs:=#460;
   if ch =#61 then {f3}   xrs:=#461;
   if ch =#62 then {f4}   xrs:=#462;
   if ch =#63 then {f5}   xrs:=#463;
   if ch =#80 then {dn}   xrs:=#480;
   if ch =#72 then {up}   xrs:=#472;
   if ch =#9  then {tab}  xrs:=#409;
   if ch =#73 then {pgup} xrs:=#473;
   if ch =#81 then {pgdn} xrs:=#481;
  end;

 if ch=#27 then xrs:=#27;
until (ch=#13) or (ch=#27) or (xrs=#459);

end; {of procedure XR}
END.