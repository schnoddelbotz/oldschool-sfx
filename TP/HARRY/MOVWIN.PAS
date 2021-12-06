Program MoveWIN;
Uses Crt,Jantools;
Var        x,x1,y1,x2,y2,y,z,a,xn,yn,xn2,yn2:integer;
              maxx,maxy,ypos:integer;
              ch,ch2:char;
            str1:string;
               c:^byte;


procedure awin; Begin
 inc(z);
 window(1,25,80,25);textbackground(blue);clrscr;
 write(' FLOW :',z,'  STRING-INHALT: ',ch,'    ... osnt nichts !');
 window(1,1,80,24);
 end;

procedure nco; begin textbackground(X);clrscr;write('nummer ...');end;

BEGIN
textbackground(blacK);textcolor(7);
clrscr;


window(20,16,32,16);
{for a:=1 to 80*5-1 do begin write('WARUM');end;}



repeat
 x1:=lo(windmin);y1:=hi(windmin);x2:=lo(windmax);y2:=hi(windmax);
 ch:=readkey;
 if upcase(ch)='C' then clrscr;
 if upcase(ch)='I' then begin   write('Aktuelles Textfenster: (',x1,',',y1,',',x2,',',y2,')');end;
  if ch=#0 then begin
   cH:=readkey;
    if ch=#80 then begin yn:=y1+2;yn2:=y2+2;xn:=x1+1;xn2:=x2+1;window(xn,yn,xn2,yn2);nco;end;{down!}
{    if ch=#77 then begin yn:=y1+1;yn2:=y1+1;xn:=x1+2;xn2:=x2+2;window(xn,yn,xn2,yn2);nco;end; {riht}
{    if ch=#75 then begin yn:=y1+1;yn2:=y2+1;window(x1,yn,x2,yn2);nco;end; {left!}
    if ch=#72 then begin xn:=x1+1;xn2:=x2+1;window(xn,y1,xn2,y2);nco;end; {up!}
  end;
inc(x);if x=10 then x:=0;
until ch=#27;
ypos:=wherey;
{Inhalt des Aktuellen Fensters lesen}

clrscr;write('LastWin!');
window(1,1,80,25);



for x:=1 to 80*24 do begin
c:=ptr($B800,x*2);
textcolor(RED+blink);
write(chr(c^));
end;

{wenn ausgabe=LASTWIN!, dann ok!}

{  writeln(' xn1:',xn,' yn1:',yn,' xn2:',xn2,' yn2:',yn2,' char:',ord(ch));
  writeln(' x1 :',x1,' y1 :',y1,' x2 :',x2 ,' y2 :',y2 ,' char:',ord(ch));}

writeln;writeln('press any key.');
ch:=readkey;

END.
