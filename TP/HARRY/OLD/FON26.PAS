Program fon2; {today: let's do a blockread :)
               quattro: don't read around, just help me ! ;-)}
uses crt;

Var                                bl:array [1..60000] of char;
                                  was:array [1..5] of string;
                                 s,ss:string;
                                kn,ab:file;
                                  res:text;
                              numRead:word;
                                  rel:reaL;
  z,wx,wy,look,na,nk,zei,uc,sy,o,m,lr:integer;
                               blxr,x:longint;
                                   ch:char;

                                 textc,alreadyrun:integer;

label cont,cont2,weiter,ente,beg,phl;

BEGIN
if paramstr(1)='/?' then begin
 writeln;
 writeln(' Welcome to fon ver 2.0, ');
 writeln('  the *fast* and cost-*free* telephone-information.');
 writeln('  (for Konstanz and Allensbach only).');
 writeln;
 writeln('  Commandline-parameters: searchstring only.');
 writeln('  fon is (c) by phl. ''96');
exit;
end;

beg:
rel:=0;numread:=0;blxr:=0;was[1]:='';was[2]:='';was[3]:='';was[4]:='';was[5]:='';

if alreadyrun=1 then begin close(ab);close(kn);end;

assign(kn ,'kn-asc.txt'); {$I-}reset(kn,1); {$I+} if ioresult <> 0 then begin
 writeln(' Sorry, but your Phonebook could not be found. Press any key ...');ch:=readkey;exit;end;

assign(ab ,'ab-asc.txt'); {$I-}reset(ab,1);{$I+} if ioresult <> 0 then begin
 writeln(' Sorry, but your Phonebook could not be found. Press any key ...');ch:=readkey;exit;end;

assign(res,'_phl_tmp.$$$');

textmode(3+font8x8);
window(1,1,80,50);textbackground(white);clrscr;


textcolor(blue);for look:=1 to 49 do begin gotoxy(1,look);write('Г');gotoxy(80,look);write('Г');end;
textcolor(white);window(1,50,80,50);textbackground(blue);clrscr;
write('    Please enter a name, a phone-number or s.th. like that to search for ...');
window(1,1,80,1);textbackground(blue);clrscr;
write(' -- PHLs FON ver. 2.0 pre-final (c) ''96 by phl -- Progr. Indicator [..........]');

window(2,2,79,49);textbackground(white);clrscr;



if alreadyrun=0 then begin
textcolor(blue);
if length(paramstr(1))<5 then begin
 if length(paramstr(1))>0 then begin
 writeln('Also if you want to use param-strings,you have to enter at least 5 characters!');
 end;
end;


if length(paramstr(1))>4 then begin ss:=paramstr(1);goto weiter;end;
end;

alreadyrun:=1;

writeln;textcolor(blue);
writeln;
writeln(' Enter Search-String ([q],[ret] exits) , at least 5 characters :');
writeln;
write  ('                           АААААББББББББББ');gotoxy(wherex-15,wherey);readln(ss);
window(2,2,79,49);textcolor(black);clrscr;
if ss='' then begin close(kn);close(res);goto beg;end;
if upcase(ss[1])='Q' then begin goto ente;end;
if ss='phl' then goto phl;if ss='PHL' then goto phl;
if length(Ss)<5 then goto beg;

weiter:

for uc:=1 to length(ss) do begin ss[uc]:=upcase(ss[uc]);end;
textcolor(white);
window(1,50,80,50);textbackground(blue);clrscr;write(' Searching for : ', ss,'   ... press [esc] to abort.');
textbackground(white);

window(2,2,79,49);gotoxy(1,1);clrscr;

{konstanz !!!:}
rel:=0;numread:=0;blxr:=0;
rewrite(res);
writeln(res,' \\ KONSTANZ //');
repeat
 if keypressed then begin ch:=readkey; if ch=#27 then goto ente; end;
 blockread(kn,bl,sizeof(bl),numRead);rel:= ( blxr*60000 / filesize(kn)*100);
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
 window(2,2,79,49);
 gotoxy(wx,wy-1);
 writeln;

  for x:=1 to 60000 do begin
   if bl[x]=  ss[1] then begin
   if bl[x+1]=ss[2] then begin
   if bl[x+2]=ss[3] then begin
   if bl[x+3]=ss[4] then begin
   if bl[x+4]=ss[5] then begin
         for z:=1 to 200 do begin
         write(res,bl[z+x-100]);
         end;
         wx:=wherex;wy:=wherey;
  end;end;end;end;end;
  end;

inc(blxr);
until numread=0;

{allensbach !!!:}
rel:=0;numread:=0;blxr:=0;
writeln(res,^M^J,' \\ ALLENSBACH //');
repeat
 if keypressed then begin ch:=readkey; if ch=#27 then goto ente; end;
 blockread(ab,bl,sizeof(bl),numRead);rel:= ( blxr*60000 / filesize(ab)*100);
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
 window(2,2,79,49);
 gotoxy(wx,wy-1);

  for x:=1 to 60000 do begin
   if bl[x]=  ss[1] then begin
   if bl[x+1]=ss[2] then begin
   if bl[x+2]=ss[3] then begin
   if bl[x+3]=ss[4] then begin
   if bl[x+4]=ss[5] then begin
         for z:=1 to 200 do begin
         write(res,bl[z+x-100]);
         end;wx:=wherex;wy:=wherey;
  end;end;end;end;end;
  end;
inc(blxr);
until numread=0;
close(res);


{Eigentliche Suche abgeschlossen, jetzt Auswertung von $phl$.tmp}
gotoxy(2,1);
writeln;reset(res);textcolor(8);
writeln(' The following stings were found on your search for ',ss,' : ');textcolor(black);
writeln;

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
   for m:=1 to length(s) do begin
       if s[m]='#' then s[m]:=' ';
       if s[m]='"' then begin
        inc(o); if o=1 then begin textcolor(blue);write('NAME: ');textcolor(textc);end;
                if o=3 then begin textcolor(blue);gotoxy(40,wherey);write('STRASSE: ');textcolor(textc);end;
                if o=5 then begin if wherex>40 then writeln;textcolor(blue);write('ORT : ');textcolor(textc);end;
                 if o=7 then begin textcolor(blue);gotoxy(40,wherey);write('TELEFON: ');textcolor(textc);end;
       end else write(s[m]);end;
    writeln;writeln;

    if wherey > 46 then begin window(1,50,80,50);textbackground(blue);clrscr;textcolor(7);
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
write('   ---->  *** any [key]  to quit, [space] to search again  ***   <----');
ch:=readkey;
if ch=#32 then goto beg;

goto ente;

phL:
writeln;
writeln('  You can contact me via e-m@il: HACKERLE@T-ONLINE.DE ... But why ?');
writeln;
write('  Press any key, I wanna go home....');ch:=readkey;


ente:
window(1,1,80,50);
textbackground(black);textcolor(7);
clrscr;
writeln(' Thank you for using phl. products ! ');

END.