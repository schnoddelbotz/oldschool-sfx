Program Kannichmauseibindenfragezeichen;
Uses Crt,drivers;
Var x,y,z:integer;
        e:TEvent;
        c:char;
BEGIN

clrscr;
writeln('xxx');

getmouseevent(e);
CASE e of
 evmousedown : write(' fuck down');
 evmouseup   : write(' fuck up !');
if evMouseMove=$0001 then begin write(' move ');end;

writeln('yyy');


writeln;writeln(' Delay ...');delay(2000);
END.