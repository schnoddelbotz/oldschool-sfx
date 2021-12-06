Program Jannni;
Uses crt,jantools;
Var x,y,z:integer;
        a:string;
       ch:char;
BEGIN
textmode(font8x8+3);
ucls(9,0);
sinfowin('      ... Pitraky Paint Deluxe ...     Ein Praogramm, das komplett aus KÑse   und frischer'
+' Kuhmilch hergestellt wurdeDie  Kuhmilch  wurde  nicht  kastriert,sondern schonend gebraten bei -18 Grad Celsius.'
+' Vielen Dank, Jan Hagga',7);

window(1,1,80,50);
gotoxy(58,25);slowdisprl(' This program is *S*H*A*R*E*W*A*R*E* ',5,1,5);
gotoxy(22,25);slowdisplr(' This program is *S*H*A*R*E*W*A*R*E* ',5,2,5);
gotoxy(58,25);slowdisprl(' This program is *S*H*A*R*E*W*A*R*E* ',5,3,5);
gotoxy(22,25);slowdisplr(' This program is *S*H*A*R*E*W*A*R*E* ',5+blink,7,7);
ch:=readkey;
END.{write(#8)=eins zurÅck}