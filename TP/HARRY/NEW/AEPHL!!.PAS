{$N+}
Program AEPhl; {_A_lways _E_xtended _P_rogram by _Phl_}
uses crt,jancrt;


type  Person = record
         Name:String[20];
        VName:String[20];
          Str:String[20];
          PLZ:String[20];
          fon:String[20];
           nr:integer;end;
var        x,y,z,x1,y1,wos,pl,act,la,posi:integer;
                            s1,s2:string;
             name,vorname,str,ort:string[40];
                               ch:char;
                             mask,helper:byte;
                                f:file of person;
                                p:person;
                           mentry:array [1..8] of string[20];
label ente,main,realquit,mainhelp,editor,list;

procedure WriteOp(s:string;normcol,XCol:integer);begin
 for wos:=1 to length(s) do begin if s[wos]= '^' then textcolor(XCOL);
 if s[wos]<>'^' then begin write(s[wos]);textcolor(normcol);end;end;end;

procedure DispMen;begin
for x:=1 to 6 do begin
gotoxy(3,x+4);
textcolor(white);textbackground(blue);
if x=posi then begin textcolor(8);textbackground(white);end;
write(mentry[x]:27);
end;end;

procedure edit;
label eins,zwei,drei,vier,fuenf,sechs;
begin;
repeat
 eins:
 gotoxy(16,4);xr(20,p.name,black,white,'ฑ');p.name:=xrs;
 if xrc=#27 then goto sechs;
 if xrc=#72 then goto fuenf;
 zwei:
 gotoxy(16,6);xr(20,p.vname,black,white,'ฑ');p.vname:=xrs;
 if xrc=#27 then goto sechs;
 if xrc=#72 then goto eins;
 drei:
 gotoxy(16,8);xr(20,p.str,black,white,'ฑ');p.str:=xrs;
 if xrc=#27 then goto sechs;
 if xrc=#72 then goto zwei;
 vier:
 gotoxy(16,10);xr(20,p.plz,black,white,'ฑ');p.plz:=xrs;
 if xrc=#27 then goto sechs;
 if xrc=#72 then goto drei;
 fuenf:
 gotoxy(16,12);xr(20,p.fon,black,white,'ฑ');p.fon:=xrs;
 if xrc=#72 then goto vier;
 sechs:
seek(f,act);
write(f,p);
until xrc=#27;
end; {of procedure edit}

BEGIN
posi:=1;
z:=300;x1:=66;y1:=45;{x1,y1,z can be reZet, caus only in intro...}
textmode(259);clrscr;
fout(1,1,30 ,'ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออฤ AEpHL ฤอออออป');for x:=2 to 49 do
fout(1,x,30 ,'บ                                                                              บ');
fout(1,50,30,'ศออออออออออออออออออออออ ๚๚๚ Press any key to continue ๚๚๚ อออออออออออออออออออออผ');
fout(20,20,113,' ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ ');
fout(20,21,113,' ณ                                       ณ ');
fout(20,22,113,' ณ  Welcome to AEpHL  !                  ณ ');
fout(20,23,113,' ณ                                       ณ ');
fout(20,24,113,' ณ       Please press any key            ณ ');
fout(20,25,113,' ณ                                       ณ ');
fout(20,26,113,' ณ        to load the program            ณ ');
fout(20,27,113,' ณ                                       ณ ');
fout(20,28,113,' ณ               right now...            ณ ');
fout(20,29,113,' ณ                                       ณ ');
fout(20,30,113,' ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู ');
repeat
if y=0 then begin fout(x1,y1,  11,'  :-ณ        ');
                  fout(x1,y1+1,11,'             ');
                  fout(x1,y1+2,11,'             ');
                  delay(z);end;inc(Y);
if y=1 then begin;fout(x1,y1,  11,'  ;-)        ');
                  fout(x1,y1+2,11,'             ');
                  fout(x1,y1+1,11,'             ');delay(z);end;inc(Y);
if y=2 then begin;fout(x1,y1,  11,'  :-))       ');
                  fout(x1,y1+1,11,'             ');
                  fout(x1,y1+2,12,' ** AEPhl ** ');delay(z);end;y:=0;if z > 50 then dec(z,50);
until keypressed or (z < 70);
ch:=readkey;if ch=#0 then ch:=readkey;
fout(1,50,30,'ศอออ F1 - Help ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');

