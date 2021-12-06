Program FONCOMPRESS;
uses crt;
var     x,y,z,a,b,c:integer;
               f1,f2:text;
               s,rem:string;
                   ch,ch2:char;
BEGIN
assign(f1,'kn-asc._c_');reset(f1);
assign(f2,'kn-co.txt');rewrite(f2);
writeln;
write(' Enter String to replace   : ');readln(rem);
write(' Enter char to use instead : ');ch:=readkey;
writeln;
write(' Replace ',rem,' by ',ch, ' ?');
ch2:=readkey;if ch2=#27 then exit;
writeln;
write(' copying ...');


 repeat
 inc (a);if a=600 then begin write('.');a:=0;end;
 readln(f1,s);
 b:=pos(rem,s);if b<>0 then begin s[b]:=ch;delete(s,b+1,length(rem)-1);b:=0;end;

 {if pos('"TELEFAX"#',S)= 0 then} writeln(f2,s);
 until eof(f1);

close(f1);
erase(f1);
close(f2);
rename(f2,'kn-asc._c_');
writeln;writeln(' finished.');


end.

