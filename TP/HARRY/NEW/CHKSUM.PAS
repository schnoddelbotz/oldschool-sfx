Program Checksum;

var cs:real;
     f:file;
     numread:word;
     y:integer;
     x:longint;
     buf:array[1..64000] of char;
     ch:char;
     wx,wy:integer;
BEGIN

if length(paramstr(1))<1 then exit;
assign(f,paramstr(1));reset(f,1);
write('  Reading file ... ');


 repeat


  if y=0 then write(#8,'*');
  if y=1 then write(#8,'+');
  inc(y);if y>1 then y:=0;

  blockread(f,buf,sizeof(buf),numread);


   for x:=1 to numread do begin
    cs:=cs+ord(buf[x]);
   end;


 until numread=0;



writeln(^M^J,'  Checksum: ',cs:10:0);
END.