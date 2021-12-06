Program Typp; {Ver 1.0á, Zum anzeigen von Dateien unter Dos}
USES Crt,dos;
Var x:integer;
    f:text;
    h:string;
    dir_record:searchrec;
    ch:char;
    label err,ent;

Procedure Helpdisp;BEGIN;writeln;textcolor(15);
writeln('   TYPP ver 1.0á by PHL');writeln;
writeln('   Shows files. SYNTAX:');
writeln('  TYPP [filename] [/switches]');
writeln('   filename   :    file to display (for e.g. config.sys');
writeln('   switches   :   /P     pause after each page');
writeln('                  /?     show this help');textcolor(7);exit;end;{of helpdisplay}

BEGIN
clrscr;  { just now, later no more !!!!!!!!!!!!!}
{ if file not found then show sysntax}
IF (Paramstr(1)='/?') OR (Paramstr(2)='/?') then begin helpdisp;goto ent;end;
IF (Paramstr(1)='-?') OR (Paramstr(2)='-?') then begin helpdisp;goto ent;end;
IF (Paramstr(1)='') then begin helpdisp;goto ent;end;
writeln(' The file to show: ',paramstr(1));

findfirst(paramstr(1),$20,dir_record);
if doserror <> 0 then begin writeln(' The file was unlocateable. ');
ch:=readkey;goto ent;end;

{$I-}
assign(f,paramstr(1));
reset(f);
{writeln(f,' Jan ist doof !');}

WHILE not seekeof(F) DO BEGIN
readln(f,h);
writeln(h);
END;

close(f);


ent:
END.