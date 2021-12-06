REM ARJ program to fully backup a drive to another drive
REM This program assumes that there is work space available on the hard drive
if "%1" == "" goto param_err
if "%2" == "" goto param_err
ARJ a -a1 -b2 -m3 -r -vvas -w%1:\ -ji%1:\backup.inx -js -jt %2:\backup %1:\
goto end
:param_err
REM Usage: ARJBACK hard_drive_letter diskette_drive_letter
REM        ARJBACK C A
:end
