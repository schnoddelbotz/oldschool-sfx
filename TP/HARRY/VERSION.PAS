Program Windowsprgis;
uses windos,crt;
var ver:word;
BEGIN
clrscr;
ver:=dosversion;
write(' This is Dosversion ',lo(ver),'.',hi(ver));
delay(2000);
END.