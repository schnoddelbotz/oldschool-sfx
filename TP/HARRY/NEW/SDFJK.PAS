Program D2Health;
Uses crt,hexe;
const
           abc:array[0..16] of byte = (48,49,50,51,52,53,54,55,56,57,97,98,99,100,101,102,32);
Var x,y,y2,z,posi,i,forx,in1,in2,cnt:integer;
       a,b,sim:byte;
  ch,sim1,sim2:char;
             c:array [1..2] of byte;
           www:array [1..2] of byte;
             f,f2:file;
         isnow:array [1..4] of byte;
             d,really,yeah,yeah1,yeah2,decc:real;
          s,s2:string;

          max_exist:integer;
          block:array [1..62000] of char;
          result:word;

{for nice-proggy only:}
     xn,yn,zn:integer;


procedure hex(sim:byte);                    {** DEC -> HEX }
begin a:=trunc(sim/16);b:=sim-a shl 4 end;

procedure deci(sim1,sim2:char);             {** HEX -> DEC }
var q:byte; begin q:=0;while sim1<>chr(abc[q]) do inc(q);by:=q shl 4;
                  q:=0;while sim2<>chr(abc[q]) do inc(q);inc (by,q) end;

begin
end.