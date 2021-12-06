Program MORSEN;       {by Jan Hacker - (c) 1995 - Ver. 0.195·}
Uses Crt,DOS;
Procedure LS;
BEGIN
sound(2000);delay(350);nosound;delay(220);
END;
Procedure SS;
BEGIN
sound(2000);delay(80);nosound;delay(220);
END;
Var a,b,c:char;
        x:integer;
label start;
BEGIN
textcolor(white);textbackground(black);
clrscr;
writeln;
writeln('            READ THIS AND FUCK OFF :');
writeln;
writeln(' Morse-Programm M ô S I - (c) by Jan the Hacker 1995');
writeln(' Version  0.195· - Beta-Version - Do not distribute!');
write(' SOUND_INIT.');for x:=1 to 2 do begin write('.');delay(350);end;nosound;
window(2,2,80,19);
textbackground(white);textcolor(red);
clrscr;
writeln;
writeln('    M ô S I -  Automatic Morser  -  written  by  Jan the Hacker ');
writeln('    (c) January 1995 - ·-Release Ver. 0.195 - DO NOT DISTRIBUTE');
writeln;textcolor(black);
writeln('   Press SPACE to morse in "freehand"-mode, or enter the char to "send" !');
writeln('   ESC exits. No Help available yet (DON`T cry... i`ll create it !)');
writeln;textcolor(blue);
writeln('   Characters: a-z (small only !!!), numbers: 0-9, Ñ,Å,î, and , . : - ?');
writeln('                   Use Ñ, Å, î for sending Ae, Ue, Oe !!!');
writeln('   SOS: *          ERROR: %          ROGER: "             END: $');
start:
a:=readkey;
nosound;
if a=#27 then begin gotoxy(1,20);exit;end;
{freehand morse...}
{if a=#32 then begin
  repeat
    sound(2000);delay(1);nosound;
  until keypressed;
nosound;
end;}
{...standard characters from a to z...}
case a of
  'a' : begin; ss;ls; end;
end;
{if a='a' then begin ss;ls; end;}
if a='b' then begin ls;ss;ss;ss;         end;
if a='c' then begin ls;ss;ls;ss;         end;
if a='d' then begin ls;ss;ss;            end;
if a='e' then begin ss;                  end;
if a='f' then begin ss;ss;ls;ss;         end;
if a='g' then begin ls;ls;ss;            end;
if a='h' then begin ss;ss;ss;ss;         end;
if a='i' then begin ss;ss;               end;
if a='j' then begin ss;ls;ls;ls;         end;
if a='k' then begin Ls;ss;ls;            end;
if a='l' then begin ss;ls;ss;ss;         end;
if a='m' then begin Ls;ls;               end;
if a='n' then begin ls;ss;               end;
if a='o' then begin ls;ls;ls;            end;
if a='p' then begin ss;ls;ls;ss;         end;
if a='q' then begin Ls;ls;ss;ls;         end;
if a='r' then begin ls;ss;ls;            end;
if a='s' then begin ss;ss;ss;            end;
if a='t' then begin ls;                  end;
if a='u' then begin ss;ss;ls;            end;
if a='v' then begin ss;ss;ss;ls;         end;
if a='w' then begin ss;ls;ls;            end;
if a='x' then begin ls;ss;ss;ls;         end;
if a='y' then begin ls;ss;ls;ls;         end;
if a='z' then begin ls;ls;ss;ss;         end;
{...messages...}
if a='*' then begin ss;ss;ss;ls;ls;ls;ss;ss;ss; end;
if a='%' then begin ss;ss;ss;ss;ss;ss;ss;ss;    end;
if a='"' then begin ss;ss;ss;ls;ss;             end;
if a='$' then begin ss;ls;ss;ls;ss;             end;
{...german special charactrs...}
if a='Ñ' then begin ss;ls;ss;ls;                end;
if a='î' then begin ls;ls;ls;ss;                end;
if a='Å' then begin ss;ss;ls;ls;                end;
{...and now point, comma etc....}
if a='.' then begin ss;ls;ss;ls;ss;ls;          end;
if a=',' then begin ls;ls;ss;ss;ls;ls;          end;
if a=':' then begin ls;ls;ls;ss;ss;ss;          end;
if a='-' then begin ls;ss;ss;ss;ss;ls;          end;
if a='?' then begin ss;ss;ls;ls;ss;ss;          end;
goto start;
END.