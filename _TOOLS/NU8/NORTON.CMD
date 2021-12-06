!topic: DATENRETTUNG
^BDATENRETTUNG

Restauriert zerstîrte und beschÑdigte
Dateien.

Versehentlich formatierte Disks
werden reformatiert.

SchÅtzt Laufwerke gegen Datenverlust.

!command: Erase Protect
!dos-cmd: EP
^BErase Protect
EP [ZUSéTZE]

SchÅtzt "gelîschte" Dateien vor dem
sofortigen öberschreiben; assistiert
bei der Restaurierung gelîschter Daten.

^BZUSéTZE
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
/SPEC:^BDatei^N FÅhrt Tests gem. Spezifik.
            ^BDatei^N aus
/REP:^BDatei^N  Gibt Ergebnisse an ^BDatei^N aus
/RESET      Setzt gespeicherte
            Einstellungen zurÅck

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
/RA:^BDatei^N  HÑngt Bericht an ^BDatei^N an
/X:^Bd^N       Laufw. von Test ausschlie·en

!command: Disk Editor
!dos-cmd: DE
^BDisk Editor
DE [Laufw:][Pfad][Datei]
         [PARAMETER]

Zeigt und editiert gesamten Inhalt einer
Platte, inkl. Laufwerke, die DOS nicht
lesen kann. Repariert oder rettet
beschÑdigte Dateien oder deren Inhalt.

^BPARAMETER
/M   Direktzugriff -- Wartungsmodus
     DOS-Bereich der Disk wird umgangen

!command: Disk Tools
!dos-cmd: DISKTOOL
^BDisk Tools
DISKTOOL

Vier Dienstprogramme, mit denen Disks
startfÑhig gemacht, eine Reparatur nach
DOS RECOVER ausgefÅhrt, defekte
Disketten wiederhergestellt und Cluster
als 'Bad' oder 'Good' markiert werden.

!command: File Fix
!dos-cmd: FILEFIX
^BFile Fix
FILEFIX [Dateiname]

Untersucht und repariert beschÑdigte
Lotus 1-2-3-, Symphony-, Excel-,
Quattro Pro-, dBASE- und
WordPerfect-Dateien.

Macht ZAP-Befehl fÅr dBASE-Dateien
rÅckgÑngig.

!command: Image
!dos-cmd: IMAGE
^BImage
IMAGE [Laufw:][Laufw:]... [/NOBACK]

Erstellt Momentaufnahme der
wichtigsten Verwaltungsdaten einer Disk,
damit versehentlich formatierte Disks
wiederhergestellt werden kînnen.

^BPARAMETER
/NOBACK öberschreibt aktuelle IMAGE.DAT-
        Datei (keine Sicherungskopie
        IMAGE.BAK)

!command: INI Tracker
!dos-cmd: INITRAKD
^BINI Tracker fÅr DOS
INITRAKD [PARAMETER]

Erstellt Momentaufnahme der DOS- und
Windows-Systemdateien. Dateien kînnen 
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
fÅr die Wiederherstellung von Daten,
wenn CMOS-Daten, Partitionstabellen
oder Startsektoren zerstîrt wurden.
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

Schutz vor versehentlichem Lîschen von
Dateien. Stellt sicher, da· gelîschte
Daten wiederhergestellt werden kînnen.

^BPARAMETER
/STATUS     Zeigt SmartCan-Status an
/EIN        Aktiviert SmartCan
/AUS        Leert SmartCan

!command: UnErase
!dos-cmd: UNERASE
^BUnErase
UNERASE [Datei]

Sucht und restauriert gelîschte
Dateien.

Autom. Wiederherstellung intakter
Dateien.

Mit dem manuellen Modus werden auch
Daten aus teilweise Åberschriebenen oder
fragmentierten Dateien wiederherge-
stellt.

!command: UnFormat
!dos-cmd: UNFORMAT
^BUnFormat
UNFORMAT [Laufw:]
Macht die versehentliche Formatierung
einer mit Safe Format formatierten
Festplatte oder Diskette rÅckgÑngig
ƒƒ und somit die Daten wieder nutzbar.

Wurden die wichtigen Systemdaten mit 
Image gespeichert, ist eine nahezu
perfekte Wiederherstellung einer
Festplatte mîglich.
^BSollten Sie Image noch nicht auf Ihre
^BFestplatte angewendet haben, tun Sie's
^Bjetzt!

!topic: SICHERHEIT
              ^BSICHERHEIT

 * SchÅtzt Daten vor unbefugtem Zugriff
   oder unerlaubter PrÅfung.
 * SchÅtzt gegen Vireninfektion.

!command: Disk Monitor
!dos-cmd: DISKMON
^BDisk Monitor
DISKMON [PARAMETER]
LÑ·t Schreibzugriffe nur mit BestÑti-
gung zu, zeigt Kennung des Laufwerks,
auf das gerade zugegriffen wird, an und
parkt die Schreib-/Lesekîpfe der
Festplatte.
^B PARAMETER
/STATUS    Zeigt StatusÅberblick
/PROTECT+  Aktiviert Schutzmechanismus
/LIGHT+    Aktiviert Laufwerkssignal 
/PARK      Parkt  Laufwerkskîpfe
/UNINSTALL Entfernt DISKMON aus dem
           Speicher

