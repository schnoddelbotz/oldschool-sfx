Program BootUp;
Uses Crt,Dos;
Var     x,y,z:integer;
           ch:char;
      wadlist:searchrec;

Procedure Listwad;BEGIN
FindFirst('*.wad',Archive+ReadOnly,wadlist);
While Doserror <> 18 do begin
    if wherey>24 then begin x:=x+15;window(x,15,80,25);end;
    Writeln(wadlist.name);
    delay(2);
    FindNext(wadlist);
End;END;

Procedure DOOMI;BEGIN
chdir('D:\ETHER');
{exec('c:\dos\','smartdrv.exe');}
exec('startnet.bat','');
chdir('D:\DOOM1\');listwad;End;

Procedure DOOMII;BEGIN
chdir('D:\ETHER');exec('c:\dos\','smartdrv.exe');exec('startnet.bat','');
chdir('D:\DOOM2\');listwad;End;

Procedure NC;BEGIN
writeln(' hello nc will exec !');
exec('d:\tools\nc\','nc.exe');End;

BEGIN  {Programm-Beginn}
writeln(' F1 - DOOM 1 mit IPXsoft und 2 MB Smartdrv ');
writeln(' F2 - DOOM 2 mit IPXsoft und 2 MB Smartdrv ');
writeln(' F3 - Norton Commander 4.0 ohne Zus„tze');
ch:=readkey;
if ch=#0 then begin;
{$M 28000,0,0}
 swapvectors;
 ch:=readkey;
 if ch=#59 then begin doomi;end;
 if ch=#60 then begin doomii;end;
 if ch=#61 then begin nc;end;
end;
swapvectors;
writeln(doserror);
writeln(dosexitcode);
END.