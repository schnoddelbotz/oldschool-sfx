Program READMOUSE;
USES Crt,drivers;
Var   x:integer;
     ch:char;
      b:byte;
  event:TEvent;
    str:string;
BEGIN

clrscr;
writeln('  Check Mouseoptions by PHL prod.');

getmouseevent(event);
if event = $0001 then BEGIN writeln('pressed'); END;
if event = $0004 then BEGIN writeln('moved');   END;



write('Das wars auch schon.');delay(1000);
END.