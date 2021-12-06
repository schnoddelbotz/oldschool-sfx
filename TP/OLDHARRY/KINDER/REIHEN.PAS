Program ScrSvr;
Uses CRT;
 VAR X,y,z,m : Integer;

BEGIN
clrscr;
WRite(' Welche Zahlen-Reihe? Z.b: 12 fÅr die 12-er Reihe: ');readln(x);
writeln;
write(' Ab welcher Zahl ?: ');readln(y);
write(' Bis zur wievielsten Zahl ?: ');readln(z);
for m:=y to z do begin
 writeln(m,' mal ',x,' gibt:', m*x);
 delay(0);
 END;
readln;
END.
