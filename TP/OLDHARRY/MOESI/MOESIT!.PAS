Program MORSEN;       {by Jan Hacker - (c) 1995 - Ver. 0.195�}
{soon 3 CMD-Line-Options will available: Delay between each sound and the
 length of each beep (Short , Long). !!! Watch outr for Version 2.x�}
Uses Crt,DOS;

Var                   a,b,c:char;
            s,x,en,e,r,cs,f:integer;
                y,z,lss,lls:string;


Procedure LS;
BEGIN
sound(2000);delay(300);nosound;delay(200);
END;

Procedure SS;
BEGIN
sound(2000);delay(80);nosound;delay(200);
END;


label start,ent,beg,nodone;
BEGIN
textcolor(white);textbackground(black);
clrscr;
lss:=paramstr(1);
lls:=paramstr(2);
writeln;
writeln(' For a following Version of M � S I: Parameters. Only here in �-Ver:');
writeln('   Parameter 1: ',lss);
writeln('   Parameter 2: ',lls);
writeln;
writeln('            READ THIS AND FUCK OFF :');
writeln;
writeln(' Morse-Programm M � S I - (c) by Jan the Hacker (PHL)');
writeln(' Version  1.95 � - Beta-Version - Do not distribute!');
write(' SOUND_INIT.');for x:=1 to 10 do begin write('.');delay(100);end;
beg:
nosound;
window(2,2,80,20);
textbackground(white);textcolor(red);
clrscr;
write('�����������������������������������������������������������������������������ͻ');
writeln('       M � S I -  Automatic Morser  -  written  by  Jan the Hacker ');
writeln('       (c) January 1995 - �-Release Ver. 1.95  - DO NOT DISTRIBUTE');
writeln;textcolor(black);
writeln('   Press PLUS (+) to morse in "freehand"-mode, or enter the char to "send" !');
writeln('   Press  ESC  to  EXIT the Program or  F1  for Help ! (Yeah, Help !)');
writeln;textcolor(blue);
writeln('   Characters: a-z (small only !!!), numbers: 0-9, �,�,�, and , . : - ?');
writeln('                   Use �, �, � for sending Ae, Ue, Oe !!!');
writeln('   SOS: *          ERROR: %          ROGER: "             END: $');
writeln('�����������������������������������������������������������������������������ͼ');

window(4,14,77,19);textbackground(blue);clrscr;textcolor(white);
write('�������');textcolor(red);write(' You wrote: ');textcolor(white);
write('����������������������������������������������������ķ ');
write('�                                                                       � ');
write('�                                                                       � ');
write('�                                                                       � ');
write('�                                                                       � ');
write('�����������������������������������������������������������������������Ľ');
textcolor(brown);textcolor(green);window(5,15,75,18);
textbackground(blue);clrscr;
write('>');
start:
write(a);
delay(300);
a:=readkey;
if a=#27 then begin goto ent ;end;



cs:=cs+1;
textcolor(green);


{HELP...}
if a=#59 then begin
 window(6,4,72,19);textbackground(black);clrscr;
 window(5,3,70,18);textbackground(green);textcolor(blue);
 clrscr;
 writeln('              MOESI Ver. 1.95� Help - (c) by Jan Hacker');
 writeln;
 writeln(' Moesi is so easy to use! There just a few keys you gotta know !');
 writeln;
 writeln('       F 1 = Help (How did you get here ?!?!?!?)');
 writeln('       ESC = Exit the Program  (And view counter)');
 writeln('       ",$,%,* are use for sending ROGER etc. (Look at main menu)');
 writeln;
 writeln(' Typing words:  Just  enter  the characters to send. Your entered');
 writeln(' text will be shown in the YOU WROTE  -  Window. You can`t delete');
 writeln(' an entered character  (WE  ARE  MORSING  -  DON`T FORGET THIS !)');
 writeln(' Characters   not   accepted   will   be   shown   in   Red......');
 writeln(' ~  will  show  a  Blank              (IT ALSO WON`T BE SENT !). ');
 writeln(' There are still some BUGS. But don`t worry.  I gonna try to make');
 writeln(' it better.                     Else you could try ..... ;-))) CU');
b:=readkey;
cs:=cs-2;
goto beg;
end;
{unallowed charcters (which will not be sent)}
if a='!' then begin textcolor(red);f:=f+1;end;
if a='' then begin textcolor(red);f:=f+1;end;
if a=#32 then begin textcolor(red);f:=f+1;write(' ',#126);end;
if a='&' then begin textcolor(red);f:=f+1;end;
if a='/' then begin textcolor(red);f:=f+1;end;
if a='#' then begin textcolor(red);f:=f+1;end;
if a='>' then begin textcolor(red);f:=f+1;end;
if a='�' then begin textcolor(red);f:=f+1;end;
if a='(' then begin textcolor(red);f:=f+1;end;
if a=')' then begin textcolor(red);f:=f+1;end;
if a='=' then begin textcolor(red);f:=f+1;end;
{tool-characters}
if a='%' then begin textcolor(black);write(' ERROR ');textcolor(blue);e:=e+1;end;
if a='*' then begin textcolor(black);write(' S-O-S ');textcolor(blue);s:=s+1;end;
if a='$' then begin textcolor(black);write(' E N D ');textcolor(blue);en:=en+1;end;
if a='"' then begin textcolor(black);write(' ROGER ');textcolor(blue);r:=r+1;end;
{...standard characters from a to z...}
if a='a' then begin ss;ls; end;
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
if a='�' then begin ss;ls;ss;ls;                end;
if a='�' then begin ls;ls;ls;ss;                end;
if a='�' then begin ss;ss;ls;ls;                end;
{...and now point, comma etc....}
if a='.' then begin ss;ls;ss;ls;ss;ls;          end;
if a=',' then begin ls;ls;ss;ss;ls;ls;          end;
if a=':' then begin ls;ls;ls;ss;ss;ss;          end;
if a='-' then begin ls;ss;ss;ss;ss;ls;          end;
if a='?' then begin ss;ss;ls;ls;ss;ss;          end;
goto start;
ent:
window(2,2,80,19);
textbackground(white);textcolor(red);
clrscr;
for x:=1 to 500 do begin write(' M � S I  VER 1.95� '); end;
window(9,4,74,18);textbackground(black);textcolor(white);
clrscr;
window(8,3,72,17);textbackground(green);
clrscr;
for x:=80 to 10000 do begin sound(x);end;
nosound;
if e+r+s+en+f+cs=0 then goto nodone;
textcolor(red);
writeln('                         �������������Ŀ');
writeln('                         �   Results   �');
writeln('                         ���������������');
writeln;textcolor(white);
writeln('                   ',e,' Error(s) have been sent.');
writeln('                   ',r,' Roger(s) have been sent.');
writeln('                   ',s,' S-O-S(s) have been sent.');
writeln('                   ',en,' E-N-D(s) have been sent.');
writeln;
writeln('                ',cs-e-r-en-s-f,' Character(s) have been sent.');
writeln('                ',f,' wrong Character(s) haven`t been sent.');
textcolor(blue);
writeln;
writeln('  This program was written by (c) PHL. 03-01-95. VERSION 1.95�');
write('                       Press ANY key to EXIT.');
b:=readkey;
window(1,1,80,25);gotoxy(1,20);
exit;
nodone:
writeln;
writeln(' DU BIST DER FAULSTE SACK, DEN ICH JE GESEHEN HABE, BORIS !');
writeln;
writeln(' CU. DER HACKER');
window(1,1,80,25);gotoxy(1,20);
END.