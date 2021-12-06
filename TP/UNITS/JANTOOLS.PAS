Unit JanTools;
interface
uses crt;
var y,w,d,x,maxx,maxy,vieracht:integer;
                          feld:array[1..4000] of byte;
procedure ucls(x,d:integer);
procedure ccls(ccd:integer);
procedure dcls(dcd:integer);

procedure sinfowin(j:string;c:integer);
procedure slowdisprl(M:string;c2,b2,d2:integer);
procedure slowdisplr(M:string;c3,b3,d3:integer);
procedure gomaxy(XPOS:INTEGER);
procedure writec(tc,bc:integer;txt:string);

Procedure BackupWin;
Procedure RestoreWin;

function givemaxx:integer;
function givemaxy:integer;
implementation

procedure Ucls(x,d:integer);begin
for y:=1 to (givemaxx*givemaxy) do begin
textbackground(x);write(' ');delay(d);end;
gotoxy(1,1);
end;

procedure ccls(ccd:integer);begin
for x:=1 to (givemaxy div 2)+2 do begin {DIV 2 !!!}
gotoxy(1,givemaxy div 2);
insline;insline;
gotoxy(1,1);
delline;
delay(ccd);
end; {end der for x to givemax-schleife}
end; {total end of procedure}

procedure dcls(dcd:integer);begin
for x:=1 to (givemaxy div 2)+2 do begin {DIV 2 !!!}
gotoxy(1,1);
insline;
gotoxy(1,givemaxy div 2);
delline;delline;
delay(dcd);
end; {end der for x to givemax-schleife}
d:=givemaxx;
for x:=1 to givemaxx do begin
gotoxy(1,givemaxy div 2);
dec(d);
delline;
end;
end; {total end of procedure}








Procedure sInfowin(j:string;c:integer);begin
 window(20,10,60,19);ucls(c,0);
 textcolor(15);write('ีอออออออออออออออออออออออออออออออออออออออธ');
               write('ณ                                       ณ');
               write('ณ                                       ณ');
               write('ณ                                       ณ');
               write('ณ                                       ณ');
               write('ณ                                       ณ');
               write('ณ                                       ณ');
               write('ณ                                       ณ');
               write('ณ                                       ณ');
               write('ิอออออออออออออออ[ Okay ! ]อออออออออออออพ');
 window(21,11,59,17);
  for w:=1 to length(j) do begin
  write(j[w]);if j[w] = '.' then delay (75);delay(15);end;
end;

procedure Slowdisprl(m:string;c2,b2,d2:integer); begin
textcolor(c2);textbackground(b2);
for x:=length(m) downto 1 do begin
write(m[x]);write(#8);write(#8);delay(d2);
end;
end;

procedure Slowdisplr(m:string;c3,b3,d3:integer); begin
textcolor(c3);textbackground(b3);
for x:=1 to length(m) do begin
write(m[x]);delay(d3);
end;
end;


procedure gomaxy(xpos:integer);begin
maxy:=MEM[$0040:$0084];
gotoxy(xpos,maxy+1);end;


procedure writec(tc,bc:integer;txt:string);begin
textcolor(tc);textbackground(bc);write(txt);end;


procedure BackupWIN;BEGIN
if givemaxy=24 then vieracht:=4000;
if givemaxy=49 then vieracht:=8000;
move(ptr($B800,0)^,feld,vieracht);
END;

Procedure RestoreWin; BEGIN
move(feld,ptr($B800,0)^,vieracht);
END;







function givemaxx:integer;
var gotmaxx:integer;begin givemaxx:=MEM[$0040:$004a];end;

function givemaxy:integer;
var gotmaxy:integer;begin givemaxy:=MEM[$0040:$0084];end;

{procedure xxx(g:string); begin .... end}
begin
end.