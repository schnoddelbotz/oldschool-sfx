Program TimeSetter;
uses dos,crt;
var              ch : char;
                  x : integer;
      h, m, s, hund : Word;
BEGIN
clrscr;
writeln(' The time is now set to 0.');
settime(0,0,0,0);
writeln(' We are now waiting for x 1/100s....');
delay(5000);
gettime(h,m,s,hund);
writeln;
writeln(' Okay as tiem we got now ... :',h,':',m,':',s,':',hund);
writeln(' Press any key');
ch:=readkey;
END.