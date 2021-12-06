uses jancrt,crt;
var x:integer;ch:char;
begin
textmode(3+font8x8);
clrscr;
for x:=1 to 3999 do write('1');
backupwin;
gotoxy(10,10);
write('  *** moving away...  *** ');delay(2000);

textmode(3);
clrscr;
writeln(' restoring... in 80x25');
delay(1000);
restorewin;
gotoxy(3,3);write('  done  ');
ch:=readkey;
end.