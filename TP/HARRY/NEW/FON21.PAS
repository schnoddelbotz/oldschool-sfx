Program fon2; {today: let's do a blockread :)
               quattro: don't read around, just help me ! ;-)}
uses crt,dos;

Var                                bl:array [1..61500] of char;
                                  was:array [1..5] of string;
                                 s,ss:string;
                                kn,ab:file;
                                  res:text;
                              numRead:word;
                                  rel:reaL;
 z,c,look,na,nk,zei,uc,sy,o,m,lr,upc,abort:integer;
                               blxr,x:longint;
                                   ch:char;
                             s1,s2,s3:string;
            textc,alreadyrun,gefunden:integer;
 h,hb, min,minb, sec,secb, hund,hundb: Word;
                                    t:reaL;
label cont,cont2,weiter,ente,beg,phl,subsearch;

BEGIN
if paramstr(1)='/?' then begin
 writeln;writeln(' Welcome to fon ver 2.1, ');writeln('  the *fast* and cost-*free* telephone-information.');
 writeln('  (for Konstanz and Allensbach only).');writeln;writeln('  Commandline-parameters: searchstring only.');
 writeln('  fon is (c) by phl. ''96');exit;
end;

beg:
rel:=0;numread:=0;blxr:=0;was[1]:='';was[2]:='';was[3]:='';was[4]:='';was[5]:='';gefunden:=0;
if alreadyrun=1 then begin close(ab);close(kn);end;
assign(kn ,'kn-asc.txt'); {$I-}reset(kn,1); {$I+} if ioresult <> 0 then begin
 writeln(' Sorry, but your Phonebook (KN-ASC.TXT) could not be found. Press any key ...');ch:=readkey;exit;end;
assign(ab ,'ab-asc.txt'); {$I-}reset(ab,1);{$I+} if ioresult <> 0 then begin
 writeln(' Sorry, but your Phonebook (AB-ASC.TXT) could not be found. Press any key ...');ch:=readkey;exit;end;
assign(res,'_phl_tmp.$$$');
textmode(3+font8x8);
window(1,1,80,50);textbackground(white);clrscr;
textcolor(blue);for look:=1 to 49 do begin gotoxy(1,look);write('Г');gotoxy(80,look);write('Г');end;
textcolor(white);window(1,50,80,50);textbackground(blue);clrscr;
write('    Please enter a name, a phone-number or s.th. like that to search for ...');
window(1,1,80,1);textbackground(blue);clrscr;
write(' --- PHLs FON ver. 2.1 --- (c) ''96 by phl  ---  Progress Indicator [..........]');
window(2,2,79,49);textbackground(white);clrscr;

if alreadyrun=0 then begin
textcolor(blue);
if length(paramstr(1))<5 then begin
 if length(paramstr(1))>0 then begin
 writeln('Also if you want to use param-strings,you have to enter at least 5 characters!');
 end;
end;

if length(paramstr(1))>4 then begin ss:=paramstr(1);alreadyrun:=1;goto weiter;end;
end;

alreadyrun:=1;

writeln;textcolor(blue);
writeln;
writeln(' Enter Search-String ([q],[ret] exits) , at least 5 characters :');
writeln;
write  ('                           АААААББББББББББ');gotoxy(wherex-15,wherey);readln(ss);

window(2,2,79,49);textcolor(black);

if ss='' then goto beg;
if length(ss)=1 then begin if upcase(ss[1])='Q' then begin abort:=2;goto ente;end;end;
if ss='phl' then goto phl;if ss='PHL' then goto phl;
if length(Ss)<5 then goto beg;

weiter: {...sprungziel............}
for uc:=1 to length(ss) do begin ss[uc]:=upcase(ss[uc]);end;
textcolor(white);
window(1,50,80,50);textbackground(blue);clrscr;write(' Searching for : ', ss,'   ... press [esc] to abort.');
textbackground(white);
window(2,2,79,49);gotoxy(1,1);
textcolor(8);highvideo;for c:=1 to 249 do begin write(' fon 2 by phl  ');end;write(' fon 2..');

{konstanz !!!:}
gettime(h, min, sec, hund);Hb:=h;minb:=min;secb:=sec;hundb:=hund;
settime(0,0,0,0);
rel:=0;numread:=0;blxr:=0;
rewrite(res);
writeln(res,' \\ KONSTANZ //');
window(1,1,80,1);

repeat

 if blxr>0 then begin {zeitanzeige}
 textcolor(white);textbackground(blue);
 gettime(h,min,sec,hund);
 gotoxy(1,1);write('  Time elapsed : ',sec:2,':',hund:2,'                        Progress Indicator :');
 end;

 if keypressed then begin ch:=readkey;window(10,10,40,13);textbackground(blue);clrscr;
 clrscr;gotoxy(1,1);
 Write(^M^J,' *** Abort ? (Y/N) *** ');ch:=readkey;
  if upcase(ch)='Y' then begin abort:=1;goto ente;end;clrscr;write(^M^J,' Searching ... please wait.');
 end;

 blockread(kn,bl,sizeof(bl),numRead);rel:= ( blxr*61500 / filesize(kn)*100);
 window(1,1,80,1);
 gotoxy(69,1);textcolor(black);
        if rel>100 then begin write('лллллллллл');goto cont; end;
         if rel>90 then begin write('ллллллллл',#16,'');goto cont; end;
         if rel>80 then begin write('лллллллл',#16,'.');goto cont; end;
         if rel>70 then begin write('ллллллл',#16,'..');goto cont; end;
         if rel>60 then begin write('лллллл',#16,'...');goto cont; end;
         if rel>50 then begin write('ллллл',#16,'....');goto cont; end;
         if rel>40 then begin write('лллл',#16,'.....');goto cont; end;
         if rel>30 then begin write('ллл',#16,'......');goto cont; end;
         if rel>20 then begin write('лл',#16,'.......');goto cont; end;
         if rel>10 then begin write('л',#16,'........');goto cont; end;
         if rel<10 then begin write(#16,'.........');goto cont; end;
 textcolor(black);
 cont:
   for x:=1 to numread do begin
   if bl[x]  =ss[1] then begin
   if bl[x+1]=ss[2] then begin
   if bl[x+2]=ss[3] then begin
   if bl[x+3]=ss[4] then begin
   if bl[x+4]=ss[5] then begin
         for z:=1 to 200 do begin
         write(res,bl[z+x-100]);
         end;
         writeln(res);  {finally i found this fuckin bug}
  end;end;end;end;end;
  end;
inc(blxr);
until numread=0;


{allensbach !!!:}
rel:=0;numread:=0;blxr:=0;
writeln(res,^M^J,' \\ ALLENSBACH //');
repeat

 if blxr>0 then begin
 textcolor(white);textbackground(blue);
 gettime(h,min,sec,hund);
 gotoxy(1,1);write('  Time elapsed : ',sec:2,':',hund:2,'                        Progress Indicator :');
 end;

 if keypressed then begin ch:=readkey;window(10,10,40,13);textbackground(blue);clrscr;
 clrscr;gotoxy(1,1);
 Write(^M^J,' *** Abort ? (Y/N) *** ');ch:=readkey;
  if upcase(ch)='Y' then begin abort:=1; goto ente;end;clrscr;write(^M^J,' Searching ... please wait.');
 end;

 blockread(ab,bl,sizeof(bl),numRead);rel:= ( blxr*61500 / filesize(ab)*100);
 window(1,1,80,1);
 gotoxy(69,1);textcolor(red);
        if rel>100 then begin write('лллллллллл');goto cont; end;
         if rel>90 then begin write('ллллллллл',#16,'');goto cont2; end;
         if rel>80 then begin write('лллллллл',#16,'.');goto cont2; end;
         if rel>70 then begin write('ллллллл',#16,'..');goto cont2; end;
         if rel>60 then begin write('лллллл',#16,'...');goto cont2; end;
         if rel>50 then begin write('ллллл',#16,'....');goto cont2; end;
         if rel>40 then begin write('лллл',#16,'.....');goto cont2; end;
         if rel>30 then begin write('ллл',#16,'......');goto cont2; end;
         if rel>20 then begin write('лл',#16,'.......');goto cont2; end;
         if rel>10 then begin write('л',#16,'........');goto cont2; end;

 textcolor(black);
 cont2:
  for x:=1 to numread do begin
   if bl[x]=  ss[1] then begin
   if bl[x+1]=ss[2] then begin
   if bl[x+2]=ss[3] then begin
   if bl[x+3]=ss[4] then begin
   if bl[x+4]=ss[5] then begin
         for z:=1 to 200 do begin
         write(res,bl[z+x-100]);
         end;
         writeln(res);
  end;end;end;end;end;
  end;
inc(blxr);
until numread=0;
close(res);

settime(hb,minb+min,secb+sec,hundb+hund);

{Eigentliche Suche abgeschlossen, jetzt Auswertung von $phl$.tmp}
window(2,2,79,49);textbackground(white);clrscr;
gotoxy(2,1);
writeln;reset(res);textcolor(8);textbackground(white);writeln;
repeat
 readln(res,s);inc(lr);
 sy:=pos(ss,s);

 if s=' \\ KONSTANZ //' then textc:=0;
 if s=' \\ ALLENSBACH //' then textc:=4;

  na:=0;nk:=0;
  if s[1]='"' then begin
  for zei:=0 to length(s) do begin
  if s[zei]='"' then inc(na);if s[zei]='#' then inc(nk);
  end;

 if na=8 then begin if nk=3 then begin

 textcolor(black);
 if was[5]<>s then begin if was[4]<>s then begin if was[3]<>s then begin if was[2]<>s then begin if was[1]<>s then begin
 was[1]:=was[2];was[2]:=was[3];was[3]:=was[4];was[4]:=was[5];
 was[5]:=s;

  if sy<>0 then begin ;
  o:=0;
   inc(gefunden);
   for m:=1 to length(s) do begin
       if s[m]='#' then s[m]:=' ';
       if s[m]='"' then begin
        inc(o); if o=1 then begin textcolor(blue);write('NAME: ');textcolor(textc);end;
                if o=3 then begin textcolor(blue);
                  if wherex<40 then gotoxy(40,wherey) else writeln;write('STRASSE: ');textcolor(textc);end;
                if o=5 then begin if wherex>40 then writeln;textcolor(blue);
                write('ORT : ');textcolor(textc);end;
                 if o=7 then begin textcolor(blue);if wherex<40 then gotoxy(40,wherey) else writeln;write('TELEFON: ');
                 textcolor(textc);end;
       end else write(s[m]);end;
    writeln;writeln;

    if wherey > 46 then begin window(1,50,80,50);textbackground(blue);clrscr;textcolor(7);
                              writeln;
                              write(' [Ret] >> next page, [esc] >> quit, [space] >> new search, [S] >> SubSearch');
                              ch:=readkey;
                              if upcase(ch)='S' then begin close(res);goto subsearch;end;
                              if ch=#27 then goto ente;
                              if ch=#32 then begin goto beg;end;
                              clrscr;write(' Searching for : ', ss);
                              window(2,2,79,49);textbackground(white);
                              for lr:=1 to 50 do begin gotoxy(1,1);delline;end;writeln;
    end; {bildschimr-voll pruefung}
   end;{string durcharbeiten}
  end;{uberhaupt suchen? ende}
 end;end;{na,nk: entspricht die zeile den bestimmungen ?}
 end;end;end;end;end; {was[x]}
until eof(res);
close(res);
if lr=5 then begin write(' I''m sorry, but I was unable to find it. :-( ');end;
window(1,50,80,50);textbackground(blue);clrscr;textcolor(white);
write(' Found it ',gefunden:3,' times ... any [key] >> quit, [spc] >> new serach, [S] Subsearch');
ch:=readkey;
if ch=#32 then goto beg;
if upcase(ch)='S' then begin goto subsearch;end;
goto ente;

phL:
clrscr;
writeln;
writeln('  You can contact me via e-m@il: HACKERLE@T-ONLINE.DE ... But why ?');
writeln;
writeln('  The BlockSize, fon is actually using: ',sizeof(bl),' bytes/block.');
writeln('  Mem available on heap (FON loaded)..: ',memavail,' bytes.');
writeln('  OS-Version reported by DOS..........: ',lo(dosversion),'.',hi(dosversion));
write('  Preforming Benchmark.');
{benchmarking ....}
gettime(h, min, sec, hund);Hb:=h;minb:=min;secb:=sec;hundb:=hund;settime(0,0,0,0);
repeat write('.');blockread(kn,bl,sizeof(bl),numread);until numread=0;
gettime(h,min,sec,hund);
str(sec,s1);str(hund,s2);if hund < 10 then begin s2:='0'+s2;end;s3:=s1+s2;val(s3,t,o);t:=t/100;
settime(hb+h,minb+min,secb+sec,hundb+hund);
writeln(^M,'  Read ',filesize(kn):7,' bytes in...............: ', s3,'ms                       ');
if hund <> 0 then begin if sec < 1 then begin
writeln('  That are about......................: ',(filesize(kn)/t/1000000):2:2,' mbytes/sec !');
end;end;
if sec <> 0 then begin
writeln('  That are about......................: ',(filesize(kn)/t/1000000):2:2,' mbytes/sec !');
end;
{benchmarking ended ...}
write(^M^J,'  Press any key, I wanna go home....');ch:=readkey;
goto ente;

subsearch: {for ossi}
clrscr;write(' ENTER SUBSEARCH-STRING: ');readln(ss);
reset(res);lr:=0;
window(2,2,79,49);textbackground(white);textcolor(blue);clrscr;
sy:=0;gefunden:=0;was[1]:='';was[2]:='';was[3]:='';was[4]:='';was[5]:='';
for upc:=1 to length(ss) do ss[upc]:=upcase(ss[upc]);
writeln;writeln(' Sub-Search-Results :');writeln;
repeat
 readln(res,s);inc(lr);
 sy:=pos(ss,s);
 if s=' \\ KONSTANZ //' then textc:=0;
 if s=' \\ ALLENSBACH //' then textc:=4;
  na:=0;nk:=0;
  if s[1]='"' then begin
  for zei:=0 to length(s) do begin
  if s[zei]='"' then inc(na);if s[zei]='#' then inc(nk);
  end;
 if na=8 then begin if nk=3 then begin
 textcolor(black);
 if was[5]<>s then begin if was[4]<>s then begin if was[3]<>s then begin if was[2]<>s then begin if was[1]<>s then begin
 was[1]:=was[2];was[2]:=was[3];was[3]:=was[4];was[4]:=was[5];
 was[5]:=s;
  if sy<>0 then begin ;
  o:=0;
   inc(gefunden);
   for m:=1 to length(s) do begin
       if s[m]='#' then s[m]:=' ';
       if s[m]='"' then begin
        inc(o); if o=1 then begin textcolor(blue);write('NAME: ');textcolor(textc);end;
                if o=3 then begin textcolor(blue);
                  if wherex<40 then gotoxy(40,wherey) else writeln;write('STRASSE: ');textcolor(textc);end;
                if o=5 then begin if wherex>40 then writeln;textcolor(blue);
                write('ORT : ');textcolor(textc);end;
                 if o=7 then begin textcolor(blue);if wherex<40 then gotoxy(40,wherey) else writeln;write('TELEFON: ');
                 textcolor(textc);end;
       end else write(s[m]);end;
    writeln;writeln;

    if wherey > 45 then begin window(1,50,80,50);textbackground(blue);clrscr;textcolor(7);
                              writeln;write(' *** [Ret] for next page, [esc] to quit, [space] for new search ***');
                              ch:=readkey;
                              if ch=#27 then goto ente;
                              if ch=#32 then begin goto beg;end;
                              clrscr;write(' Searching for : ', ss);
                              window(2,2,79,49);textbackground(white);
                              for lr:=1 to 50 do begin gotoxy(1,1);delline;end;writeln;
    end; {bildschimr-voll pruefung}
   end;{string durcharbeiten}
  end;{uberhaupt suchen? ende}
 end;end;{na,nk: entspricht die zeile den bestimmungen ?}
 end;end;end;end;end; {was[x]}
until eof(res);
close(res);
if lr=1 then begin write(' I''m sorry, but I was unable to find it. :-( ');end;
window(1,50,80,50);textbackground(blue);clrscr;textcolor(white);
write('  Found it ',gefunden:3,' times ... any [key] >>> quit, [space] >>> search again');
ch:=readkey;
if ch=#32 then goto beg;

ente:
if abort<> 2 then settime(hb+h,minb+min,secb+sec,hundb+hund);
window(1,1,80,50);
textbackground(black);textcolor(7);
clrscr;
textcolor(white);writeln(' Thank you for using [phl] products. ');textcolor(7);
END.