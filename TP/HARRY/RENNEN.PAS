Program Rennen;
Const Wagenanzahl=12;
Type SortArray=Array[1..Wagenanzahl] of byte;
     Kart= Record
            Runde:Byte;
            Zeit:Longint;
           end;
     KartArray=Array[1..Wagenanzahl+1] of Kart;
var Gokart:KartArray;
    Index:SortArray;
    i:byte;

Procedure Reihenfolge(Karts:KartArray; var List:SortArray);
var Nummer,n,z:Byte;
    Eingetragen:Array[1..Wagenanzahl] of Boolean;
begin
  Karts[Wagenanzahl+1].Runde:=255;
  Karts[Wagenanzahl+1].Zeit:=$ffffffff; {Eintrag in das Array mit den
                                         groesstmoeglichen Werten}
     for Nummer:=1 to Wagenanzahl do
     begin
      Eingetragen[Nummer]:=False;
      List[Nummer]:=0;
     end;
     z:=13;
     for Nummer:=Wagenanzahl Downto 1 do
      If GoKart[Nummer].Zeit=0 then
        begin
         Dec(z);
         List[z]:=Nummer;
         Eingetragen[Nummer]:=True;
        end;
 for Nummer:=1 to Wagenanzahl do
  begin
   z:=Wagenanzahl+1;
   for n:=1 to Wagenanzahl do
    if (n<>Nummer) and not Eingetragen[n] and
       ((Karts[n].Runde<Karts[z].Runde) or
        ((Karts[n].Runde=Karts[z].Runde) and
         (Karts[n].Zeit<Karts[z].Zeit)))
         then z:=n;

   if z<Wagenanzahl+1 then begin
                            Eingetragen[z]:=true;
                            Index[Nummer]:=z;
                           end;
  end;
end;

begin
 randomize;
 Gokart[1].Zeit:=0;
 GoKart[1].Runde:=0;
 for I:=2 to 12 do
  begin
   Gokart[i].Runde:=random(5)+1;
   Gokart[i].Zeit:=random(10000)+1;
  end;
 Reihenfolge(GoKart,Index);
 for i:=1 to Wagenanzahl do
   writeln(Index[i]:2,'   ',Gokart[Index[i]].Runde,'     ',Gokart[Index[i]].Zeit:5);
end.