Program WAITFORIT;
USes CRT;
 VAR x:integer;
BEGIN;
writeln(' ฤฤฤฤออออ WAIT  for a few seconds seconds ! ออออฤฤฤฤ');
for x:=1 to 54 do begin;
write('.');delay(50);
if x=54 then write('         OK !');
end;
end.