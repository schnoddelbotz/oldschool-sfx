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
assign(f,'hallo.doc');reset(f,1);
textcolor(black);
blockread(f,bl,sizeof(bl),c);



repeat inc(y);
write(bl[y]);
until wherey=48;

textcolor(7);
window(1,50,80,50);textbackground(blue);

repeat
ch:=readkey;

window(1,2,80,49);textcolor(black);textbackground(white);

 if upcase(ch)='Y' then begin
  if filesize(f)-filepos(f)>3000 then begin
          seek(f,posif+y);blockread(f,bl,sizeof(bl),c);clrscr;
          posif:=posif+y;

         y:=0;
         repeat
         inc(y);
         write(bl[y]);
         until wherey=48;

  end;
 end;

 if upcase(ch)='A' then begin
  if filepos(f)+filesize(f)>filesize(f)+4000 then begin
          seek(f,posif-y);blockread(f,bl,sizeof(bl),c);clrscr;

         y:=0;
         repeat
         inc(y);
         write(bl[y]);
         until wherey=48;

         posif:=posif-y;
  end;
 end;

{ if ch=#0 then begin}
  if upcase(ch)='E' then begin  {81 pgdn}
  if filepos(f)>2000 then begin
          seek(f,filesize(f)-1000);blockread(f,bl,sizeof(bl),c);clrscr;

         y:=0;
         repeat
         inc(y);
         write(bl[y]);
         until y=c;


          posif:=filepos(f)-2000;
  end;
 end;
{ end;}

window(1,50,80,50);textbackground(blue);textcolor(7);
gotoxy(3,1) ;write(filepos(F)/filesize(F)*100:4:1,'%');
gotoxy(63,1);write('Chrs on scr: ',y);
until ch=#27;




writeln(' That was it :) Good englished. ');
{ch:=readkey;ch:=readkey;write(ord(CH));delay(1000);}
end.