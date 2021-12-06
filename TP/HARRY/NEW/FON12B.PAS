{ Programm KN-INFO .... Version 1.2, by phl. Zusammen mit KN- und AB- }
{  ASC, die TelefonbÅcher von Konstanz und Allensbach                 }
Program KN_INFO;
Uses crt,dos,jantools;
Var    m,a,o,b,c,x,y,z,ja,cnt,lcnt,cox,coy,num,err:integer;
          ch,cr:char;
       cab,ckn:char;
     lab,lkn,ss:string;
       ab,kn:text;
label ente,beg,conn,cont;
BEGIN

beg:
cnt:=0;
textmode(3+font8x8);textbackground(blue);
clrscr;
write('                Telefonauskunft fÅr');textcolor(black);
write(' Konstanz');textcolor(7);write(' und ');textcolor(red);
write('Allensbach');writeln;textcolor(7);


writeln;
writeln('Loading ......');
{$I-}
assign(ab,'ab-asc.txt');reset(ab);
{$I+}
if ioresult=0 then writeln('AB-ASC found !') else begin write(' AB-ASC NOT FOUND !');delay(2000);err:=1;goto ente;end;
{$I-}
assign(kn,'kn-asc.txt');reset(kn);
if ioresult=0 then writeln('KN-ASC found !') else begin write(' KN-ASC NOT FOUND !');delay(2000);err:=1;goto ente;end;
{$I+}


writeln('KN-INFO Version 1.2 wird gestartet ......');
delay(700);

clrscr;
write('                Telefonauskunft fÅr');textcolor(black);
write(' Konstanz');textcolor(7);write(' und ');textcolor(red);
write('Allensbach');writeln;textcolor(7);



 if paramstr(1) <> '' then begin;
        ss:=paramstr(1);
    for b:=1 to length(ss) do begin ss[b]:=upcase(ss[b]);end;
    if ja = 0 then goto cont;
 end;



conn:
writeln;
writeln(' Bitte Namen, Telefonummer [...] eingeben, nach dem/der gesucht werden soll:');
write('   ');
textbackground(white);textcolor(black);
write('                                                                    ');
gotoxy(4,wherey);
ch:=readkey;if ch=#27 then goto ente else write(ch);
readln(ss);ss:=ch+ss;
textbackground(blue);
for b:=1 to length(ss) do begin ss[b]:=upcase(ss[b]);end;

cont:
clrscr;
textbackground(blue);textcolor(7);
write('                Telefonauskunft fÅr');textcolor(black);
write(' Konstanz');textcolor(7);write(' und ');textcolor(red);
write('Allensbach');writeln;textcolor(7);
writeln('                   *** KN-INFO "FON" ver 1.2 by phl ***');writeln;
write(' Die Suche nach ',ss,' lÑuft ...');

window(1,5,80,50);textbackground(white);clrscr;
writeln;

textcolor(black);   {konstanz !!!!!!!!!!}
repeat
 coy:=wherey;cox:=wherex;window(1,1,80,4);gotoxy(77,1);cr:=lkn[2];write(cr);
  gotoxy(77,2);write(cnt);
 window(1,5,80,50);gotoxy(cox,coy);
 if keypressed then begin ch:=readkey;
  writeln;textcolor(Black);Writeln(' --> (S)top oder (W)eiter ?) <--');
  ch:=readkey;if upcase(ch)='S' then goto ente;if ch=#27 then goto ente;
  if upcase(ch)='W' then writeln(' --> Weiter geht''s ... <--');textcolor(green);
  end;
 readln(kn,lkn);

 y:=pos(ss,lkn);
 {ANZEIGE DER NAMEN AFANG}
 if y<>0 then begin {writeln(lkn)};
 o:=0;
  for m:=1 to length(lkn) do begin
      if lkn[m]='#' then lkn[m]:=' ';
      if lkn[m]='"' then begin
       inc(o); if o=1 then begin textcolor(blue);write('NAME: ');textcolor(black);end;
               if o=3 then begin textcolor(blue);gotoxy(40,wherey);write('STRASSE: ');textcolor(black);end;
               if o=5 then begin writeln;textcolor(blue);write('ORT : ');textcolor(black);end;
               if o=7 then begin textcolor(blue);gotoxy(40,wherey);write('TELEFON: ');textcolor(black);end;
      end else write(lkn[m]);
  end;
 writeln;writeln; {nach jeder Nummer}

 {SICHERUNG DES BILDSCHIRMENDES !!!..ANFANG}
 if wherey>45 then begin textcolor(green);
 write('   Taste drÅcken >>> Suche fortsetzen     [N] >>> Neue Suche    [ESC] >>> QUIT');
 textcolor(blue);
 ch:=readkey;if ch=#27 then goto ente;
 if upcase(ch)='N' then goto beg;
 clrscr;
 end;


 {SICHERUNG DES BILDSCHIRMENDES !!!..ENDE}

 cnt:=cnt+1;
 end;
