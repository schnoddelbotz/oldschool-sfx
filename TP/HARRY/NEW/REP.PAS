Program REP;
uses crt,jancrt;
var           x,y,z,posi,disper:integer;
                      ch:char;
                 strings:array [1..8] of string[20];
                       s:string;
procedure disp1;begin
gotoxy(1,1);
for x:=1 to 8 do begin
textcolor(white);textbackground(blue);
if x=posi then begin textcolor(blue);textbackground(white);end;
writeln(strings[x]);
end;
end;


procedure disp2;begin
for x:=8 downto 1 do begin
 gotoxy(61,x);
 textcolor(white);textbackground(blue);
 if x=posi then begin textcolor(blue);textbackground(white);end;
 write(strings[x]);
 end;
end;




BEGIN
clrscr;posi:=1;textmode(259);disper:=1;textcolor(white);
for x:=1 to 1259 do write(x);

backupwin;
strings[1]:=' Datei ™ffnen       ';
strings[2]:=' Datei Schlieáen    ';
strings[3]:=' Datei L”schen      ';
strings[4]:=' Turbo einlegen     ';
strings[5]:=' Turbo rausnehmen   ';
strings[6]:=' Kacke reden        ';
strings[7]:=' -----------------  ';
strings[8]:=' Programm beenden   ';

repeat
fout(1,50,18,strings[posi]);
if disper=1 then disp1; if disper=2 then disp2;
str(posi,s);fout(1,50,18,s);
ch:=readkey;if ch=#0 then begin ch:=readkey;


 if ch=#77 then begin posi:=1;if disper<>2 then restorewin;disper:=2;end;
 if ch=#75 then begin posi:=1;if disper<>1 then restorewin;disper:=1;end;
end;
until (ch=#13) or (ch=#27);


END.