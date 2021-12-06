Program WinChoose; {WC ver 0.9แ}
uses crt,jancrt,dos;
var         x,y,z:integer;
     entries,posi,suddenquit:integer;
              prg:array[1..20] of string[20];{descriptions}
              pth:array[1..20] of string[80];{program-names inc. path}
             s,sb:string; {zeile aus cfg.datei}
               ch:char;
             cfg:text;
             open:word;
     cmdline:string[20];
procedure DispMen;begin
for x:=1 to entries do begin
{gotoxy(5,x+4);}gotoxy(1,x);
textcolor(white);textbackground(blue);
if x=posi then begin textcolor(8);textbackground(white);end;
write(prg[x]:22);
end;
fout(25,50,30,'อออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
fout(25,50,23,pth[posi]+' ');
{gotoxy(1,48);}
end;

label realquit,main,mainhelp;
BEGIN
inc(entries);prg[entries]:='Standard: PROGMAN';pth[entries]:='C:\WINDOWS\PROGMAN.EXE';
assign(cfg,'wc.ini');{$I-} reset(cfg); {$I+}
if ioresult <> 0 then begin writeln(^m^j,' Sorry, WC.INI not found. Please refer to WC.DOC ');exit;end;
write(^m^j,' Reading WC.INI ...');

while not eof(cfg) do begin
 readln(cfg,s);sb:=s;write('.');delay(10);
 if (s[1] <> ';') and (s[1] <> '@') and (s[1] <> '~') then begin inc(entries);
  delete(s,pos('^',s),length(s)-pos('^',s)+1);  prg[entries]:=s;
  delete(sb,1,pos('^',sb));                     pth[entries]:=sb;
 end;
 if s[1]='@' then begin
  delete(s,1,1);cmdline:=s;end;
 if s[1]='~' then begin
  if s[2]='1' then suddenquit:=1; end;

end;
writeln(' ok.');close(cfg);delay(100);
textmode(259);posi:=2;
fout(1,1,30 ,'ษอออออ F1-help ออ F4-edit ออ ESC-quit ออออออออออออออออออฤ WinChoose 0.9แ ฤอออออป');for x:=2 to 49 do
fout(1,x,30 ,'บ                                                                              บ');
fout(1,50,30,'ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
fout(3,50,31 ,' Program assigned to: ');
window(2,2,79,49);
textbackground(3);clrscr;



main:
fout(79,49,199,'Û');fout(79,48,244,'Û');fout(78,49,244,'Û');fout(78,48,199,'Û');

for x:=1 to entries+1 do begin if x=1 then fout(9,x+7,56,'ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ');
if x>1 then fout(9,x+7,56,'ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ');if x=entries+1 then fout(9,x+7,56,'฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿');end;
window(8,8,30,8+entries);

repeat
 dispmen;
 ch:=readkey;
 if ch=#0 then begin ch:=readkey;
  if ch=#80 then begin if posi=entries then posi:=0;if posi<entries then inc(posi);end;
  if ch=#72 then begin if posi=1 then posi:=entries+1;if posi>1 then dec(posi);end;
  {dos-shell, ALT-D}
  if ch=#32 then begin  backupwin; {$M $4000,0,0 } window(1,1,80,50);textbackground(black);clrscr;
  writeln(^m^j^j,' WC-DOS-Shell',^m^j^j,' Type EXIT to return to WC',^m^j^j);
  swapvectors;exec('C:\COMMAND.COM','');swapvectors;restorewin;
  window(8,8,30,8+entries);
  end;
  {dos-shell ende}
 end;
until (ch=#13) or (ch=#27) or (CH=#59);
 if cH=#27 then goto realquit;
 if ch=#59 then goto mainhelp;

{ MAIN ******************}
if ch=#13 then begin

 backupwin;
 fout(1,1,30 ,'ษอออออ F1 - help ออ ESC- quit ออออออออออออออออออออออออออฤ WinChoose 0.9แ ฤอออออป');for x:=2 to 49 do
 fout(1,x,30 ,'บ                                                                              บ');
 window(2,2,79,49);textbackground(3);clrscr;

 for x:=10 to 30 do begin
 if x<30  then fout(45,x,56,'ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ');if x=10  then fout(45,x,56,'ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ');
 if x=30  then fout(16,x,56,'฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿');end;

 window(15,10,65,29);textbackground(white);clrscr;textcolor(white);
 write(' ');textbackground(black);
 writeln(^m^j,' * Final phase !  Let''s go ...!                 ',^m^j);textbackground(white);
 textcolor(black);
 write(^m^j^j'  ***  Okay. Now running WINDOWS ... ');
 gotoxy(40,14);
 textbackground(black);textcolor(7+blink);write('Û');
 textcolor(0+blink);textbackground(white);write('Û');textbackground(black);textcolor(7+blink);write('Û');
 fout(55  ,24,112,'ณ');
 fout(53,25,112,'ภฤมฤฟ');gotoxy(wherex-2,wherey);
 {$M 2048,0,0 }
 swapvectors;
 exec('WIN.COM',+'/N '+pth[posi]);
 swapvectors;
 restorewin;
if doserror<>0 then begin fout(4,1,15+blink,'        Error! ("Where is WINDOWS ?" or "Not enough memory!")  [key]      ');
ch:=readkey;end;
fout(1,1,30 ,'ษอออออ F1 - help ออ ESC- quit ออออออออออออออออออออออออออฤ WinChoose 0.9แ ฤอออออป');for x:=2 to 49 do
 end;
 window(2,2,79,49);textbackground(3);clrscr;

if suddenquit=1 then goto realquit else begin goto main;end;

{end \main}

mainhelp:
backupwin;window(8,8,70,40);textbackground(blue);clrscr;
writeln(^m^j' yeah, help');
writeln(' not here, not yet.');
writeln(' esc to quit...');
ch:=readkey;restorewin;
goto main;

realquit:
window(1,1,80,50);gotoxy(36,25);textcolor(15);textbackground(blue);write(' Goodbye !');delay(300);
textbackground(black);textcolor(white);clrscr;
writeln(^m^j' ์์ ญ pรด ํ็๎v๎็ ! ์์');
textcolor(7);writeln(     ' E-Mail: hackerle@t-online.de');
END.