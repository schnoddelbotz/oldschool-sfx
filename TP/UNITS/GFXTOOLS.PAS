Unit GFXTools;
interface
uses crt;
var   feld:array[1..4000] of byte;
         x:INTEGER;
        bf:text;
Procedure BackupWin;
Procedure RestoreWin;
Implementation


Procedure BackupWin;BEGIN
move(ptr(800,0)^,feld,4000);
End;

Procedure RestoreWin; BEGIN
move(feld,ptr(800,0)^,4000);
END;



BEGIN
END.