!command: Diskreet
!dos-cmd: DISKREET
^BDiskreet
DISKREET [PARAMETER]

DateiverschlÅsselung und Kennwortschutz.
Erstellt kennwortgeschÅtzte "virtuelle"
Laufwerke (NDisks), auf denen alle Daten
verschlÅsselt sind.
^BPARAMETER
/ENCRYPT:^BDatei^N   VerschlÅsselt
                 angegebene Datei
/DECRYPT:^BDatei^N   EntschlÅsselt
                 angegebene Datei
/PASSWORD:^Bxxxxxx^N Kennwort setzen ^Bxxxxxx
/STATUS          NDisk-Status anzeigen

!command: WipeInfo
!dos-cmd: WIPEINFO
^BWipeInfo
WIPEINFO [Laufw:] [PARAMETER]
WIPEINFO [Dateiname] [PARAMETER]
öberschreibt Dateien, ganze Laufwerke
oder gelîschte Daten, so da· sie
keinesfalls wiederhergestellt werden
kînnen ƒƒ nicht einmal durch die
Norton Utilities.
^B PARAMETER
/E öberschreibt gelîschte/freie Bereiche
/N DOS-Lîschmethode, kein öberschreiben
/K Ungenutzten Bereich am Dateiende
   Åberschreiben

!topic: LEISTUNG
                ^BLEISTUNG

 * Steigert die Leistung und
   Geschwindigkeit Ihres Computers
 * Optimiert Ihre Festplatten fÅr
   schnelleren Datenzugriff und
   grî·ere Sicherheit.

!command: Calibrate
!dos-cmd: CALIBRAT
^BCalibrate
CALIBRAT [Laufw:] [PARAMETER]

Optimiert die Geschwindigkeit und
Sicherheit des Datentransfers von
und auf die Festplatte.
^B PARAMETER
/BATCH       Keine Benutzerabfrage,
             bei Ende zurÅck zu DOS
/NOSEEK      Keine Zugriffstests
/NOFORMAT    Nur Mustertests, keine
             Formatierung
/X:^BLaufwerke^N Angegebene Laufwerke nicht
             testen

!command: Norton Cache
!dos-cmd: NCACHE2 /STATUS
^BNorton Cache
NCACHE2 [PARAMETER]

HÑlt hîufig benutzte Daten im Arbeits-
speicher bereit, so da· schneller
darauf zugegriffen werden kann.
Au·erdem werden Daten gepuffert, d. h. 
Speichern auf Festplatte lÑuft im
Hintergrund ab.
Weitere Angaben dazu finden Sie im
Benutzerhandbuch.

^Bƒƒ ^NNCACHE2 ist ein
    Befehlszeilendienstprogramm.

!command: Speed Disk
!dos-cmd: SD
^BSpeed Disk
SD [Laufw:] [PARAMETER]

Optimiert die Festplatte durch
Reorganisation der Dateistrukturen
und Verzeichnisse darauf. Freie 
Bereiche werden zusammengefa·t
und Dateien defragmentiert.

^B PARAMETER
/F  Optimiere ganzes Laufwerk
/Q  Freie Bereiche zusammenfassen
/U  Nur Dateien defragmentieren
/B  Neustart nach Optimierung

!topic: WERKZEUGE
               ^BWERKZEUGE

Programme, die die Arbeit am Computer
erleichtern. Sie kînnen:

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
VorgÑnge automatisch zu starten, die
in Echtzeit gesteuert werden kînnen.


Sie kînnen Demo- und
Registrierbildschirme erstellen.



^Bƒƒ^N Einsatz in Stapeldateien.

!command: Configuration
!dos-cmd: NUCONFIG
^BNorton Utilities Configuration
NUCONFIG [/BW]

Ermîglicht die Einstellung der Optionen
fÅr die Norton Utilities.

Installation oder Entfernen von
GerÑtetreibern und Programmen, die beim
Systemstart gestartet werden.



^BPARAMETER
/BW  Schwarzwei·bildschirm

!command: Control Center
!dos-cmd: NCC
^BNorton Control Center
NCC [Pfadname] [PARAMETER]

Kontrolliert Hardware-Einstellungen.
Cursorgrî·e, DOS-Farben, Farbpaletten,
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
DS SortierschlÅssel [Pfad] [/S]

Sortiert Verzeichnisse fÅr bessere
öbersicht.
^BSORT KEYS
N   Name          AnhÑngen eines Minus-
D   Datum         zeichens kehrt die
E   Erweiterung   Sortierfolge um.
G   Grî·e
Z   Zeit
^BPARAMETER
/S  Sortiert auch Unterverzeichnisse

!command: Duplicate Disk
!dos-cmd: DD
^BDuplicate Disk
DD [Ursprungslw: [Ziel-Lw.:]]

Schnelles Kopieren von Disketten.

Liest auch gro·e Disketten in einem
Zuge ein und ermîglicht das Anlegen
mehrerer Kopien einer Diskette ohne
erneutes Einlesen.

