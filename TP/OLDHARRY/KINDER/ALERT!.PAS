Program snd;
uses crt;
var x:integer;
BEGIN;
REPEAT
 BEGIN
  for x:=19 to 14000 do sound(x);
  for x:=14000 downto 19 do sound(x);
 END
UNTIL KeyPressed;
NoSound;
End.