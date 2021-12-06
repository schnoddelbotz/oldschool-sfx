Program FileNameWindow;
Uses Crt,dos;
Var Dir_record:Searchrec;
             x:integer;
            ch:char;
BEGIN
x:=1;
FindFirst('*.*',Archive+ReadOnly,Dir_Record);
While Doserror <> 18 do begin
    if wherey>24 then begin x:=x+15;window(x,1,80,25);end;
    Writeln(Dir_Record.name);
    delay(40);
    FindNext(Dir_Record);
    END;

ch:=readkey;
END.