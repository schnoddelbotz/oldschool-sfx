Uses Drivers,crt;
var x:integer;
    c:char;
    s:string;
    e:TEvent;
BEGIN

repeat
GetMouseEvent(E);
If Event=EvMouseDown then write('down');
until keypressed;
c:=readkey;

END.