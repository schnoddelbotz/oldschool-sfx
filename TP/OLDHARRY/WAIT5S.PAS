Program WAITFORIT;
USes CRT;
 VAR x:integer;
BEGIN;
writeln(' �������� WAIT  for a few seconds seconds ! ��������');
for x:=1 to 54 do begin;
write('.');delay(50);
if x=54 then write('         OK !');
end;
end.