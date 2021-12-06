Program StringTest;
Uses crt;
Var a,x,y,z,m,g:integer;
     ch:char;
      s:string;
BEGIN
randomize;
textbackground(black);
clrscr;
gotoxy(30,20);writeln('Jans Testscreen fuer 80x50');
for x:=1 to 80*50-1 do begin textcolor(random(15));delay(0);write('±');end;
gotoxy(1,1);textcolor(white);
a:=1;x:=0;y:=1;z:=0;
for x:=1 to 80 do begin
 if a=0 then begin write('X');textcolor(white); end else write(a);
 inc(y);inc(a);
 if y=10 then begin a:=0;y:=0;end;
end;
gotoxy(1,1);
a:=1;x:=0;y:=1;z:=0;
for x:=1 to 49 do begin
 inc(m);
 if a=0 then begin writeln('<-',m);textcolor(white); end else writeln(a);
 inc(y);inc(a);
 if y=10 then begin a:=0;y:=0;end;
 if x=49 then begin write('<-50');end;
end;
ch:=readkey;
END.