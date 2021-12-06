Program fon2; {today: let's do a blockrea :)
               quattro: don't read around, just help me ! ;-)}
uses crt;

Var     kn,ab,res:file;
           bl:array [1..32000] of char;
           wl:array [1..2000] of char;
           ch:char;
        x,z,wx,wy,la,wlx:integer;
          y,blxr:longint;
          pos:integer;
      numRead:word;
       rel:reaL;
{prozeduren vereinfachern das leben ! ... und funktionen ? }
label cont;
BEGIN
textmode(3+font8x8);
clrscr;
assign(kn ,'d:\Tmp\kn-asc.txt');reset(kn,1);
assign(res,'d:\tmp\phl.tmp');rewrite(res,1);
window(1,1,80,1);textbackground(blue);clrscr;
write('--- PHLs FON (tm) now uses blockread! Look, how fast it is! :) ---');
textbackground(black);window(1,1,80,50);

repeat
if keypressed then begin ch:=readkey; if ch=#27 then exit; end;
blockread(kn,bl,sizeof(bl),numRead);inc(blxr);rel:= ( blxr*32000 / filesize(kn)*100);
window(1,1,80,1);
gotoxy(68,1);
        if rel>100 then begin write('[°°°°°°°°°°]');goto cont; end;
         if rel>90 then begin write('[°°°°°°°°°.]');goto cont; end;
         if rel>80 then begin write('[°°°°°°°°..]');goto cont; end;
         if rel>70 then begin write('[°°°°°°°...]');goto cont; end;
         if rel>60 then begin write('[°°°°°°....]');goto cont; end;
         if rel>50 then begin write('[°°°°°.....]');goto cont; end;
         if rel>40 then begin write('[°°°°......]');goto cont; end;
         if rel>30 then begin write('[°°°.......]');goto cont; end;
         if rel>20 then begin write('[°°........]');goto cont; end;
         if rel>10 then begin write('[°.........]');goto cont; end;
         if rel<10 then begin write('[..........]');goto cont; end;

cont:
window(1,2,80,50);
gotoxy(wx,wy-1);


writeln;

 for x:=1 to 32000 do begin
  if bl[x]=  'H' then begin
  if bl[x+1]='A' then begin
  if bl[x+2]='C' then begin
  if bl[x+3]='K' then begin
  if bl[x+4]='E' then begin
  if bl[x+5]='R' then begin
  if bl[x+6]=' ' then begin

      textcolor(red);
      write(^J^M,'Found chrs at :',filepos(kn)+x,^M^J);
      textcolor(7);

      for wlx:=z+x-100 to z+x+100 do begin
      wl[wlx]:=bl[wlx];
      end;
      blockwrite(res,wl,numRead);

         for z:=1 to 200 do begin
          write(bl[z+x-100]);
         end;wx:=wherex;wy:=wherey;

  end;
  end;
  end;
  end;
  end;
  end;
  end;

 end;


until numread=0;

writeln;
writeln(' ---- and finally i really did it ! ---');
ch:=readkey;
close(kn);close(res);
END.