REM ARJ program to incrementally backup one drive to another drive
REM This program assumes that there is work space available on the hard drive
if "%1" == "" goto param_err
if "%2" == "" goto param_err
ARJ a -a1 -b1 -m3 -r -vvas -w%1:\ -ji%1:\backup.inx -js -jt %2:\backup %1:\
goto end
:param_err
REM Usage: ARJINCR hard_drive_letter diskette_drive_letter
REM        ARJINCR C A
:end