until eof(kn);
{ANZEIGE DER NAMEN ENDE.}




textcolor(red); {allensbach !!!!!1}
repeat
coy:=wherey;cox:=wherex;window(1,1,80,4);gotoxy(78,1);cr:=lab[2];write(cr);
 gotoxy(77,2);write(cnt);
window(1,5,80,50);gotoxy(cox,coy);
if keypressed then begin ch:=readkey;
 writeln;textcolor(Black);Writeln(' --> (S)top oder (W)eiter ?) <--');
 ch:=readkey;if upcase(ch)='S' then goto ente;if ch=#27 then goto ente;
 if upcase(ch)='W' then writeln(' --> Weiter geht''s ... <--');textcolor(green);
 end;
readln(ab,lab);

y:=pos(ss,lab);
{ANZEIGE DER NAMEN AFANG}
if y<>0 then begin {writeln(lkn)};
o:=0;
 for m:=1 to length(lab) do begin
     if lab[m]='#' then lab[m]:=' ';
     if lab[m]='"' then begin
      inc(o); if o=1 then begin textcolor(blue);write('NAME: ');textcolor(red);end;
              if o=3 then begin textcolor(blue);gotoxy(40,wherey);write('STRASSE: ');textcolor(red);end;
              if o=5 then begin writeln;textcolor(blue);write('ORT : ');textcolor(red);end;
              if o=7 then begin textcolor(blue);gotoxy(40,wherey);write('TELEFON: ');textcolor(red);end;
     end else write(lab[m]);
 end;
writeln;writeln; {nach jeder Nummer}


{SICHERUNG DES BILDSCHIRMENDES !!!..ANFANG}
if wherey>44 then begin textcolor(blue);
write('   Taste drÅcken >>> Suche fortsetzen     [N] >>> Neue Suche    [ESC] >>> QUIT');
textcolor(blue);
ch:=readkey;if ch=#27 then goto ente;
if upcase(ch)='N' then goto beg;
clrscr;
end;


{SICHERUNG DES BILDSCHIRMENDES !!!..ENDE}






cnt:=cnt+1;
end;
until eof(ab);
{ANZEIGE DER NAMEN ENDE.}




writeln;textcolor(blue);
if cnt =0 then begin writeln(' Keine öbereinstimmung gefunden !');end;
if cnt =1 then begin writeln(' Eine  öbereinstimmung gefunden !');end;
if cnt>1 then begin writeln(' ',cnt,' öbereinstimmungen gefunden !');end;
write(' Eine Taste und wech ... oder [SPACE] fÅr erneute Suche ');
    ja:=1;
ch:=readkey;if ch=#32 then goto beg;

ente:
window(1,1,80,50);textbackground(black);textcolor(white);
dcls(5);
if err <> 1 then begin close(ab);close(kn);end;
writeln;
window(1,1,80,50);clrscr;
Slowdisplr('THX 4 USING phl. PRODRUCTS ;-)',7,8,10);
Slowdisprl('THX 4 USING phl. PRODRUCTS ;-)',black,7,10);
Slowdisplr('THX 4 USING phl. PRODRUCTS ;-) ',7,8,10);
clrscr;
writeln('THX 4 USING ˘˘.');
writeln('               ˘.. phl. PRODUCTS ;-)');
writeln;



END.





