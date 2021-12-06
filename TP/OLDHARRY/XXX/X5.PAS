program x2;
uses crt;

var i:integer;   {integer: von -32768 bis +32768}
    s:string;    {zeichenkette}


begin
textmode(co80+font8x8);   { 50 zeichen-schrim}
clrscr;

write('Eingabe:');
readln(s);
{ readln(s2); ....}





for i:=1 to 10 do
    begin

    gotoxy(i,i);
    writeln(i,'. mal ',s);

    end;

end.