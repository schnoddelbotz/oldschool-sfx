Program Testwinshadow;
uses crt,dos,views;
function WinOpenShadow(x1,y1,x2,y2:byte):integer;
var Handle:integer;

begin
 Handle := Winopen(x1,y1,x2 + Shadowx,y2+Shadowy);
 if (Handle <> WinOpenError ) then
  begin
   AktWinPtr^.Attribut := Win_schatten;
   WinSetview(x1,y1,x2,y2));
   Winshadow(x2+1,y1+1,x2+shadowx,y2+shadowy,vptr(ptr(VioSeg,0)) );
   Winshadow(x1+shadowx,y2+1,x2,y2+shadowy,vptr(ptr(VioSeg,0)) );
  end;

 winopenshadow:=handle;
end;

