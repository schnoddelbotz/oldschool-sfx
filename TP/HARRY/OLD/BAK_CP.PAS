Program CP;
Uses crt;
Var  x,z,a,c,p:longint;
        ch:char;
         f,f2:file;
         s:string;
{         b:array [1..64000] of byte;}
         b:array [1..64000] of char;
         y:word;

BEGIN

{
clrscr;}
assign(f,paramstr(1));
{assign(f2,paramstr(2));}reset(f,1);{rewrite(f2,1);}


{assign(f ,'c:\tools\fon\kn-asc.txt');reset(f,1);
assign(f2,'d:\temp\copyii.c');rewrite(f2,1);     }
write(' Starting after 5 points ');for x:=1 to 5 do begin write('.');delay(500);end;
writelN;
{writeln(' CP by phl.');
writeln(' Die In-datei ist ',filesize(f):2,' bytes groá');}

repeat
inc(z);
blockread (f ,b,sizeof(b),y);

{blockwrite(f2,b,y);}

write(z:5,' blocks … 64k read. (totally ',z*64000/1024000:2:1,' megabytes)       ');
gotoxy(1,wherey);
until y=0;

writeln;writeln(' Finished !');


{writeln;}
{write('Ich warte auf einen ...');
ch:=readkey;writelN(ord(ch));delay(700);}
close(f);{close(f2);}
END.