Program Countit;
uses crt;
var x,y,z:integer;
    dm,total:real;
    f:text;
    c:char;
   err:word;
    s,ss,amount:string;
label rerun;
BEGIN
if paramstr(1)='' then begin write('no file speified.');exit;end;
textmode(3+font8x8);
assign(f,paramstr(1));reset(f);
rerun:
close(F);reset(f);
x:=0;y:=0;
write(' Enter Searchstring:');readln(ss);
dm:=0;total:=0;

for y:=1 to length(ss) do begin ss[y]:=upcase(ss[y]);end;


while not eof(f) do begin
 amount:='';
 if wherey > 49 then begin write('Press a key .... [esc] exits');c:=readkey;
 if c=#27 then exit;clrscr;end;
 readln(f,s);inc(z);
 for y:=1 to length(s) do begin s[y]:=upcase(s[y]);end;

 if pos(ss,s)  <> 0 then begin
  delete(S,pos(',',s)+3,length(S)-pos(',',s));
  s[pos(',',s)]:='.';
  inc(X);
  for y:=21 to length(s) do begin amount:=amount+s[y];end;
  val(amount,dm,err);
 write('Talk costs... ',dm:5:2,' ');
 total:=total+dm;
 end;
 if err<>0 then begin writeln(' One too high amount ! (L.',z,').');end;
end;

writeln;
textcolor(white);
writeln(' TOTAL    : DM ',total:3:2);
writeln(' Found it : ', x,' times.');
textcolor(7);
writeln('done. [esc] exit, [space] search again.');
c:=readkey;
if c=#27 then begin close(f);exit;end;if c=#32 then goto rerun;
close(f);
END.