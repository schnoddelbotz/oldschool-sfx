Program RealScroller;


Uses crt,jantools;
var yp,y,z:integer;
           ch:char;
            s,drv:string;

procedure wi;begin;
window(1,50,80,50);textbackground(blue);textcolor(white);clrscr;
case yp of
 1 : begin drv:='C:';end;
 2 : begin drv:='D:';end;
 3 : begin drv:='E:';end;
 4 : begin drv:='F:';end;
end;
write('   Installiert das Programm auf Laufwerk ',drv,'.');
if yP=5 then begin clrscr;write('   Verl��t das Installationsprogramm');end;
end;

procedure wf;begin;
window(13,15,25,18);textbackground(white);end;
procedure ws;begin;
window(26,15,27,19);textbackground(red);clrscr;end;

procedure title;begin
window(1,1,80,3);textbackground(blue);clrscr;textcolor(white);
writeln('                         Installationsprogramm f�r FON 2.0');
writeln('                                    (c) phl. 96');
end;

label ente,cont,step_drv;




BEGIN
step_drv:
textmode(co80+font8x8);
textbackground(red);clrscr;for z:=1 to 4000 do write('�');title;
window(14,16,28,20);textbackground(black);clrscr;
window(13,15,25,19);textbackground(blue);clrscr;textcolor(white);
writeln;writeln;writelN;writeln;write(' > Q U I T <');
wf;clrscr;writeln(' Laufwerk C:');writeln(' Laufwerk D:');writeln(' Laufwerk E:');write(' Laufwerk F:');
ws;
wi;
ws;yp:=1;write(#27);wi;
repeat
ch:=readkey;
 if ch=#0 then begin wi;write(ord(ch));ch:=readkey;
{up}  if ch=#72 then begin
         if yp=1 then begin ws;gotoxy(1,5);write('a');yp:=wherey;wi; end;
         ws;gotoxy(1,yp-1);write(#27);yp:=wherey;wi;
      end;
{down}if ch=#80 then begin wi;write(ord(ch));
         ws;gotoxy(1,yp+1);write(#27);yp:=wherey;wi;
      end;
 end;
if ch=#13 then begin
       if yp=5 then goto ente else goto cont;end;

until ch=#27;goto ente;
cont:
window(1,1,80,50);
clrscr;
writeln(' Das Proggi wird nun auf ',drv,' installiert.');delay(1000);
writeln('fertig. key 2 quit');ch:=readkey;



ente:
window(1,1,80,50);
textbackground(black);textcolor(white);dcls(5);
gotoxy(1,1);
writelN(' THX 4 USING ');
END.