for y:=1 to 65 do begin
fout(1,1,30 ,'ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออฤ AEpHL ฤอออออป');
fout(y,1,30 ,' '+#16+#16);delay(12);end;
fout(1,1,30 ,'ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออฤ AEpHL ฤอออออป');



assign(f,'aephl.dat'); {$I-} reset(F); {$I+}
if ioresult <> 0 then begin window(1,1,80,50);textbackground(black);clrscr;
textcolor(7);writeln(^m^j' AEpHL I/O ERROR 134 : File AEPHL.DAT not found !');
writeln;exit;
end;



main: {haupt-men}
fout(1,50,30,'ศอออ F1 - Help อออออออออออออออออออออออออออออออออออออออออออออออออ F10 - Quit อออผ');
window(2,2,79,49);textbackground(3);clrscr;
winshdw(10,5,40,15,blue);textcolor(white);
textbackground(white);textcolor(blue);
writeln(^m^j'๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚ Main Menu *',^m^j);
textbackground(blue);

mentry[1]:=(' Edit  Datafiles');
mentry[2]:=(' Print Datafiles');
mentry[3]:=(' List  Datafiles');
mentry[4]:=(' Create SBR-File');
mentry[5]:=(' Search for Entry');
mentry[6]:=(' Quit Program');


repeat
 dispmen;
 ch:=readkey;
 if ch=#0 then begin ch:=readkey;
  if ch=#80 then begin if posi=6 then posi:=0;if posi<6 then inc(posi);end;
  if ch=#72 then begin if posi=1 then posi:=7;if posi>1 then dec(posi);end;
 end;
until (ch=#13) or (ch=#27) or (CH=#59);
 if cH=#27 then goto realquit;
 if ch=#59 then goto mainhelp;
if posi=1 then goto editor;
if posi=3 then goto list;
if posi=6 then goto realquit;

goto main;


list:
fout(1,50,30,'ศอออ F1 - Help ออออออ '+#25+#44+#24+' +/- 1, PgUp/Dn +/- 11 ออออออออออออออออ ESC - Back อออผ');
window(2,2,79,49);textbackground(3);clrscr;xplwin(6,3,74,47,white);textcolor(0);
writeln;textcolor(white);textbackground(black);
writeln('๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚ Lister *');textbackground(7);textcolor(0);
textbackground(white);textcolor(0);
fout(8,6,15,' Name               ');fout(30,6,15,' Vorname            ');fout(52,6,15,' Straแe             ');
fout(8,7,15,' PLZ/Ort            ');fout(30,7,15,' Telefon            ');fout(52,7,15,' Lfd. Nr.           ');
window(7,9,73,46);textbackground(0);clrscr;textcolor(15);
writeln;
if act>filesize(f)-11 then dec(act,11);
repeat
for x:=act to act+11 do begin
seek(f,x);read(f,p);
write(p.name:20);write(p.vname:22);writeln(p.str:22);
write(p.plz:20);write(p.fon:22);writeln(p.nr:22);
textcolor(8);
writeln(' ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ');
textcolor(15);
end;
ch:=readkey;
if ch=#0 then begin ch:=readkey;
 if ch=#80 then if act+12<filesize(F)  then inc(act);
 if ch=#72 then if act>0 then  dec(act);
 if ch=#71 then act:=0;
 if ch=#79 then act:=filesize(F)-12;
 if ch=#81 then if act+12<filesize(F)-13 then inc(act,12) else act:=filesize(f)-12;
 if ch=#73 then if act-12>13 then dec(act,12) else act:=0;
 if ch=#59 then begin helper:=1;goto mainhelp;end;
end;
gotoxy(1,1);
writeln;
until ch=#27;
goto main;

realquit:
winshdw(30,22,50,28,red);textcolor(white);
writeln;textbackground(white);textcolor(red);
writeln('๚๚๚๚๚๚๚๚ Question *',^m^j);textbackground(red);textcolor(white);
writeln('    Quit to DOS ?');
writeln;
writeop('     [^Yes] [^No]',white,black);
ch:=readkey;
if upcase(ch)='Y' then goto ente;
if upcase(ch)='N' then goto main else goto main;

mainhelp:
fout(1,50,30,'ศออออออออออออออออออออออ ๚๚๚ Press any key to continue ๚๚๚ อออออออออออออออออออออผ');
window(2,2,79,49);textbackground(3);clrscr;
xplwin(10,5,70,45,blue);
writeln;textbackground(white);textcolor(blue);
writeln('๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚ Help [MainMenu] *');textcolor(15);textbackground(blue);
writeln(^m^j,' AEpHL''s Help System',^m^j);textcolor(7);
writeln('  ฏ AEpHL dient der Erfassung und Verwaltung von Adressen.');
writeop('  ฏ Es dient ^a^u^s^c^h^l^i^e^แ^l^i^c^h diesem Zweck, und zwar ^n__^u__^r'+^m^j,7,15);
writeln('    der Firma'^m^j);textcolor(white);
writeln('    H A C K E R - I M M O B I L I E N & Hausverwaltungen',^j^m^j);textcolor(7);
writeln('  ฏ Folgende Tastenbelegung ist gegeben:'^m^j);
writeop('    ^F^1  - OnLine-Hilfe'^m^j,7,15);
writeop('    ^F^2  - Speichern des aktuellen Datensatzes'^m^j,7,15);
writeop('    ^F^3  - Gibt Hilfestellungen (PLZ etc.)'^m^j,7,15);
writeop('    ^F^4  - Bearbeiten von Datenstzen'^m^j,7,15);
writeop('    ^F^1^0 - Quit'^m^j,7,15);
writeln(^m^j^j,'  ฏ Die restlichen Mens sind selbsterklrend.');
writeln('    Alle Statusanzeigen erfolgen in der letzten',^m^j,'    Bildschirmzeile.');
gotoxy(45,40);textcolor(yellow);write(' Press any key.');
ch:=readkey;
if helper=2 then goto editor;
if helper=1 then goto list;
goto main;

editor:
fout(1,50,30,'ศอออ F1 - Help อออ F4 - Edit อออ '+#25+#44+#24+' +/- 1, PgUp/Dn +/- 10 อออออ ESC - Back อออผ');
window(2,2,79,49);textbackground(3);clrscr;
xplwin(6,3,74,27,white);textcolor(0);
writeln;textcolor(white);textbackground(black);
writeln('๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚๚ Editor *');textbackground(7);textcolor(0);
window(7,6,73,26);clrscr;
textbackground(black);textcolor(white);
fout(10,9 ,112,' Name    : ');
fout(10,11,112,' Vorname : ');
fout(10,13,112,' Straแe  : ');
fout(10,15,112,' PLZ     : ');
fout(10,17,112,' FON     : ');
repeat
if ins=1 then fout(4,1,30 ,' B อ') else fout(4,1,30 ,' INS ');
seek(f,act);gotoxy(1,1);read(f,p);
write(' Laufende Nummer : ',p.nr:4,'/',filesize(f):4,' ');
fout(22,9 ,15, 'ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ');fout(22,9 ,15,+p.name);
fout(22,11,15, 'ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ');fout(22,11,15,+p.vname);
fout(22,13,15, 'ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ');fout(22,13,15,+p.str);
fout(22,15,15, 'ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ');fout(22,15,15,+p.plz);
fout(22,17,15, 'ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ');fout(22,17,15,+p.fon);
ch:=readkey;
if ch=#0 then begin ch:=readkey;
 if ch=#80 then if act+1<filesize(F)  then inc(act);
 if ch=#77 then if act+1<filesize(F)  then inc(act);
 if ch=#72 then if act>0 then  dec(act);
 if ch=#75 then if act>0 then  dec(act);
 if ch=#73 then if act-10>1 then dec(act,10) else act:=0;
 if ch=#81 then if act+10<filesize(F) then inc(act,10) else act:=filesize(f)-1;
 if ch=#62 then EDIT;{f4-bearbeiten}
 if ch=#59 then begin helper:=2;goto mainhelp;end;
 if ch=#71 then act:=0;
 if ch=#79 then act:=filesize(F)-1;
end;
until ch=#27;
fout(1,1,30 ,'ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออฤ AEpHL ฤอออออป');
goto main;

ente:
window(1,1,80,50);textbackground(black);xclrscr;
writeln;
textcolor(7);
writeln(' Saving Datafiles ...');close(F);
textcolor(15);
writeln(' THX 4 YOUR USE OF phl PRODUX :) !');

END.