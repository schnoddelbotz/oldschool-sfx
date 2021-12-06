{DOOM I & II WAD-File Manager ; 1995 by PHL}
Uses crt,dos,stddlg;
TYPE DatTyp = Record
       WadName : string[12];
       LastDate: string[8];
       LastTime: string[8];
        END;
var          x,y,z: integer;
       namen:array [1..400] of string [12];
           actpath: string;
tag,monat,jahr,dow:word;
                ch:char;
                 s:word;
              grmbl,hmm:word;
             dir_record:searchrec;
             maxposi,posi,anzahl:word;

Procedure Startscr;
 BEGIN
 z:=0;
 window(1,1,80,25);
 textbackground(1);textcolor(9);
 clrscr;
 for x:=1 to 1999 do begin write(#176);end;
 window(5,23,75,23);clrscr;textcolor(7);
 write('   F1 - Ch Path ³ F2 - Info ³ F3 - Options ³ F4  - RUN ! ³ ESC exits');
 window(1,1,80,2);textbackground(red);clrscr;textcolor(15);
 writeln('                 DOOM WAD-File-Manager WADDY ver 0.1 Alpha');
 write('                             written in 1995 by PHL');
 window(1,25,80,25);clrscr;
 getdir(0,actpath);getdate(jahr,monat,tag,dow);
 write('  Path: ',actpath,'   ³  Free Disk-Space: ',diskfree(0)/1000000:4:2,' MB  ³  Date:  ',tag,'.',monat,'.',jahr);
 window(10,5,70,21);textbackground(black);clrscr;
 window(9,4,68,20);textbackground(blue);clrscr;textcolor(15);
 write('ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·');
 write('³                        MAIN MENUE                        ³');
 write('   Available WADs                                           ');
 for x:=1 to 11 do writeln;
 write('³                                                          ³');
 write('ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½');
 window(12,8,65,18);textbackground(7);clrscr;textcolor(black);
{List all available WADs}
    namen[1]:=' ';namen[2]:=' ';
    window(12,8,65,18); anzahl:=2;posi:=0;
    textcolor(red);
    FindFirst('*.wad',Archive+ReadOnly,Dir_Record);textcolor(black);
    While Doserror <> 18 do begin
    inc(anzahl);namen[anzahl]:=dir_record.name;
    FindNext(Dir_Record);
    END;writeln;
    namen[anzahl+1]:=' ';namen[anzahl+2]:=' ';
    inc(anzahl,2);
    maxposi:=anzahl-4;posi:=1;
END;

Procedure ChgDirDialog;BEGIN
 z:=0;
 window(15,10,75,12);textbackground(red);clrscr;textcolor(15);
 writeln;write(' Enter new path : ');textbackground(white);
 write('                                       ');gotoxy(19,2);
 readln(actpath);textbackground(red);writeln;
 {$I-}
 chdir(actpath);
 if ioresult <> 0 then begin writeln('        PATH DOES NOT EXIST ... SO PATH NOT CHANGED !');delay(1000);end;
 startscr;
 END;
Procedure Optionsdialog;BEGIN
 window(5,4,75,16);textbackground(red);clrscr;textcolor(green);
 writeln;writeln('                             OPTIONS');
         writeln('                             =======');textcolor(15);
 writeln(' SKILL LEVEL       PLAYERS       GAME-MODE');
 writeln(' ( ) Skill 5       ( ) One       ( ) Cooperative');
 writeln(' ( ) Skill 4       ( ) Two       ( ) Deathmatch');
 writeln(' ( ) Skill 3       ( ) Three');
 writeln(' ( ) Skill 2       ( ) Four      ADDITONAL');
 writeln(' ( ) Skill 1                     ( ) Altdeath');
 writeln('                                 ( ) Respawn');
 writeln('                                 ( ) No Monsters');
 writeln(' EPISODE:     MISSON:');
 repeat ch:=readkey
 until ch=#13;
 startscr;
 END;
Procedure RUNWAD;BEGIN
window(10,9,75,13);textbackground(red);clrscr;textcolor(15);
writeln;
writeln(' Saving Infos how to use this WAD next time ....');delay(1000);
writeln(' NOW running doom with the following options:');
write  (' IPXSETUP -file Ledges2i.wad -skill 4 -warp 3 1 -deathmatch');
delay(1000);sound(2000);delay(10);nosound;startscr;
END;

procedure build;
var i,j:integer;
begin
 gotoxy(1,1);
 for i:=1 to 5 do begin
 textbackground(7);textcolor(0);
 if i=3 then begin textbackground(3);textcolor(15) end;
 write(namen[i+posi-1]);
 for j:=length(namen[i+posi-1]) to 15 do write(' ');
 writeln;end;end;

BEGIN   {eigentlich Proggibeginn}
startscr;
repeat
ch:=readkey;
if ch=#13 then begin
gotoxy(20,1);writeln('file:',namen[posi+2]);
end;


if ch=#0 then begin
ch:=readkey;
if ch=#59 then chgdirdialog;
if ch=#61 then optionsdialog;
if ch=#62 then RUNWAD;
if ch=#72 then if anzahl>0 then begin {up}
  if posi>1 then dec(posi);
  build;
end;
if ch=#80 then if anzahl>0 then begin {down}
  if posi<maxposi then inc(posi);
  build;
end;


end;

until ch=#27;
{
window(1,1,80,25);textbackground(black);clrscr;textbackground(blue);textcolor(15);
writeln;
writeln('      Thank you using WADDY.');
writeln(' And remember: Don`t kill those poor soldiers in doom. They are');
writeln(' just human beings like me and YOU ! Save the soldiers. But....');
writeln(' KILL THE FUCKIN` CYBERDEMONs !!!');
writeln;
textbackground(black);textcolor(7);
}
END.