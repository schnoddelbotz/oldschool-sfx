Program D2Health;
Uses crt,hexe;
const
           abc:array[0..16] of byte = (48,49,50,51,52,53,54,55,56,57,97,98,99,100,101,102,32);
Var x,y,y2,z,posi,i,forx,in1,in2,cnt:integer;
       a,b,sim:byte;
  ch,sim1,sim2:char;
             c:array [1..2] of byte;
           www:array [1..2] of byte;
             f,f2:file;
         isnow:array [1..4] of byte;
             d,really,yeah,yeah1,yeah2,decc:real;
          s,s2:string;

          max_exist:integer;
          block:array [1..62000] of char;
          result:word;

{for nice-proggy only:}
     xn,yn,zn:integer;


procedure hex(sim:byte);                    {** DEC -> HEX }
begin a:=trunc(sim/16);b:=sim-a shl 4 end;

procedure deci(sim1,sim2:char);             {** HEX -> DEC }
var q:byte; begin q:=0;while sim1<>chr(abc[q]) do inc(q);by:=q shl 4;
                  q:=0;while sim2<>chr(abc[q]) do inc(q);inc (by,q) end;


procedure dec2hex(dec:real);begin
d:=dec / 256;str(d:3:20,s);s2:=s;
i:=trunc(d);delete(s2,1,posi);s2:=s2;
really:=d-i;really:=really*256;
str(really:2:0,s2);val(s2,y,z);hex(i);
isnow[1]:=a;isnow[2]:=b;hex(y);
isnow[3]:=a;isnow[4]:=b;
end;

procedure hex2dec(in1,in2:integer);begin

if y2<>0 then begin
yeah1:=x/256;
yeah2:=y2;
yeah :=(yeah1+yeah2)*256;
end;

if y2=0 then begin
yeah:=x;
end;

end;

label showit;

BEGIN
assign(f,'DESCENT2.EXE');
assign(f2,'D2MAX.EXE');
{$I-}
reset(f,1);
{$I+}
textcolor(white);
if ioresult <> 0 then begin
writeln(' Sorry, but DESCENT2.EXE could not be found or is write-protected.');
writeln(' You don''t have to be afraid: I will make NO changes to it........');
exit;end;


if filesize(f) <> 1448873 then begin
writeln('   Sorry but your DESCENT2.EXE is ...');writeln;
writeln(' a) not DESCENT2.EXE');
writeln(' b) corrupt');
writeln(' c) not Version 1.0');
writeln(' d) not in the actual path');
writeln;
writeln('   Go and find solutions !');
exit;end;

{$I-}
reset(f2,1);
{$i+}
if ioresult = 0 then begin max_exist:=1; end else max_exist:=0;

textmode(co80);textbackground(blue);clrscr;
for xn:=1 to 1999 do begin write('°');end;textcolor(white);
window(1,1,80,1);textbackground(red);clrscr;

if max_exist = 0 then begin write('  reading DESCENT2.EXE ...');
 repeat
  write('.');
  blockread (f ,block,sizeof(block),result);
 until result=0;
end;

if max_exist = 1 then begin write('  reading D2MAX.EXE ...');
 repeat
  write('.');
  blockread (f2,block,sizeof(block),result);
 until result=0;
end;



write(' done.');delay(750);clrscr;
write('     ... (not-only-)multiplayer-cheat ...      (c) by the ~rîaL~ ×AcKîr');
window(1,25,80,25);clrscr;
write('  ---phl---phl---phl---phl---phl---phl---phl---phl---phl--- : D2-SH ver. 1.1');
window(51,6,71,7);textbackground(black);clrscr;

{write(' Okay, right now you have ',x,' and ',y,' (in hex: ',a,b);hex(y);}
{writeln(' ',chr(abc[a]),chr(abc[b]),')');
writeln;}

if max_exist=0 then begin
seek(f,1372918);
blockread(f,c,2);x:=c[1];y:=c[2];y2:=c[2];hex(x);
hex2dec(c[1],c[2]);
end;

if max_exist=1 then begin
seek(f2,1372918);
blockread(f2,c,2);x:=c[1];y:=c[2];y2:=c[2];hex(x);
hex2dec(c[1],c[2]);
end;



window(11,11,42,17);textbackground(black);clrscr;
window(10,10,41,16);textbackground(red);clrscr;
write('  ');
textbackground(blue);
writeln(' ---KEY---  ---FUNCTION--- ');textcolor(7);
textbackground(red);textcolor(7);
writeln('   Home/End          0/32767');
writeln('   PgUp/Dn           +/- 100');
writeln('   ',#24,'/',#25,'               +/-  10');
writeln('   +/-               +/-   1');
writeln('   S                  Save !');
write('   [esc]              Quit !');



window(50,5,70,6);textbackground(blue);clrscr;
textcolor(7);
writeln('   Shield at start:');
textcolor(white);write(' ',yeah:12:0);


showit:
window(51,5,70,6);textbackground(blue);clrscr;
textcolor(7);
writeln('  Shield at start:');
textcolor(white);write(' ',yeah:12:0);



repeat
ch:=readkey;
if ch=#72 then begin if yeah<32767-10 then begin yeah:=yeah+10;end;goto showit;end;
if ch=#80 then begin if yeah>0+10     then begin yeah:=yeah-10;end;goto showit;end;
if ch=#79 then begin yeah:=0;goto showit;end;
if ch=#71 then begin yeah:=32767;goto showit;end;
if ch=#43 then begin if yeah<32767 then begin yeah:=yeah+1;end;goto showit;end;
if ch=#45 then begin if yeah>0     then begin yeah:=yeah-1;end;goto showit;end;
if ch=#73 then begin if yeah<32767-100 then begin yeah:=yeah+100;end;goto showit;end;
if ch=#81 then begin if yeah>0+100 then begin yeah:=yeah-100;end;goto showit;end;


 if upcase(ch)='S' then begin {write (new) YEAH to d2max.}
  clrscr;
  dec2hex(yeah);

   deci(chr(abc[isnow[3]]),chr(abc[isnow[4]]));
  www[1]:=by;
   deci(chr(abc[isnow[1]]),chr(abc[isnow[2]]));
  www[2]:=by;

  if max_exist = 0 then begin {d2max noch nicht da}
   writeln(' Writing D2MAX...');
   rewrite(f2,1);seek(f,0);
   repeat
    if cnt=1 then begin write('\',^M);end;
    if cnt=2 then begin write('|',^M);end;
    if cnt=3 then begin write('/',^M);end;
    if cnt=4 then begin write('\',^M);end;
    if cnt=4 then cnt:=1;
    inc(cnt);
   blockread (f ,block,sizeof(block),result);
   blockwrite(f2,block,result);
   until result=0;
  seek(f2,1372918);
  blockwrite(f2,www,2);


  end;

  if max_exist = 1 then begin {d2max bereits da}
   writeln(' Changing Value..');
   seek(f2,1372918);
   blockwrite(f2,www,2);
  end;



  sound(800);delay(30);nosound;
  write  (' Press [');textcolor(7);write('esc');textcolor(white);write('] ....');

 { seek(f2,1372918);
  blockwrite(f2,www,2);
  close(f2);}

 end;




until ch=#27;
{writeln(' Program terminated .');}

close(f2);
window(1,1,80,25);textbackground(black);
clrscr;
writeln(' >>>>>>    THX 4 USING PHL. PRODUCTS  <<<<<<');textcolor(7);
writeln;textcolor(white);
writeln(' ... And now type D2MAX to have fun ;-) ');
end.