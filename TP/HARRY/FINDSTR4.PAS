Program FindStr2;
Uses Crt,Jantools,dos;
Var x,y,zz,x1,y1,found,i:longint;
    suchstr,dateiname,zeile:string;
    datei1:text;
     h, m, s, hund : Word;
       ch:char;
    label newsearch,ent;

BEGIN

clrscr;

if paramcount <> 0 then begin dateiname:=paramstr(1); end else
begin write(' Filename to serach in   : ');readln(dateiname);end;
if dateiname='' then exit;
{$I-}
assign(datei1,dateiname);reset(datei1);
if ioresult <> 0 then begin writeln;writeln (' File does not exist !');exit;end;
{$I+}
write(' Choosen file            : ',dateiname,'      ');textcolor(black);textbackground(white);writeln(' FILE CHECK OK !');
textcolor(7);textbackground(8);

newsearch:

if paramcount >  1 then begin
suchstr:=paramstr(2);end else begin
write(' Enter search-string     : ');readln(suchstr);end;



if suchstr='' then exit;


window(1,1,80,1);textbackground(white);clrscr;textcolor(black);
if length(dateiname)>20 then delete(dateiname,1,15);

write(' Zeile ³  File :  ',dateiname,' ³ Findstr by PHL ³ Aktuelle Zeile : ...');
window(1,2,80,givemaxy+1);textbackground(black);textcolor(white);clrscr;

for i:=1 to Length(suchstr) do begin suchstr[i]:=UpCase(suchstr[i]);end;


while not seekEof(datei1) do begin
inc(zz);
x1:=wherex;y1:=wherey;window(1,1,80,1);gotoxy(70,1);textcolor(black);textbackground(white);write(zz:10);
textcolor(7);textbackground(8);window(1,2,80,givemaxy+1);gotoxy(x1,y1);
readln(datei1,zeile);

if keypressed then begin
  ch:=readkey;
  if upcase(ch)='P' then begin textcolor(15);
                  writeln('           Pausing ... press any key ...');
                  ch:=readkey;textcolor(7);end;
  if ch=#27 then begin goto ent;end;
end;

for i := 1 to Length(zeile) do begin zeile[i] := UpCase(zeile[i]);end;

 if pos(suchstr,zeile) > 0 then begin
    inc(found);
      if length(zeile) > 10 then begin delete(zeile,71,235);end;
 writeln(' ',zz,' : ',zeile);
      if wherey>givemaxy-1 then begin textcolor(white);write('               Press any key to continue .... [ESC] to exit.');
      ch:=readkey; if ch=#27 then exit; textcolor(7);clrscr;end;
 end;
END; {der while not seekEof-Schleife}

ent:
if wherey>givemaxy-8 then begin textcolor(15);writeln('       Press any key to continue .... ');ch:=readkey;end;
textcolor(white);
Writeln;
writeln('                          ---  SEARCH FINISHED. ---');
writeln('                         Searchstring: ', Suchstr);
writeln('                              Totally found : ', found);
writeln('                        --- Press any key to exit ---');
ch:=readkey;

close(datei1);
ccls(30);

gotoxy(1,givemaxy-1);
END.