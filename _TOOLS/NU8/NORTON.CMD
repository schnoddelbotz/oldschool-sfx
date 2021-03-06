!topic: DATENRETTUNG
^BDATENRETTUNG

Restauriert zerst�rte und besch�digte
Dateien.

Versehentlich formatierte Disks
werden reformatiert.

Sch�tzt Laufwerke gegen Datenverlust.

!command: Erase Protect
!dos-cmd: EP
^BErase Protect
EP [ZUS�TZE]

Sch�tzt "gel�schte" Dateien vor dem
sofortigen �berschreiben; assistiert
bei der Restaurierung gel�schter Daten.

^BZUS�TZE
/STATUS     Anzeige des Status von
            Erase Protect
/AN         Erase Protect aktivieren
/AUS        Erase Protect deaktivieren
/UNINSTALL  Erase Protect aus dem
            Speicher entfernen

!command: Diagnostics
!dos-cmd: NDIAGS
^BNorton Diagnostics
NDIAGS [PARAMETER]

Ermittelt Probleme mit der Hardware
Ihres Computers.

^BPARAMETER
/AUTO:^Bn^N     Auto-Modus, ^Bn^N Sek/Bildschirm
/BURNIN:^Bn^N   Wiederholt Tests ^Bn^N-mal 
/SPEC:^BDatei^N F�hrt Tests gem. Spezifik.
            ^BDatei^N aus
/REP:^BDatei^N  Gibt Ergebnisse an ^BDatei^N aus
/RESET      Setzt gespeicherte
            Einstellungen zur�ck

!command: Disk Doctor
!dos-cmd: NDD
^BNorton Disk Doctor
NDD [Laufw:][Laufw:]... [PARAMETER]

Entdeckt und korrigiert automatisch
physikalische und logische Disk-Fehler.

^BPARAMETER
/QUICK     Nur Systembereich testen
/COMPLETE  System-/Datenbereich testen
/R:^BDatei^N   Schreibt Bericht in ^BDatei
/RA:^BDatei^N  H�ngt Bericht an ^BDatei^N an
/X:^Bd^N       Laufw. von Test ausschlie�en

!command: Disk Editor
!dos-cmd: DE
^BDisk Editor
DE [Laufw:][Pfad][Datei]
         [PARAMETER]

Zeigt und editiert gesamten Inhalt einer
Platte, inkl. Laufwerke, die DOS nicht
lesen kann. Repariert oder rettet
besch�digte Dateien oder deren Inhalt.

^BPARAMETER
/M   Direktzugriff -- Wartungsmodus
     DOS-Bereich der Disk wird umgangen

!command: Disk Tools
!dos-cmd: DISKTOOL
^BDisk Tools
DISKTOOL

Vier Dienstprogramme, mit denen Disks
startf�hig gemacht, eine Reparatur nach
DOS RECOVER ausgef�hrt, defekte
Disketten wiederhergestellt und Cluster
als 'Bad' oder 'Good' markiert werden.

!command: File Fix
!dos-cmd: FILEFIX
^BFile Fix
FILEFIX [Dateiname]

Untersucht und repariert besch�digte
Lotus 1-2-3-, Symphony-, Excel-,
Quattro Pro-, dBASE- und
WordPerfect-Dateien.

Macht ZAP-Befehl f�r dBASE-Dateien
r�ckg�ngig.

!command: Image
!dos-cmd: IMAGE
^BImage
IMAGE [Laufw:][Laufw:]... [/NOBACK]

Erstellt Momentaufnahme der
wichtigsten Verwaltungsdaten einer Disk,
damit versehentlich formatierte Disks
wiederhergestellt werden k�nnen.

^BPARAMETER
/NOBACK �berschreibt aktuelle IMAGE.DAT-
        Datei (keine Sicherungskopie
        IMAGE.BAK)

!command: INI Tracker
!dos-cmd: INITRAKD
^BINI Tracker f�r DOS
INITRAKD [PARAMETER]

Erstellt Momentaufnahme der DOS- und
Windows-Systemdateien. Dateien k�nnen 
jetzt wiederhergestellt
werden (Konfiguration in Windows).

^BPARAMETER
/B         Manuelle Momentaufnahme 
/L:^Bdatei^N   Logbuchausgabe in Datei
/R:^Bn^N       Aufnahme n wiederherstellen
/S:^Bname^N    Momentaufnahme beim Booten

!command: Rescue Disk
!dos-cmd: RESCUE
^BRescue Disk
RESCUE [/CREATE | /RESTORE]
Erstellt eine Rettungsdiskette mit
wichtigen System-Daten Ihres Computers
f�r die Wiederherstellung von Daten,
wenn CMOS-Daten, Partitionstabellen
oder Startsektoren zerst�rt wurden.
Erstellen Sie eine Rettungsdiskette,
wenn Sie noch keine haben!
^BPARAMETER
/CREATE   Erstellt eine Rettungsdiskette
/RESTORE  Wiederherstellung von
          Rettungsdiskette

