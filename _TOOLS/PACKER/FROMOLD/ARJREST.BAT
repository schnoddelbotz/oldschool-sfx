REM ARJ program to restore archives on a drive to another drive overwriting
if "%1" == "" goto param_err
if "%2" == "" goto param_err
ARJ x -vv -y %1:backup %2:\
goto end
:param_err
REM Usage: ARJREST diskette_drive_letter hard_drive_letter
REM        ARJREST A C
:end
