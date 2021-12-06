Program Countit;
uses crt,dos,jancrt;
var xc,yc,zc:integer;
    dm,total:real;
    t:text;
    c:char;
   err:word;
    s,ss,amount:string;


x,y,z,disp,posi,tags:integer;
               numFiles,num2disp:integer;  {Anzahl d Dateien, Anz d Anzugeigenden Dateien}
                             tag:array [1..1000] of char;
                           namen:array [1..1000] of string[12];
                           attrs:array [1..1000] of word; {speichert die attribute}
                            attr:word;
                       dirRecord:SearchRec;
                              ch:char;
                               f:file;
                    enablemarker:boolean;


label rerun;


procedure ReadFiles;begin
  fout(80,1,15,'Û');
    numfiles:=0;for x:=1 to 2000 do begin namen[x]:='';tag[x]:=#0;end;
    FindFirst('*.pas',Archive+directory,DirRecord);
    While Doserror <> 18 do begin
    inc(numFiles);
    namen[numFiles]:=dirrecord.name;
    assign(f,dirrecord.name);getFattr(f,attrs[numFiles]);
    if dirrecord.name='.' then dec(numfiles);
    FindNext(DirRecord);
    END;
    posi:=1;disp:=1;
  fout(80,1,15,' ');
end;

procedure display;begin
   z:=0;
   for x:=disp to disp+num2disp do begin
    textbackground(blue);textcolor(15);
    if attrs[x]=16 then textcolor(lightcyan);
    if tag[x]=#254 then textcolor(Lightgreen);
    inc(z);if z=posi then begin textcolor(black);textbackground(cyan);
                          if attrs[posi+disp-1]=16 then textcolor(8);
                          if tag[posi+disp-1]=#254 then textcolor(yellow);
                          end;
    write(namen[x]:13);writeln(tag[x]);
   end;
end;

{laufzeitfehler}

BEGIN
enablemarker:=false;
chdir('c:\tp\harry\new');
readfiles;
clrscr;textcolor(15);textmode(259);
disp:=1;posi:=1;
num2disp:=20; dec(num2disp);
display;

repeat
gotoxy(1,1);
if ch<>#9 then ch:=readkey else ch:=#8;
if enablemarker=true then begin
 if ch=#32 then begin
   if tag[disp+posi-1] = #254 then begin
    tag[disp+posi-1]:=#0;
    if (posi<numfiles) and (posi<num2disp+1) then begin inc(posi); end
    else begin if disp+posi<numfiles then inc(disp);end;
   end
  else
   begin
    tag[disp+posi-1]:=#254;
    if (posi<numfiles) and (posi<num2disp+1) then begin inc(posi); end
    else begin if disp+posi<numfiles then inc(disp);end;
 end;
end;


end;

if ch=#0 then begin ch:=readkey;
 if ch=#132 then if disp <>1 then begin posi:=1;disp:=1;end else begin if namen[1]='..' then chdir('..');readfiles;end;
 if ch=#118 then if numfiles>num2disp then begin posi:=num2disp+1;disp:=numfiles-posi+1;end;
 if ch=#32 then begin gotoxy(1,1);write('  Drive :     ');ch:=readkey;{$I-}chdir(ch+':');{$I+}
    gotoxy(1,1);
    if ioresult = 0 then readfiles else write(' drive error !');end;
 if ch=#72 then begin
   if posi>1 then dec(posi) else if disp>1 then dec(disp);
 end;
 if ch=#80 then begin
  if (posi<numfiles) and (posi-1<num2disp) then begin inc(posi); end
    else begin if disp+posi-1<numfiles then inc(disp);end;
 end;
 if ch=#73 then begin
  if disp=1 then posi:=1;
  if numfiles<num2disp then posi:=1 else begin
  {fout(20,19,19,'pgup!');}
  end;
 end;
 if ch=#81 then begin
  if numfiles<num2disp+1 then posi:=numfiles else begin
{   fout(20,19,19,'pgdn!');}
  end;
 end;
end;

display;
if (ch=#13) then begin
 assign(f,namen[disp+posi-1]);GetFAttr(f,attr);
 if (attr=48) or (attr=16) then begin chdir(namen[disp+posi-1]);readfiles;ch:=#9;end;
end;

until (ch=#27) or (ch=#13);

window(1,1,80,50);
gotoxy(2,50);

 assign(t,namen[disp+posi-1]);
 reset(t);






{if paramstr(1)='' then begin write('no file speified.');exit;end;
assign(f,paramstr(1));reset(f);
}
rerun:
close(t);reset(t);
xc:=0;yc:=0;
writeln;
write(' Enter Searchstring:');readln(ss);
writeln;
dm:=0;total:=0;

for yc:=1 to length(ss) do begin ss[yc]:=upcase(ss[yc]);end;


while not eof(f) do begin
 amount:='';
 {if wherey > 49 then begin write('Press a key .... [esc] exits');c:=readkey;}
 {if c=#27 then exit;clrscr;end;}
 readln(t,s);inc(zc);
 for yc:=1 to length(s) do begin s[yc]:=upcase(s[yc]);end;
 if pos(ss,s)  <> 0 then begin
  delete(S,pos(',',s)+3,length(S)-pos(',',s));
  s[pos(',',s)]:='.';
  inc(Xc);
  for yc:=21 to length(s) do begin amount:=amount+s[yc];end;
  val(amount,dm,err);
 write('Talk costs... ',dm:5:2,' ');
 total:=total+dm;
 end;
 if err<>0 then begin writeln(' One too high amount ! (L.',zc,').');end;
end;

writeln;
textcolor(white);
writeln(' TOTAL    : DM ',total:3:2);
writeln(' Found it : ', xc,' times.');
textcolor(7);
writeln(' done. [esc] exit, [space] search again.');
c:=readkey;
if c=#27 then begin close(f);exit;end;if c=#32 then goto rerun;
close(t);
END.