!command: SmartCan
!dos-cmd: SMARTCAN
^BSmartCan
SMARTCAN [PARAMETER]

Schutz vor versehentlichem L�schen von
Dateien. Stellt sicher, da� gel�schte
Daten wiederhergestellt werden k�nnen.

^BPARAMETER
/STATUS     Zeigt SmartCan-Status an
/EIN        Aktiviert SmartCan
/AUS        Leert SmartCan

!command: UnErase
!dos-cmd: UNERASE
^BUnErase
UNERASE [Datei]

Sucht und restauriert gel�schte
Dateien.

Autom. Wiederherstellung intakter
Dateien.

Mit dem manuellen Modus werden auch
Daten aus teilweise �berschriebenen oder
fragmentierten Dateien wiederherge-
stellt.

!command: UnFormat
!dos-cmd: UNFORMAT
^BUnFormat
UNFORMAT [Laufw:]
Macht die versehentliche Formatierung
einer mit Safe Format formatierten
Festplatte oder Diskette r�ckg�ngig
�� und somit die Daten wieder nutzbar.

Wurden die wichtigen Systemdaten mit 
Image gespeichert, ist eine nahezu
perfekte Wiederherstellung einer
Festplatte m�glich.
^BSollten Sie Image noch nicht auf Ihre
^BFestplatte angewendet haben, tun Sie's
^Bjetzt!

!topic: SICHERHEIT
              ^BSICHERHEIT

 * Sch�tzt Daten vor unbefugtem Zugriff
   oder unerlaubter Pr�fung.
 * Sch�tzt gegen Vireninfektion.

!command: Disk Monitor
!dos-cmd: DISKMON
^BDisk Monitor
DISKMON [PARAMETER]
L��t Schreibzugriffe nur mit Best�ti-
gung zu, zeigt Kennung des Laufwerks,
auf das gerade zugegriffen wird, an und
parkt die Schreib-/Lesek�pfe der
Festplatte.
^B PARAMETER
/STATUS    Zeigt Status�berblick
/PROTECT+  Aktiviert Schutzmechanismus
/LIGHT+    Aktiviert Laufwerkssignal 
/PARK      Parkt  Laufwerksk�pfe
/UNINSTALL Entfernt DISKMON aus dem
           Speicher

!command: Diskreet
!dos-cmd: DISKREET
^BDiskreet
DISKREET [PARAMETER]

Dateiverschl�sselung und Kennwortschutz.
Erstellt kennwortgesch�tzte "virtuelle"
Laufwerke (NDisks), auf denen alle Daten
verschl�sselt sind.
^BPARAMETER
/ENCRYPT:^BDatei^N   Verschl�sselt
                 angegebene Datei
/DECRYPT:^BDatei^N   Entschl�sselt
                 angegebene Datei
/PASSWORD:^Bxxxxxx^N Kennwort setzen ^Bxxxxxx
/STATUS          NDisk-Status anzeigen

!command: WipeInfo
!dos-cmd: WIPEINFO
^BWipeInfo
WIPEINFO [Laufw:] [PARAMETER]
WIPEINFO [Dateiname] [PARAMETER]
�berschreibt Dateien, ganze Laufwerke
oder gel�schte Daten, so da� sie
keinesfalls wiederhergestellt werden
k�nnen �� nicht einmal durch die
Norton Utilities.
^B PARAMETER
/E �berschreibt gel�schte/freie Bereiche
/N DOS-L�schmethode, kein �berschreiben
/K Ungenutzten Bereich am Dateiende
   �berschreiben

!topic: LEISTUNG
                ^BLEISTUNG

 * Steigert die Leistung und
   Geschwindigkeit Ihres Computers
 * Optimiert Ihre Festplatten f�r
   schnelleren Datenzugriff und
   gr��ere Sicherheit.

!command: Calibrate
!dos-cmd: CALIBRAT
^BCalibrate
CALIBRAT [Laufw:] [PARAMETER]

Optimiert die Geschwindigkeit und
Sicherheit des Datentransfers von
und auf die Festplatte.
^B PARAMETER
/BATCH       Keine Benutzerabfrage,
             bei Ende zur�ck zu DOS
/NOSEEK      Keine Zugriffstests
/NOFORMAT    Nur Mustertests, keine
             Formatierung
/X:^BLaufwerke^N Angegebene Laufwerke nicht
             testen

!command: Norton Cache
!dos-cmd: NCACHE2 /STATUS
^BNorton Cache
NCACHE2 [PARAMETER]

