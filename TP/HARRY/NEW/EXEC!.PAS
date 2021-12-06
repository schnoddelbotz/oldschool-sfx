Program Test;
uses dos,crt;
var ch:char;
BEGIN
{$M $4000,0,0 }
swapvectors;
exec('C:\WINDOWS\WIN.COM','/N');
writeln(doserror);
writeln('done');
swapvectors;
cH:=readkey;
END.