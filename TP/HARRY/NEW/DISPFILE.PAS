Program DispFile;
Uses crt,dos;
Var                                     x,y,z,x1,y1:integer;
                                            numread:word;
                                                  r:real;
                                                  s:string;
                                                  f:file;
                                                buf:array [1..500] of byte;
                                                 ch:char;
const  abc=['a'..'z'];
      gabc=['A'..'Z'];
      eins=['0'..'9'];

BEGIN
assign(f,'director.dsp');reset(f,1);

 repeat
  blockread(f,buf,sizeof(buf),numRead);
   for x:=1 to numread do begin

   if chr(buf[x]) in abc  then textcolor(green);
   if chr(buf[x]) in gabc then textcolor(red);
   if chr(buf[x]) in eins then textcolor(white);

   write(chr(buf[x]));
   if keypressed then ch:=readkey;if ch=#27 then begin close(f);exit;end;

   end;
 until numread=0;


close(f);
writeln(^M^J,' Done. Press any key.');ch:=readkey;
end.