H�lt h�ufig benutzte Daten im Arbeits-
speicher bereit, so da� schneller
darauf zugegriffen werden kann.
Au�erdem werden Daten gepuffert, d. h. 
Speichern auf Festplatte l�uft im
Hintergrund ab.
Weitere Angaben dazu finden Sie im
Benutzerhandbuch.

^B�� ^NNCACHE2 ist ein
    Befehlszeilendienstprogramm.

!command: Speed Disk
!dos-cmd: SD
^BSpeed Disk
SD [Laufw:] [PARAMETER]

Optimiert die Festplatte durch
Reorganisation der Dateistrukturen
und Verzeichnisse darauf. Freie 
Bereiche werden zusammengefa�t
und Dateien defragmentiert.

^B PARAMETER
/F  Optimiere ganzes Laufwerk
/Q  Freie Bereiche zusammenfassen
/U  Nur Dateien defragmentieren
/B  Neustart nach Optimierung

!topic: WERKZEUGE
               ^BWERKZEUGE

Programme, die die Arbeit am Computer
erleichtern. Sie k�nnen:

 * Bildschirm und Tastatur steuern
 * Zeitgeber stellen
 * Dateien suchen
 * Verzeichnisse schnell wechseln
 * Disketten problemlos formatieren
 * Informationen zu Ihrem Computer-
   system abrufen
 * Und vieles mehr...

!command: Batch Enhancer
!dos-cmd: BE /?
^BBatch Enhancer
BE Unterbefehl(e)

Erlaubt Ihnen, mit Stapeldateien
Vorg�nge automatisch zu starten, die
in Echtzeit gesteuert werden k�nnen.


Sie k�nnen Demo- und
Registrierbildschirme erstellen.



^B��^N Einsatz in Stapeldateien.

!command: Configuration
!dos-cmd: NUCONFIG
^BNorton Utilities Configuration
NUCONFIG [/BW]

Erm�glicht die Einstellung der Optionen
f�r die Norton Utilities.

Installation oder Entfernen von
Ger�tetreibern und Programmen, die beim
Systemstart gestartet werden.



^BPARAMETER
/BW  Schwarzwei�bildschirm

!command: Control Center
!dos-cmd: NCC
^BNorton Control Center
NCC [Pfadname] [PARAMETER]

Kontrolliert Hardware-Einstellungen.
Cursorgr��e, DOS-Farben, Farbpaletten,
Bildschirmmodus, Tastatureinstellungen
und Mausgeschwindigkeit werden
mit diesem Programm eingestellt.
^B PARAMETER
/SET   ^B  ^NSetzt in ^BPfadname^N 
         gespeicherte Optionen
/CO80  ^B  ^NSetzt Anzeige auf 25x80 Farbe
/50    ^B  ^NSetzt Anzeige auf 50 Zeilen/VGA
/START:^Bn^N Startet Uhr Nummer ^Bn

!command: Directory Sort
!dos-cmd: DS
^BDirectory Sort
DS [Pfad]
DS Sortierschl�ssel [Pfad] [/S]

Sortiert Verzeichnisse f�r bessere
�bersicht.
^BSORT KEYS
N   Name          Anh�ngen eines Minus-
D   Datum         zeichens kehrt die
E   Erweiterung   Sortierfolge um.
G   Gr��e
Z   Zeit
^BPARAMETER
/S  Sortiert auch Unterverzeichnisse

!command: Duplicate Disk
!dos-cmd: DD
^BDuplicate Disk
DD [Ursprungslw: [Ziel-Lw.:]]

Schnelles Kopieren von Disketten.

Liest auch gro�e Disketten in einem
Zuge ein und erm�glicht das Anlegen
mehrerer Kopien einer Diskette ohne
erneutes Einlesen.

!command: File Attributes
!dos-cmd: FA
^BFile Attributes
FA [Dateiname] [PARAMETER]

Anzeige der Dateien nach Datei-
attributen, �nderung der Attribute
von Dateien und Verzeichnissen.
^B PARAMETER
/A    Archiv        ^B+^N oder ^B-^N nach dem
/R    Nur-Lesen     Parameter setzt oder
/HID  Versteckt     entfernt Attribut.
/SYS  System

^B�� ^NFA ist ein
    Befehlszeilendienstprogramm.

!command: File Date
!dos-cmd: FD
^BFile Date
FD Dateiname [PARAMETER]
�ndert Datums- und Zeitangabe einer
Datei.
^BPARAMETER
/D:^BDatum^N Setzt das Datum auf TT-MM-JJ
/Z:^BZeit^N  Setzt die Zeit auf SS:MM:SS
/S       Inklusive Unterverzeichnisse

Ohne /D und /Z versieht FD die Datei mit
dem aktuellen Datum und der aktuellen
Zeit.
^B��^N FD ist ein
    Befehlszeilendienstprogramm.

!command: File Find
!dos-cmd: FF
^BFile Find
FF [Universalz.][Text][PARAMETER]

