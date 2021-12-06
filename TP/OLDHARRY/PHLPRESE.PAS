Program DrawHeart;
Uses Crt,Graph;
Var grd,grm,x,y,max,z,a:integer;
                     ch:char;
                     pathtodrv:string;
BEGIN;
{write('Pfad zum Treiber EGAVGA.BGI eingeben:');readln(pathtodrv);}
clrscr;
detectgraph(grd,grm);
initgraph(grd,grm,'c:\tp\bgi\'{pathtodrv});
settextstyle(defaultfont,horizdir,250);moveto(10,43);outtext('PHL');
moveto(10,300);settextstyle(defaultfont,horizdir,6);outtext('  proudly');
moveto(10,360);settextstyle(defaultfont,horizdir,6);outtext('  presents...');
ch:=readkey;
END.