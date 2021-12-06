Program Typp; {Ver 1.0á, Zum anzeigen von Dateien unter Dos}
USES Crt,dos;
Var x,lm,cnt:integer;
    f:text;
    h:string;
    dir_record:searchrec;
    ch:char;
    label err,ent;

Procedure Helpdisp;BEGIN;writeln;textcolor(15);
writeln('   TYPP ver 1.0á by PHL');writeln;
writeln('   Shows Textfiles. SYNTAX:');
writeln('  TYPP [filename] [/switches]');
writeln('   filename   :    file to display (for e.g. config.sys');
writeln('   switches   :   /P     pause after each page');
writeln('                  /?     show this help');
writeln('   The /P-Option is also setable with SET TYPPCMD=/P for Standard!');
textcolor(7);exit;end;{of helpdisplay}

BEGIN
lm:=0;
IF (Paramstr(1)='/?') OR (Paramstr(2)='/?') then begin helpdisp;goto ent;end;
IF (Paramstr(1)='-?') OR (Paramstr(2)='-?') then begin helpdisp;goto ent;end;
IF (Paramstr(1)='/P') OR (Paramstr(2)='/P') then lm:=1;
IF (Paramstr(1)='/p') OR (Paramstr(2)='/p') then lm:=1;
IF (Paramstr(1)='') then begin helpdisp;goto ent;end;
IF (Getenv('TYPPCMD') = '/P') or (Getenv('TYPPCMD') = '/p')then begin lm:=1;end;
findfirst(paramstr(1),$20,dir_record);
if doserror <> 0 then begin writeln(' TYPP-Error Nr. 1 : The file was unlocateable.');helpdisp;goto ent;end;

{$I-}
assign(f,paramstr(1));
reset(f);
WHILE not seekeof(F) DO BEGIN
readln(f,h);

{pos MZ and then say executeable file - wont display... only if ya wannato}
writeln(h);
IF LM=1 then begin
   if cnt>24 then begin textcolor(15);write(' ---Any key to continue, q to quit ---');
   ch:=readkey;writeln;
   if length(h) > 80 then cnt:=(cnt+1);
   if upcase(ch)='Q' then exit;cnt:=0;textcolor(7);end;
   inc(cnt);
              end;

END;
close(f);
ent:
END.