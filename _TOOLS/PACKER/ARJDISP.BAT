REM ARJDISP.BAT
REM Batch file to demonstrate special ARJ display feature
echo off
echo ARJDISP demonstration batch program

if not exist ARJ250.EXE goto error
if not exist ARJ.EXE goto error
if not exist ARJ$DISP.EXE goto error

arj$disp test
goto end
:error
echo To run this program, the files ARJ.EXE, ARJ$DISP.EXE, and ARJ250.EXE
echo should all be in this directory.  This program will not write to any files.
:end