!command: File Attributes
!dos-cmd: FA
^BFile Attributes
FA [Dateiname] [PARAMETER]

Anzeige der Dateien nach Datei-
attributen, ƒnderung der Attribute
von Dateien und Verzeichnissen.
^B PARAMETER
/A    Archiv        ^B+^N oder ^B-^N nach dem
/R    Nur-Lesen     Parameter setzt oder
/HID  Versteckt     entfernt Attribut.
/SYS  System

^Bƒƒ ^NFA ist ein
    Befehlszeilendienstprogramm.

!command: File Date
!dos-cmd: FD
^BFile Date
FD Dateiname [PARAMETER]
éndert Datums- und Zeitangabe einer
Datei.
^BPARAMETER
/D:^BDatum^N Setzt das Datum auf TT-MM-JJ
/Z:^BZeit^N  Setzt die Zeit auf SS:MM:SS
/S       Inklusive Unterverzeichnisse

Ohne /D und /Z versieht FD die Datei mit
dem aktuellen Datum und der aktuellen
Zeit.
^Bƒƒ^N FD ist ein
    Befehlszeilendienstprogramm.

!command: File Find
!dos-cmd: FF
^BFile Find
FF [Universalz.][Text][PARAMETER]

Findet "verlegte" Dateien, indem es
nach deren Namen und Daten in allen
Laufwerken (auch Netzwerklaufwerken)
und Verzeichnissen sucht. Auch Datei-
attribute kînnen geÑndert werden.

^BPARAMETER
/S      Inkl. Dateien in Unterverz.
/CS     Gro·-/Kleinschreibung beachten
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
^Bƒƒ^N FL ist ein
    Befehlszeilendienstprogramm.

!command: File Size
!dos-cmd: FS
^BFile Size
FS [Pfadname] [Ziel-Lw:] [PARAMETER]
Anzeige der Grî·e von Dateien und
Verzeichnissen. öberprÅft, ob eine
angegebene Gruppe von Dateien auf
dem Ziellaufwerk Platz findet.

^BPARAMETER
Ziel-Lw: Test des freien Speichers
/P       Pause nach jedem Bildschirm
/S       Inklusive Unterverzeichnisse
/T       Anzeige von Gesamtwerten
^Bƒƒ^N FS ist ein
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
/T^Bn^N /B^Bn^N /L^Bn^N /R^Bn^N  RÑnder
/W^Bn^N /HI^Bn^N         Seitenbreite/-hîhe
/HEADER^Bn^N         Kopfzeilentyp (1,2,3)
/PR:la           HP LaserJet-Format
/PR:po           PostScript-Format
^Bƒƒ^N LP ist ein
    Befehlszeilendienstprogramm.

!command: Norton CD
!dos-cmd: NCD
^BNorton Change Directory
NCD [Verzeichnisname] [PARAMETER]

Verwaltet die Verzeichnisstruktur
einer Festplatte, unabhÑngig von deren
Umfang. Benennt Verzeichnisse um, ver-
schiebt, kopiert und lîscht sie.

Wechselt mit wenigen TastenanschlÑgen
direkt in jedes beliebige Verzeichnis.

^BPARAMETER
/R  Verzeichnis neu einlesen
/N  TREEINFO.NCD nicht aktualisieren

!command: Safe Format
!dos-cmd: SF
^BSafe Format
SF [Laufw:] [PARAMETER]

Sichere Art der Disk-Formatierung. Daten
werden nicht Åberschrieben und sind
somit zu retten, wenn die Disk
versehentlich formatiert wird.

^B PARAMETER
/F:^BGrî·e^N   Gibt Grî·e an (360, 720,etc.)
/Q         Quick-Format
/S         Kopiert DOS-Systemdateien
/V:^BKennung^N Setzt DatentrÑgerbezeichnung

!command: System Info
!dos-cmd: SI
^BSystem Information
SI [PARAMETER]

Informiert Åber alle Komponenten Ihres
Systems: Hardware, Speicher, Netzwerke,
Laufwerke, TSRs, GerÑtetreiber usw.
Schlie·t Benchmarks- und Leistungs-
tests ein.

^B PARAMETER
/AUTO:^Bn^N     Autom. Modus, ^Bn^N Sek/Bericht
/SPEC:^BDatei^N Bericht gemÑ· ^BDatei
/REP:^BDatei^N  Gibt Bericht an ^BDatei ^Naus
/TSR        Zeigt nur aktive TSRs an

!command: Text Search
!dos-cmd: TS
^BText Search
TS [Pfadname[Text]] [/S][/T] [PARAMETER]
TS [Laufw:[Text]] /D|/E [/Cn][PARAMETER]
Sucht nach Text in Dateien, auf
Laufwerken oder in gelîschtem
Datenbereich.
^BPARAMETER
/S    Inklusive Unterverzeichnisse
/T    Nur Dateinamen auflisten
/D    Suche auf gesamten Laufwerk
/E    Suche in gelîschtem Datenbereich
/C^Bn   ^NStart der Suche bei Cluster ^Bn
^Bƒƒ ^NTS ist ein
    Befehlszeilendienstprogramm.
