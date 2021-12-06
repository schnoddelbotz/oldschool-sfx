Uses crt,jantools;
Var
      wannaexit:byte;
      x:integer;
      ch:char;
BEGIn
clrscr;

randomize;

repeat
write(chr(random(200)+28));
if keypressed then begin


  if cH=#0 then begin
   if ch=#27 then begin write('exit');delay(3000);wannaexit:=1;end;
  end;


until wannaexit=1;








ch:=readkey;
end.