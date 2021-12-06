Program Copy2dsc;
Uses crt,dos;
Var           size,totalsize:real;
                       x,y,z:integer;
                     dirinfo:SearchRec;
                           f:file;
                         buf:array [1..4096] of char;
BEGIN
clrscr;

findfirst(paramstr(1),archive,dirinfo);


while DosError = 0 do
assign(f,dirinfo.name);reset(f,1);write('.');
  begin
    Writeln(DirInfo.Name);
    FindNext(DirInfo);
  end;
close(f);

delay(2000);
ENd.