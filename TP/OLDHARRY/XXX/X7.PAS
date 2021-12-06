program x2;
uses crt,dos;

var i:integer;   {integer: von -32768 bis +32768}
    s:string;    {zeichenkette}
    t:char;      {1 zeichen}


begin
textmode(co80+font8x8);   { 50 zeichen-schrim}
textbackground(0);textcolor(7);
clrscr;


gotoxy(10,10);
write('Eingabe:');

textbackground(1);write('                     ');

textcolor(14);

gotoxy(18,10);readln(s);




{readln(t);}    { 1 zeichen + return }

t:=readkey;     { 1 zeichen ohne return}

{
exec('\comand.com','copy *.* '+t+'\'+s);
 }




{ readln(s2); ....}




end.