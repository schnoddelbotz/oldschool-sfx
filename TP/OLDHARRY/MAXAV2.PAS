uses msgbox,app,drivers,crt,graph,dos;
var  x:integer;

     GraphDriver, GraphMode: Integer;
      grDriver: Integer;
  grMode: Integer;
  ErrCode: Integer;
BEGIN
  grDriver := Detect;
  InitGraph(grDriver, grMode,'');
  ErrCode := GraphResult;
  if ErrCode = grOk then
  begin  { Do graphics }

for x:=1 to 200 do
BEGIN
    setcolor (x);
    ellipse(x,x,300,x,x,x);
END;
for x:=1 to 300 do
BEGIN
     setcolor(x*70);
     line(100,x,300,x);
END;
for x:=1 to 300 do
BEGIN
     setcolor(x*88);
     line(100,250,300,x);

for x:=1 to 300 do
 begin
   circle(500,x,x);
   setcolor(x);
end;
END;
    readkey;
    CloseGraph;
  end
  else
    Writeln('Graphics error:', GraphErrorMsg(ErrCode));
end.