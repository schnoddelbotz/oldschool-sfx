Program TypeFILE;
Uses crt,jancrt;

type  Person = record
         Name:String[20];
        VName:String[20];
          Str:String[20];
          PLZ:String[20];
          fon:String[20];
           nr:Integer;
end;

var                                  x,act,wx,wy:integer;
                                     y:real;
                                    ch:char;
                                  s,en:string;
                                     f:file of person;
                                     errCode:word;
                                     P:person;


procedure JumpTo(X:Integer);begin
clrscr;
seek(f,x);gotoxy(1,2);writeln(^m^j' Eintrag ',x);
read(f,p);writeln(p.Name);writeln(p.Vname);writeln(p.str);writeln(p.plz);writeln(p.fon);
seek(f,x);act:=x;
end;
procedure ShowNext;begin
seek(f,act+1);textcolor(white);writeln(' *** Eintrag ',act+1:4,' ***');textcolor(7);
read(f,p);writeln(p.Name);writeln(p.Vname);writeln(p.str);writeln(p.plz);writeln(p.fon);
inc(act);
end;
procedure EditAct;begin
seek(f,act-1);textcolor(white);writeln(' *** Eintrag ',act:4,' ***');textcolor(7);
read(f,p);writeln(p.Name);writeln(p.Vname);writeln(p.str);writeln(p.plz);writeln(p.fon);
writeln(' Enter New Data !');writeln;
write(' Name :');xr(20,p.name,white,black,'°');p.name:=xrs;writeln;
if xrs<> 'QUITNOW!!!' then write(f,p) else writeln(^m^j,' No changes made.');
seek(f,act-1);
end;

procedure ViewAct;begin
seek(f,act-1);writeln(' Eintrag ',x);
read(f,p);writeln(p.Name);writeln(p.Vname);writeln(p.str);writeln(p.plz);writeln(p.fon);
end;



BEGIN
clrscr;x:=1;act:=1;
assign(f,'TYP.RMN');rewrite(f);

for x:=1 to 250 do begin write('.');p.Name:='Hacker';p.VName:='Jan';p.Str:='H.v.Tett.Str. 20';p.plz:='78465 KN';
p.fon:='07533-97086';p.nr:=x;write(f,p);end;
ch:=readkey;exit;


repeat
textbackground(black);textcolor(7);
wx:=wherex;wy:=wherey;gotoxy(1,1);write(' J - Jump2Entry   E-Edit  N-Next  V-ViewAct S-Save');
textcolor(white);write(' Actual Entry :',act);textcolor(7);gotoxy(wx,wy);


ch:=readkey;
if upcase(ch)='J' then begin write('Enter Entry-Nr.:');readln(en);val(en,x,errCode);JumpTo(x);end;
if upcase(ch)='E' then begin EditAct;end;
if upcase(ch)='N' then begin ShowNext;end;
if upcase(ch)='V' then begin ViewAct;end;
if upcase(ch)='S' then begin close(F);reset(f);seek(f,act);writeln(^M^J' Saved.');end;

wx:=wherex;wy:=wherey;gotoxy(1,1);write(' J - Jump2Entry   E-Edit  N-Next  V-ViewAct');
textcolor(white);write(' Actual Entry :',act);textcolor(7);gotoxy(wx,wy);

until ch=#27;








writeln(' Done . Closing file ... Bye! Pleas press any key');
close(F);
ch:=readkey;
END.