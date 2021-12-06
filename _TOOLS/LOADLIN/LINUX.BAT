@echo off
if "%1"=="" goto usage
goto goon
:usage
echo Aufruf:
echo   linux xxx
echo oder (wenn Sie eine UMSDOS-Partition booten m”chten)
echo   linux xxx umsdos
echo wobei xxx der Linux-Device-Name der Root-Partition ist.
echo Beispiel:  linux hda1 umsdos
goto ende
:goon
set RWRD=ro
if "%2"=="" goto goon2
set RWRD=rw
:goon2
C:\tools\loadlin\loadlinX @C:\tools\loadlin\linux.par root=/dev/%1 %RWRD%
:ende
