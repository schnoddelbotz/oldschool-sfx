Program FileView;
uses crt;
var           f:file;
             bl:array [1..3000] of char; {80*50 - 2 zeilen - 1 zeichen}
              s:array [1..48] of string;
             ch:char;
          x,y,z:integer;
          posif:longint;
              c:word;
BEGIN
clrscr;
window(1,1,80,50);textbackground(blue);clrscr;
write(' Press up[a]/down[y] to scroll in text, [esc] to exit !');
window(1,2,80,49);textbackground(white);clrscr;
assign(f,'d:\tmp\kn-asc.txt');reset(f,1);
textcolor(black);
blockread(f,bl,sizeof(bl),c);

posif:=0;

for x:=1 to 3000 do begin
write(bl[x]);
end;
window(1,50,80,50);textbackground(blue);textcolor(4);write(' Now we have: ',filepos(F)/filesize(F)*100:3:0,'%');

repeat
ch:=readkey;



window(1,2,80,49);textcolor(black);textbackground(white);

 if upcase(ch)='Y' then begin
  if filepos(f)<filesize(f)-3000 then begin
          seek(f,posif+3000);blockread(f,bl,sizeof(bl),c);clrscr;

          for y:=1 to 3000 do begin
          if bl[y]=^M then begin
           if bl[y+1]=^J then begin
            inc(z);
            s[z]:=bl[y+2]+bl[y+3]+bl[y+4]+bl[y+5]+bl[y+6]+bl[y+7]+bl[y+8];

           end;
          end;

          end;

          for y:=1 to 48 do writeln(s[y]);
          {for x:=1 to 3000 do begin write(bl[x]);end;}
          posif:=posif+3000;
  end;
 end;

 if upcase(ch)='A' then begin
  if filepos(f)<filesize(f)-3000 then begin
          seek(f,posif-3000);blockread(f,bl,sizeof(bl),c);clrscr;
          for x:=1 to 3000 do begin write(bl[x]);end;
          posif:=posif-3000;
  end;
 end;

{ if ch=#0 then begin}
  if upcase(ch)='E' then begin  {81 pgdn}
  if filepos(f)>3000 then begin
          seek(f,filesize(f)-15000);blockread(f,bl,sizeof(bl),c);clrscr;
          for x:=1 to 3000 do begin write(bl[x]);end;
          posif:=posif-3000;
  end;
 end;
{ end;}

window(1,50,80,50);textbackground(blue);textcolor(4);write(' Now we have: ',filepos(F)/filesize(F)*100:3:0,'%');
until ch=#27;




writeln(' That was it :) Good englished. ');
{ch:=readkey;ch:=readkey;write(ord(CH));delay(1000);}
end.