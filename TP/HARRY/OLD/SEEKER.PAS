Program Seeker;
uses crt;
var xs,ys,zs,cs,sems,ls:integer;
       ch:char;
       s,header:string;
       adr,prn:text;

BEGIN
clrscr;
assign(prn,'lpt1');rewrite(prn);
assign(adr,'D:\TEMP\ABA14\ADR_ABR.TXT');
{assign(adr,'D:\TEMP\doba1\ADR_ABR.TXT');}
reset(adr);


readln(adr,s);

for xs:=129 to length(s) do begin s[xs]:=upcase(s[xs]);header:=header+s[xs];END;
writeln(' ... ',header);

for xs:=1 to length(header) do begin
 if header[xs]=';' then inc(sems);
end;
writeln(' ... In the header are ',sems,' semicolons.');



writeln(prn,'    ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·');
writeln(prn,'    º           Adressdaten-Auflistung fr Objekt Nummer 01         º');
writeln(prn,'    ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½');
while not eof(adr) do begin
  readln(adr,s);zs:=0;for cs:=1 to length(s) do begin s[cs]:=upcase(s[cs]);end;


for ls:=pos(';',s) to length(s) do begin
  if s[ls]=';' then begin inc(zs);
   if zs=1 then begin write(prn,'NAME : ');end;
   if zs=2 then begin write(prn,'   STRASSE :');end;
   if zs=3 then begin writeln(prn);write(prn,'ORT  : ');end;
   if zs=4 then begin s:=''end;
  end else begin if zs<4 then write(prn,s[ls]);end;
end;


writeln(prn);writeln(prn);
end;






ch:=readkey;
END.