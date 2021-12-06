Program Capture;
Uses Jantools,crt;
Var x:integer;
    c:^byte;
    datei:text;
BEGIN
assign(datei,'D:\TEMP\capture.jan');
rewrite(datei);
for x:=0 to (givemaxx*givemaxy) do begin
c:=ptr($B800,x*2);
write(datei,chr(c^));
end;
close(datei);
writeln;writeln(' Caputre finished ! ');
END.