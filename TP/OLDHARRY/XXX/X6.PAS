program x2;
uses crt;

var i:integer;   {integer: von -32768 bis +32768}
    s:string;    {zeichenkette}


begin
textmode(co80+font8x8);   { 50 zeichen-schrim}
textbackground(0);textcolor(7);
clrscr;


gotoxy(10,10);
write('Eingabe:');

textbackground(1);write('                     ');

textcolor(14);

gotoxy(18,10);readln(s);






{ readln(s2); ....}




end.