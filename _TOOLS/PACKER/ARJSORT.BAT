@echo off

echo ARJSORT 2.21, ARJ file sorting tool, Copyright (c) 1990,91 Robert K. Jung
echo .

if "%1"=="" goto param_error

if "%2"=="" goto sort_start
if %2==/A goto sort_start
if %2==/a goto sort_start
if %2==/C goto sort_start
if %2==/c goto sort_start
if %2==/D goto sort_start
if %2==/d goto sort_start
if %2==/E goto sort_start
if %2==/e goto sort_start
if %2==/F goto sort_start
if %2==/f goto sort_start
if %2==/O goto sort_start
if %2==/o goto sort_start
if %2==/P goto sort_start
if %2==/p goto sort_start
if %2==/R goto sort_start
if %2==/r goto sort_start
if %2==/S goto sort_start
if %2==/s goto sort_start
if %2==/T goto sort_start
if %2==/t goto sort_start
goto param_error

:sort_start
echo Getting current order of archive: %1
arj v %1 -jv1 -jp- > arjsort.$$1
if errorlevel 1 goto arj_error

if "%2"=="" goto sort_path
if %2==/A goto sort_attr
if %2==/a goto sort_attr
if %2==/C goto sort_crc
if %2==/c goto sort_crc
if %2==/D goto sort_date
if %2==/d goto sort_date
if %2==/E goto sort_ext
if %2==/e goto sort_ext
if %2==/F goto sort_file
if %2==/f goto sort_file
if %2==/O goto sort_ratio
if %2==/o goto sort_ratio
if %2==/P goto sort_path
if %2==/p goto sort_path
if %2==/R goto r_sort_path
if %2==/r goto r_sort_path
if %2==/S goto sort_size
if %2==/s goto sort_size
if %2==/T goto sort_time
if %2==/t goto sort_time
goto param_error

:sort_path
echo Sorting by pathname
echo .
SORT /+122 %3 < arjsort.$$1 > arjsort.$$$
goto sort_finish

:r_sort_path
echo Sorting by pathname
echo .
SORT /+122 %2 < arjsort.$$1 > arjsort.$$$
goto sort_finish

:sort_attr
echo Sorting by attribute
echo .
SORT /+69  %3 < arjsort.$$1 > arjsort.$$$
goto sort_finish

:sort_crc
echo Sorting by CRC
echo .
SORT /+60  %3 < arjsort.$$1 > arjsort.$$$
goto sort_finish

:sort_date
echo Sorting by date/time modified
echo .
SORT /+41  %3 < arjsort.$$1 > arjsort.$$$
goto sort_finish

:sort_ext
echo Sorting by file extension
echo .
SORT /+81  %3 < arjsort.$$1 > arjsort.$$$
goto sort_finish

:sort_file
echo Sorting by filename
echo .
SORT /+89  %3 < arjsort.$$1 > arjsort.$$$
goto sort_finish

:sort_ratio
echo Sorting by compression ratio
echo .
SORT /+36  %3 < arjsort.$$1 > arjsort.$$$
goto sort_finish

:sort_size
echo Sorting by original file size
echo .
SORT /+14  %3 < arjsort.$$1 > arjsort.$$$
goto sort_finish

:sort_time
echo Sorting by time modified
echo .
SORT /+51  %3 < arjsort.$$1 > arjsort.$$$
goto sort_finish

:sort_finish
if errorlevel 1 goto sort_error

arj o %1 -!! -jp- !arjsort.$$$
if errorlevel 1 goto arj_error
goto stop

:arj_error
echo ARJ error processing %1
goto stop

:sort_error
echo Sort error processing %1
goto stop

:param_error
echo . Usage:  ARJSORT archive [/order] [/r]
echo .	       Where /order is one of the following:
echo .
echo .		     /a = attribute	  /o = ratio
echo .		     /c = crc		  /p = pathname
echo .		     /d = date/time	  /s = size
echo .		     /e = extension	  /t = time
echo .		     /f = filename
echo .
echo .	       [/r]everse, if specified, must be the last option.

:stop
if exist arjsort.$$1 del arjsort.$$1 > NUL
if exist arjsort.$$$ del arjsort.$$$ > NUL
if exist arjsort.bak del arjsort.bak > NUL
