program x8;
uses crt,dos;




var t:char;
s:string; {verzeichnis}


begin

writeln('Was soll installiert werden ? :  1,2,3');


write('Verzeichnis:');
readln(s);

t:=readkey;

if t='1' then exec('command.com','copy config1.sys ',s);
if t='2' then exec('command.com','copy config2.sys config.sys');

end.