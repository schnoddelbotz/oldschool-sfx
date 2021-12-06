{8192 war Pascal} {61000=$ war BIOS !!!} {max 65535:65535 = $10000:$10000}
{spalten: $0040:$004a  $0040:$0051}
uses crt,dos;
Var x:integer;
   ch:char;
    i,j:integer;
   name:string;
   jo:real;
    f:text;
label cont;

BEGIN
textmode(co80+font8x8);
writeln(' Enter outputfile for BIOS :');readln(name);
assign(f,name);
rewrite(f);
for i:=-32000 to 32000 do begin {i:=0}
{jo:=0; while jo < 65535 do begin inc jo}
  x:=MEM[$ee48:i];
  if (x>31) and (x<127) then begin write(f,chr(x));inc(j);end;

{  if j>3838 then begin textcolor(15);writeln;writeln('press any key, q quit');ch:=readkey;
  if (upcase(ch)='Q') or (ch=#27) then exit;j:=0;textcolor(7);end;}


cont:
 end;
textcolor(15);
close(f);
writeln;writeln(' Operation done in outputfile : ',name,'   ...press any key.');
ch:=readkey;
END.