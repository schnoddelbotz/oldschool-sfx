program x2;
uses crt;

var i:integer;   {integer: von -32768 bis +32768}


begin
textmode(co80+font8x8);   { 50 zeichen-schrim}
clrscr;




for i:=1 to 10 do writeln(i,'. mal Hallo ');


textmode(co80);clrscr;  {normalbildschirm}

end.