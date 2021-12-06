Program LassdenComputerDochRechnen;
Uses Crt,jantools;
Var x,y,z,m,intformel:longint;
        ykoord:longint;
        neuwert,altwert:real;
       ch:char;
     errcode:integer;
     formel,xstr:string;

BEGIN

 textmode(font8x8+3);
 textbackground(blue);textcolor(green);
 clrscr;
 write(' Funktion fÅr F(X) eingeben:');read(formel);
 write(' Funktion von: ');z:=wherex;read(x);gotoxy(z+4,wherey-1);
 write(' bis: ');z:=wherex;read(y);gotoxy(z+4,wherey-1);
 write(' berechnen !');
 writeln;writeln(' Also... FOR X:=',x,' TO ',y,' DO BEGIN .... ');
 writeln(' DrÅcke eine Taste. ');
 ch:=readkey;
 clrscr;


{formel erkennen !}




FOR X:=x to y do begin

altwert:=neuwert;

    FOR m:=1 to LENGTH(formel) do begin
     if formel[m] = 'X' then begin
                 str(X,xstr);
                 formel[m]:=xstr;
find

   val(formel,intformel,errcode);
   writeln(' DIE FORMEL HIESSE HIER: ',intformel);

neuwert:=( sqr(x) );

if neuwert<altwert then textcolor(red) else textcolor(black); {fallend oder}
if wherex>60 then writeln;
write(' X=',x,' Y=',neuwert:2:4,'   ');                          {steigend ?}


   {pause am seitenende :}
    if wherey=givemaxy+1 then begin gotoxy(15,givemaxy+1);textcolor(white);
    write(' ............. Press any key for more, q quits .......... ');
    ch:=readkey;
    if (upcase(ch)='Q') or (ch=#27) then exit;
    clrscr; end;
   {ende von pause am seitenende}

end;


gotoxy(30,wherey+1);textcolor(white);
writeln('  Press any key to continue .. ');
ch:=readkey;
delay(200);
textmode(3);clrscr;textbackground(blue);
textcolor(green);write(' Anfangswert ');textcolor(black);write(' Zunehmend ');
textcolor(red);write(' Abnehmend ');textcolor(white);writeln(' INFOs');
writeln(' CODED by phl. ');textbackground(black);writeln;
END.