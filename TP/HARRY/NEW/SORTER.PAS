Program Test;
uses crt;
var         s:array [1..500] of string[20];
           ch:char;
            x:integer;

function chg(a,b:string):string;var stri:string[20];begin
stri:=a;
a:=b;
b:=stri;

end;


BEGIN
clrscr;
s[1]:='Gerald';s[2]:='Zypern';s[3]:='Acolf';s[4]:='Adelf';s[5]:='Bern';s[6]:='Adolf';
for x:=1 to 6 do writeln(x:3,'.: ',s[x]);
writeln;

chg(s[1],s[2]);

for x:=1 to 6 do writeln(x:3,'.: ',s[x]);

write(^m^j' key 2 X-it ');ch:=readkey
END.

directvideo
function
crt