Program FileChooser;
Uses Crt,dos,jancrt;
var         x,y,z,disp,posi,tags:integer;
               numFiles,num2disp:integer;  {Anzahl d Dateien, Anz d Anzugeigenden Dateien}
                             tag:array [1..2000] of char;
                           namen:array [1..2000] of string[12];
                                            {2000*13=26k on heap !!!}
                       dirRecord:SearchRec;
                              ch:char;

procedure display;begin
   z:=0;
   for x:=disp to disp+num2disp do begin
   textbackground(blue);textcolor(15);
   if tag[x]=#254 then textcolor(Lightgreen);
   inc(z);if z=posi then begin textcolor(black);textbackground(cyan);
                         if tag[posi]=#254 then textcolor(yellow);
                         end;
   write(namen[x]:13);writeln(tag[x]);
   end;
end;

procedure info;begin
str(posi:4,namen[2000]);
str(disp:4,namen[1999]);
str(numfiles:4,namen[1998]);
str(posi+disp:4,namen[1997]);
fout(71,1,111,'POSI: '+namen[2000]);
fout(71,2,111,'DISP: '+namen[1999]);
fout(71,3,111,'NUMF: '+namen[1998]);
fout(71,4,111,'PODI: '+namen[1997]);
end;


BEGIN
{chdir('d:\linux\dev');}

    FindFirst('*.*',Archive,DirRecord);
    While Doserror <> 18 do begin
    inc(numFiles);
    namen[numFiles]:=dirrecord.name;
    FindNext(DirRecord);
    END;

clrscr;textcolor(15);textmode(259);
disp:=1;posi:=1; {posi: scroller-position !}
num2disp:=45; {wievele dateien maximal im scroller ?}
display;info;

repeat
gotoxy(1,1);
ch:=readkey;

{marker}
if ch=#32 then begin
  if tag[disp+posi-1] = #254 then begin
   tag[disp+posi-1]:=#0;
   if (posi<numfiles) and (posi<num2disp+1) then begin inc(posi); end
   else begin if disp+posi<numfiles then inc(disp);end;
  end
 else
  begin
   tag[disp+posi-1]:=#254; {erste datei wird verschluckt !!!}
   if (posi<numfiles) and (posi<num2disp+1) then begin inc(posi); end
   else begin if disp+posi<numfiles then inc(disp);end;
  {if disp<numfiles then begin inc(disp); end else bottommsg;}
end;

end;

if ch=#0 then begin ch:=readkey;
 if ch=#72 then begin
   if posi>1 then dec(posi) else if disp>1 then dec(disp);
 end;{of up}

 if ch=#80 then begin
  if (posi<numfiles) and (posi-1<num2disp) then begin inc(posi); end
    else begin if disp+posi-1<numfiles then inc(disp);end;
 end;{of dn}


 if ch=#73 then begin
  if numfiles<num2disp then posi:=1 else begin


  end;
 end;{of pgup}

 if ch=#81 then begin
  if numfiles<num2disp then posi:=numfiles else begin


  end;
 end;
end;{of ... if ch=0}


display;
info; {only for coding}
until (ch=#27) or (ch=#13);

window(1,1,80,50);
gotoxy(2,50);

if ch=#13 then begin
 window(40,1,80,50);textbackground(white);clrscr;textcolor(black);
 writeln(^m^j,' Cursor on file: ',namen[disp+posi-1]);
 writeln(^m^j,' Tagged files :',^m^j);
 for x:=1 to numfiles do begin
  if tag[x]=#254 then begin writeln(namen[x]:13);  inc(tags);end;
 end;
 writeln(^m^j,' Files Tagged : ',tags);
end
else write(' No file selected - ', numfiles,' files were in buffer.');

ch:=readkey;
chdir('c:\tp\harry\new');
END.