Findet "verlegte" Dateien, indem es
nach deren Namen und Daten in allen
Laufwerken (auch Netzwerklaufwerken)
und Verzeichnissen sucht. Auch Datei-
attribute k�nnen ge�ndert werden.

^BPARAMETER
/S      Inkl. Dateien in Unterverz.
/CS     Gro�-/Kleinschreibung beachten
/CLEAR  Entferne alle Dateiattribute
/NOW    Aktuelles Datum/Uhrzeit setzen

!command: File Locate
!dos-cmd: FL
^BFile Locate
FL [Laufw:] [Dateiname] [PARAMETER]
Auffinden einer Datei. FL ohne Parameter
erstellt eine Liste aller Dateien
auf dem Vorgabelaufwerk.
^B PARAMETER
/A      Alle Laufwerke durchsuchen
/P      Pause nach jedem Bildschirm
/W      Breites Listenformat
/T      Suche nur in PATH
/F[^Bn^N]   Finde die ersten ^Bn^N Dateien
        (Vorgabe=1)
^B��^N FL ist ein
    Befehlszeilendienstprogramm.

!command: File Size
!dos-cmd: FS
^BFile Size
FS [Pfadname] [Ziel-Lw:] [PARAMETER]
Anzeige der Gr��e von Dateien und
Verzeichnissen. �berpr�ft, ob eine
angegebene Gruppe von Dateien auf
dem Ziellaufwerk Platz findet.

^BPARAMETER
Ziel-Lw: Test des freien Speichers
/P       Pause nach jedem Bildschirm
/S       Inklusive Unterverzeichnisse
/T       Anzeige von Gesamtwerten
^B��^N FS ist ein
    Befehlszeilendienstprogramm.

!command: Line Print
!dos-cmd: LP
^BLine Print
LP Dateiname [Ausgabe] [PARAMETER]
Ausgabe von Textdateien an Drucker oder
in Datei.
^BPARAMETER
/CONFIG:^BName^N     Druckerkonfiguration
                 (erstellt mit NUCONFIG)
/T^Bn^N /B^Bn^N /L^Bn^N /R^Bn^N  R�nder
/W^Bn^N /HI^Bn^N         Seitenbreite/-h�he
/HEADER^Bn^N         Kopfzeilentyp (1,2,3)
/PR:la           HP LaserJet-Format
/PR:po           PostScript-Format
^B��^N LP ist ein
    Befehlszeilendienstprogramm.

!command: Norton CD
!dos-cmd: NCD
^BNorton Change Directory
NCD [Verzeichnisname] [PARAMETER]

Verwaltet die Verzeichnisstruktur
einer Festplatte, unabh�ngig von deren
Umfang. Benennt Verzeichnisse um, ver-
schiebt, kopiert und l�scht sie.

Wechselt mit wenigen Tastenanschl�gen
direkt in jedes beliebige Verzeichnis.

^BPARAMETER
/R  Verzeichnis neu einlesen
/N  TREEINFO.NCD nicht aktualisieren

!command: Safe Format
!dos-cmd: SF
^BSafe Format
SF [Laufw:] [PARAMETER]

Sichere Art der Disk-Formatierung. Daten
werden nicht �berschrieben und sind
somit zu retten, wenn die Disk
versehentlich formatiert wird.

^B PARAMETER
/F:^BGr��e^N   Gibt Gr��e an (360, 720,etc.)
/Q         Quick-Format
/S         Kopiert DOS-Systemdateien
/V:^BKennung^N Setzt Datentr�gerbezeichnung

!command: System Info
!dos-cmd: SI
^BSystem Information
SI [PARAMETER]

Informiert �ber alle Komponenten Ihres
Systems: Hardware, Speicher, Netzwerke,
Laufwerke, TSRs, Ger�tetreiber usw.
Schlie�t Benchmarks- und Leistungs-
tests ein.

^B PARAMETER
/AUTO:^Bn^N     Autom. Modus, ^Bn^N Sek/Bericht
/SPEC:^BDatei^N Bericht gem�� ^BDatei
/REP:^BDatei^N  Gibt Bericht an ^BDatei ^Naus
/TSR        Zeigt nur aktive TSRs an

!command: Text Search
!dos-cmd: TS
^BText Search
TS [Pfadname[Text]] [/S][/T] [PARAMETER]
TS [Laufw:[Text]] /D|/E [/Cn][PARAMETER]
Sucht nach Text in Dateien, auf
Laufwerken oder in gel�schtem
Datenbereich.
^BPARAMETER
/S    Inklusive Unterverzeichnisse
/T    Nur Dateinamen auflisten
/D    Suche auf gesamten Laufwerk
/E    Suche in gel�schtem Datenbereich
/C^Bn   ^NStart der Suche bei Cluster ^Bn
^B�� ^NTS ist ein
    Befehlszeilendienstprogramm.
