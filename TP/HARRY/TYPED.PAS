Program FirstTypedFile;
Uses Dos,Crt;
TYPE
      DatTyp = Record
                  Name   : string[20];
                  Nummer : string[20];
                  END;
Var      f : file of DatTyp;
    DatEin : DatTyp;
         x : integer;
        ch : char;


Procedure Eingabe;BEGIN
Rewrite(f);
with datein do begin write(' Namen  : ');Readln(Name);
write(' Nummer : ');readln(nummer);end;write(f,datein);Close(f);END;



BEGIN
Assign(F,'E:\TYPE!.YES');



writeln;
writeln(' So goodbye !');
END.