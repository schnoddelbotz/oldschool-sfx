program reader;
uses crt;
var x,y,z:longint;
    f,f2:text;
    c,a,b,c,d:char;
    s,fin,fout:string;

procedure rem1stch;BEGIN
for x:=1 to length(s) do s[x]:=s[x+1];
END;

BEGIN
clrscr;
if paramcount < 2 then begin
writeln(' Syntax:  QR IN_FILE OUT_FILE A B C D');
writeln;
exit;end;

y:=0;
fin:=paramstr(1);
fout:=paramstr(2);
a:=paramstr(3);
b:=paramstr(4);
c:=paramstr(5);
d:=paramstr(6);

assign(f ,fin);
assign(f2,fout);
reset(f);rewrite(f2);
writeln(' Quote-Remover .... another senseless tool by phl.');
writeln(' Processing file : ',fin);
writeln(' Output file     : ',fout);

while not EOF (F) DO BEGIN
inc(y);
gotoxy(1,5);write('Now at line ... ',y:8);
readln(f,s);

  if s[1]=a then begin
   if s[2]=b then begin
    if s[3]=c then begin
     if s[4]=d then begin
      delete(s,1,4);end;end;end;end;



if s[1]=' ' then rem1stch;
writeln(f2,s);  {writing in output file}
{writeln(s);     {writing on screen for checking ...}
END;

writeln;writeln;
writeln('DUNNO ! Press any key');
c:=readkey;close(f);close(f2);
END.