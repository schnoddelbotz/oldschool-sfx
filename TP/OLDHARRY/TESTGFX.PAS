Program Mine;
uses Graph;

var
  Gd, Gm: Integer;
  Radius: Integer;
begin
  Gd := Detect;
  InitGraph(Gd, Gm, 'd:\tp\bgi\egavga.bgi');
 { if GraphResult <> grOk then
  Halt(0);}
  for Radius := 40 downto 1 do
    Circle(300, 200, Radius * 2);
  for Radius := 1 to 80 do
    Circle(300, 200, radius * 4);
Writeln(' What the shit is going on here?');
  Readln;
  CloseGraph;
end.