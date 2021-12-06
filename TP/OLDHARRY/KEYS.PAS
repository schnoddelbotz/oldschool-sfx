{$M $800,0,0 }
uses Crt, Dos;
var
  KbdIntVec : Procedure;
{$F+}
procedure Keyclick; interrupt;
begin
  if Port[$60] < $80 then
    begin
    Sound(5000);
    Delay(1);
    Nosound;
    end;
  inline ($9C);
  KbdIntVec;
end;
{$F-}
begin
  GetIntVec($9,@@KbdIntVec);
  SetIntVec($9,Addr(Keyclick));
  Keep(0);
end.
