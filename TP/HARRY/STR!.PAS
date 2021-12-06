Program ReadStrs;
Uses Crt;
Var x,y,z:integer;
      str,hm:string;
       ch:char;
BEGIN
hm:=('a:,b:,c:');
clrscr;
writeln;
gotoxy(33,3);writeln('Beispiel : D:\TEMP\JETZT\');gotoxy(3,2);
write('  Bitte einen kompletten Pfad eingeben : ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±± ');

gotoxy(wherex-32,wherey);
readln(str);
writeln;
writeln(' Gew„hltes Laufwerk: ',str[1],str[2]);;
writeln;
writeln();
writeln;
ch:=readkey;
END.


{
for x:=1 to length(str) do begin
writeln(' Der ',x:3,'. Buchstabe des Strings lautet:',str[x]);
end;
   }