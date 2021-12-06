echo off
cls
if %1! == ! goto Info
if not exist getfunc.com goto Fehler
if not exist %1.cfg goto Fehler

set q1=
set q2=
set z1=
set z2=
echo Die Versionsmeldung der zu konvertierenden CFG-Datei :
echo ------------------------------------------------------
type %1.cfg
echo ˇ
echo ------------------------------------------------------
echo ˇ
echo Welche ArcEdit-Version wird oben angezeigt ?
echo ˇ
echo F1  : Version 1.01
echo F2  : Version 1.2
echo F3  : Version 1.21
echo F4  : Version 1.22
echo F5  : Version 1.3
echo F6  : Version 1.31
echo F7  : Version 1.32
echo F8  : Version 1.33
echo F9  : Version 1.4
echo F10 : Version 1.41
echo ˇ
echo Falls die Versionsnummer nicht in der Liste enthalten ist, mÅssen Sie
echo die CT- und TC-Programme "manuell" aufrufen, siehe ARCEDIT.DOC !
echo ˇ
getfunc
if errorlevel 11 goto Ende
if errorlevel 10 goto Q_141
if errorlevel 9 goto Q_140
if errorlevel 8 goto Q_133
if errorlevel 7 goto Q_132
if errorlevel 6 goto Q_131
if errorlevel 5 goto Q_130
if errorlevel 4 goto Q_122
if errorlevel 3 goto Q_121
if errorlevel 2 goto Q_120
if errorlevel 1 goto Q_101
:Q_141
set q1=141
goto Weiter1
:Q_140
set q1=140
goto Weiter1
:Q_133
set q1=133
goto Weiter1
:Q_132
set q1=132
goto Weiter1
:Q_131
set q1=131
goto Weiter1
:Q_130
set q1=130
goto Weiter1
:Q_122
set q1=122
goto Weiter1
:Q_121
set q1=121
goto Weiter1
:Q_120
set q1=120
goto Weiter1
:Q_101
set q1=101
goto Weiter1

:Weiter1
cls
echo Shareware- oder Vollversion ?
echo ˇ
echo F1 : Sharewareversion (s)
echo F2 : Vollversion      (v)
echo ˇ
getfunc
if errorlevel 3 goto Ende
if errorlevel 2 goto v1
if errorlevel 1 goto s1
:V1
set q2=V
goto Weiter2
:S1
set q2=S

:Weiter2
if not exist CT%q1%%q2%.EXE goto Fehler
cls
echo FÅr welche ArcEdit-Version soll die CFG-Zieldatei angelegt werden ?
echo ˇ
echo F1  : Version 1.01
echo F2  : Version 1.2
echo F3  : Version 1.21
echo F4  : Version 1.22
echo F5  : Version 1.3
echo F6  : Version 1.31
echo F7  : Version 1.32
echo F8  : Version 1.33
echo F9  : Version 1.4
echo F10 : Version 1.41
echo ˇ
getfunc
if errorlevel 11 goto Ende
if errorlevel 10 goto Z_141
if errorlevel 9 goto Z_140
if errorlevel 8 goto Z_133
if errorlevel 7 goto Z_132
if errorlevel 6 goto Z_131
if errorlevel 5 goto Z_130
if errorlevel 4 goto Z_122
if errorlevel 3 goto Z_121
if errorlevel 2 goto Z_120
if errorlevel 1 goto Z_101
:Z_141
set z1=141
goto Weiter3
:Z_140
set z1=140
goto Weiter3
:Z_133
set z1=133
goto Weiter3
:Z_132
set z1=132
goto Weiter3
:Z_131
set z1=131
goto Weiter3
:Z_130
set z1=130
goto Weiter3
:Z_122
set z1=122
goto Weiter3
:Z_121
set z1=121
goto Weiter3
:Z_120
set z1=120
goto Weiter3
:Z_101
set z1=101
goto Weiter3

:Weiter3
cls
echo Shareware- oder Vollversion ?
echo ˇ
echo F1 : Sharewareversion (s)
echo F2 : Vollversion      (v)
echo ˇ
getfunc
if errorlevel 3 goto Ende
if errorlevel 2 goto v2
if errorlevel 1 goto s2
:V2
set z2=V
goto Weiter4
:S2
set z2=S

:Weiter4
if not exist TC%z1%%z2%.EXE goto Fehler
CT%q1%%q2% %1
if exist %1.alt del %1.alt
ren %1.cfg *.alt
TC%z1%%z2% %1
echo ˇ
echo ˇ
echo Zwischendatei %1.TXT lîschen ?
echo ˇ
echo F1 : Ja
echo F2 : Nein
echo ˇ
getfunc
if errorlevel 2 goto Weiter5
del %1.TXT
:Weiter5
goto Ende

:Info
echo CONVERT 1.41 (c) 1991 by A. Orth
echo ˇ
echo   Dieses Batchprogramm konvertiert eine Konfigurationsdatei des Programms 
echo ArcEdit bis einschlie·lich Version 1.41 von einem Format ins andere.
echo Voraussetzung ist, da· die zu konvertierende CFG-Datei sowie die benîtigten
echo Konvertierungsprogramme CT????.EXE und TC????.EXE von den ArcEdit-Original-
echo disketten im aktuellen Verzeichnis vorhanden sind. Mehr zur Konvertierung 
echo in ARCEDIT.DOC.
echo ˇ
echo   Die zu konvertierende CFG-Datei mu· als Kommandozeilenparameter Åbergeben
echo werden   : "convert <cfg-datei>"
echo Beispiel : "convert arcedit" konvertiert ARCEDIT.CFG.
goto Ende

:Fehler
cls
echo FEHLER
echo ˇ
echo Eine der folgenden Dateien ist nicht im aktuellen Verzeichnis vorhanden :
echo ˇ
if not exist %1.cfg echo   - die zu konvertierende Datei "%1.CFG".
if not exist getfunc.com echo   - das Programm GETFUNC.COM (von irgendeiner ArcEdit-Diskette).
if not %q2%! == ! echo   - das Programm CT%q1%%q2%.EXE  (von der Diskette der "Quellversion")
if not %z2%! == ! echo   - das Programm TC%z1%%z2%.EXE  (von der Diskette der "Zielversion")
echo ˇ
echo Kopieren Sie die fehlende(n) Datei(en) bitte ins aktuelle 
echo Verzeichnis und starten Sie CONVERT dann nochmal.

:Ende
echo ˇ
set q1=
set q2=
set z1=
set z2=

