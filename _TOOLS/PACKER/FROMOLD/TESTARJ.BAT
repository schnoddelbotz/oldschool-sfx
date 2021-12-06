REM TESTARJ.BAT, ARJ, 03/08/93
echo off
echo  .
echo  TESTARJ.BAT - batch file to test the reliability of ARJ
echo  .
echo  This is a batch file to test the reliability of ARJ compressing
echo  and decompressing all of your files.  This test will take a LONG
echo  TIME (HOURS, MAYBE DAYS) and will process all of the files on your
echo  C drive in six phases.  You can interrupt or shorten any test
echo  phase by pressing CTL BREAK.  You can also shorten this test by
echo  editing this batch file and deleting the lines with -m2, -m3, and
echo  -m4.  This test will create files named TESTVOL$.### and then
echo  delete them.  If the test proceeds to its end successfully, you
echo  will know that ARJ is compatible with your computer and its files.
echo  .
echo  COMMAND SYNTAX:  testarj execute
echo  .
if NOT "%1" == "execute" goto end

echo on
ARJ a testvol$.000 c:\*.* -i1 -m0 -r "-v360sdel testvol$.*" -xtestvol$.* -y -jf -jitestarj.inx -jt1 -jv
if errorlevel 1 pause
ARJ a testvol$.000 c:\*.* -i1 -jm -r "-v360sdel testvol$.*" -xtestvol$.* -y -jf -jitestarj.inx -jt1 -jv
if errorlevel 1 pause
ARJ a testvol$.000 c:\*.* -i1 -m1 -r "-v360sdel testvol$.*" -xtestvol$.* -y -jf -jitestarj.inx -jt1 -jv
if errorlevel 1 pause
ARJ a testvol$.000 c:\*.* -i1 -m2 -r "-v360sdel testvol$.*" -xtestvol$.* -y -jf -jitestarj.inx -jt1 -jv
if errorlevel 1 pause
ARJ a testvol$.000 c:\*.* -i1 -m3 -r "-v360sdel testvol$.*" -xtestvol$.* -y -jf -jitestarj.inx -jt1 -jv
if errorlevel 1 pause
ARJ a testvol$.000 c:\*.* -i1 -m4 -r "-v360sdel testvol$.*" -xtestvol$.* -y -jf -jitestarj.inx -jt1 -jv
if errorlevel 1 pause
del testvol.*
REM end of test
:end
