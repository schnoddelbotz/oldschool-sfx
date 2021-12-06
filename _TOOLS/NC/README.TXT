SYMANTEC LOKALISIERUNGS-TEAM IRLAND

README.TXT--
Copyright 1995 Symantec Corp. Alle Rechte vorbehalten.

NORTON COMMANDER
Version 5.0

Willkommen bei der Version 5.0 des Norton Commanders!
-----------------------------------------------------
Bitte lesen Sie diese Datei aufmerksam durch. Sie enthÑlt
wichtige Informationen, die nicht mehr in die Dokumentation
aufgenommen werden konnten.
     
     Diese Datei enthÑlt Informationen zu den folgenden Themen:

     * Dateien im Lieferumfang des Norton Commanders 5.0
     * Speicheranforderungen
        <> Speicheranforderungen des Commanders
        <> Den Commander mit kleinen und sehr kleinen Speicher-
           konfigurationen starten
     * UnterstÅtzung komprimierter Dateien
        <> Versteckte Dateien komprimieren
        <> KennwortgeschÅtzte komprimierte Dateien
        <> EinschrÑnkungen bei komprimierten Dateien
     * Betrachter
        <> Interner Betrachter
        <> Betrachter definieren
     * Filter
     * DateiÅbertragung mit dem Commander
        <> Klonen mit Hilfe von SHARE.EXE
        <> Pinbelegung der Commander-Kabel
            - Pinbelegung der seriellen Kabel
            - Pinbelegung des parallelen Kabels
     * Sonderzeichen im Commander-Editor
     * Norton Commander-Umgebungsvariablen
     * Umlaute in Datei- und Verzeichnisnamen
     * Installation des Commanders unter Windows 3.1
     * DATEX.P-Datei
     * KompatibilitÑt mit Windows 95 und OS/2
     * Dienstprogramm zum Kopieren von Disketten
     * Playwave-Dienstprogramm
     * Konvertierungsprogramm fÅr Telefonverzeichnis (DIR2DIR)
     * NC_EXIT-Dienstprogramm
     * Novell NDS
     * Tips zur AusfÅhrung des Commanders auf Systemen mit
       weniger als 1 MB Speicher
     * Running Norton Commander from a shared Network Drive
     * Creating an user defined tools menu
     * Using screen savers under Windows


Dateien im Lieferumfang des Norton Commanders 5.0
-------------------------------------------------
Auf den Disketten des Norton Commanders 5.0 befinden sich die
folgenden Dateien:

Diskette 1: Programmdiskette

        install.cfg     Konfigurationsdatei zur Installation
        install.exe     Installationsprogramm
        installd.exe    Installationsprogramm
        nc.cfg          Konfigurationsprogramm fÅr Betrachter
        nc.exe          Norton Commander-Lader
        nc.fil          Norton Commander-Filterdatenbank
        nc.hlp          Norton Commander-Hilfedatei
        nc.msg          Norton Commander-Meldungsdatei
        ncclean.exe     Dienstprogramm zum AufrÑumen des Systems
        ncclean.ini     Konfiguration zum AufrÑumen des Systems
        ncedit.exe      Norton Commander-Editor
        ncedit.msg      Norton Commander-Editor-Meldungsdatei
        ncff.exe        Norton Commander-Dateisuche
        ncff.msg        Norton Commander-Meldungsdatei fÅr Dateisuche
        ncmain.exe      Norton Commander-Hauptprogramm
        nczip.exe       Interne Komprimierung des NC
        nczip.msg       Meldungen zur internen Komprimierung
        packer.set      Norton Commander-Komprimierungsoptionen
        readme.txt      Readme-Datei
        whats.new       Neueste Informationen zum Norton Commander 5.0


Diskette 2: Programmdiskette 2

        123view.ex!     Tabellenkalkulationsbetrachter
        4372ansi.set    Konvertierungstabelle CP437->ANSI
        8502ansi.set    Konvertierungstabelle CP850->ANSI
        8632ansi.set    Konvertierungstabelle CP832->ANSI
        8652ansi.set    Konvertierungstabelle CP852->ANSI
        8662ansi.set    Konvertierungstabelle CP866->ANSI
        ansi2437.set    Konvertierungstabelle
        ansi2850.set    Konvertierungstabelle
        ansi2863.set    Konvertierungstabelle
        ansi2865.set    Konvertierungstabelle
        ansi2866.set    Konvertierungstabelle
        arcview.ex!     Betrachter fÅr komprimierte Dateien
        bitmap.ex!      Bitmap-Betrachter
        bug.ns!         Norton Commander-Bildschirmschoner
        bungee.ns!      Norton Commander-Bildschirmschoner
        clp2dib.ex!     Konvertierungsprogramm fÅr Betrachter
        dbview.ex!      Datenbank-Betrachter
        draw2wmf.ex!    Konvertierungsprogramm fÅr Betrachter
        drw2wmf.ex!     Konvertierungsprogramm fÅr Betrachter
        evileye.ns!     Norton Commander-Bildschirmschoner
        faces.ns!       Norton Commander-Bildschirmschoner
        flip.ns!        Norton Commander-Bildschirmschoner
        ico2dib.ex!     Konvertierungsprogramm fÅr Betrachter
        message.ms!     Allgemeine Meldungsdatei
        mouse.ns!       Norton Commander-Bildschirmschoner
        msp2dib.ex!     Konvertierungsprogramm fÅr Betrachter
        nc.ic!          Symboldatei fÅr NC 5.0
        norton.in!      INI-Datei fÅr Norton Commander 5.0
        packer.ex!      Konvertierungsprogramm fÅr Komprimierung
        pct2dib.ex!     Konvertierungsprogramm fÅr Betrachter
        q&aview.ex!     Q&A Datenbank-Betrachter
        refview.ex!     Reflex-Betrachter
        saver.ex!       Bildschirmschonerprogramm
        term95.gt!      Terminalemulatordatei
        term95.hl!      Terminalemulator-Hilfedatei
        term95.in!      Terminalemulator-INI-Datei
        term95.re!      Terminalemulator-Meldungsdatei
        tif2dib.ex!     Konvertierungsprogramm fÅr Betrachter
        tornado.ns!     Norton Commander-Bildschirmschoner
        vector.ex!      Konvertierungsprogramm fÅr Betrachter
        wpb2dib.ex!     Konvertierungsprogramm fÅr Betrachter
        wpv2wmf.ex!     Konvertierungsprogramm fÅr Betrachter
        wpview.ex!      Textverarbeitungsbetrachter

Diskette 3: Programmdiskette 3

        dir2dir.ex!     Konvertierungsprogramm fÅr Telefonverzeichnis
        fish.ns!        Norton Commander-Bildschirmschoner
        ncdd.ex!        Norton Commander-Diskettenkopierprogramm
        ncff.hl!        Hilfedatei zum Norton Commander-Dateisucheprogramm
        nclabel.ex!     Norton Commander-Programm zur DatentrÑgerbezeichnung
        ncnet.ex!       Norton Commander-Netzwerkprogramm
        ncpscrip.hd!    Norton Commander-Postscript-Header-Datei
        ncsf.ex!        Norton Commander-Diskettenformatierung
        ncsi.ex!        Norton Commander-System-Informationen
        nc_exit.co!     NC_EXIT-Dienstprogramm
        nc_exit.do!     NC_EXIT-Dokumentation
        paraview.ex!    Paradox-Betrachter
        playwave.ex!    WAV-Klangwiedergabe
        rbview.ex!      Datenbank-Betrachter
        term95.ex!      Terminalemulatorprogramm
        term95.sc!      Term95-Skripte


Speicheranforderungen
---------------------
    <> Speicheranforderungen des Commanders

    Der Norton Commander benîtigt mindestens 512 KB freien Hauptspeicher,
    um alle externen Betrachter verwenden zu kînnen. Manche Betrachter
    benîtigen zusÑtzlichen Speicher zur AusfÅhrung im Quick-View-Modus.

    <> Den Commander mit kleinen und sehr kleinen Speicher-
       konfigurationen starten

    In FÑllen, bei denen wenig Speicher zur VerfÅgung steht, werden Sie
    mit den integrierten Betrachtern des Commanders keine gro·en Dateien
    mit Quick-View anzeigen lassen kînnen. Um Ihnen eine Umgehungsmîg-
    lichkeit fÅr dieses Problem anzubieten, besitzt der Norton Commander
    5.0 zwei zusÑtzliche Speicherkonfigurationen, die Åber die Befehls-
    zeile ausgewÑhlt werden kînnen. Jede Speicherkonfiguration schrÑnkt
    die Anzahl der Dateien ein, die in den Commander-Fenstern enthalten
    sein kînnen. Die Befehlszeilensyntax fÅr diese Speicherkonfigurationen
    lautet:

       Befehlszeile    Beschreibung
       --------------  ------------------------------------------------
       nc /s           Startet den Commander mit KLEINER Speicherkonfigura-
                       tion. Die Anzahl der Dateien pro Fenster ist 700.

       nc /t           Startet den Commander mit SEHR KLEINER Speicherkonfi-
                       guration. Die Anzahl der Dateien pro Fenster ist 300.


UnterstÅtzung komprimierter Dateien
-----------------------------------
        <> Versteckte Dateien komprimieren

        Wird eine versteckte Datei mit der Norton Commander-Komprimierung
        komprimiert, verliert sie ihr Dateiattribut "Versteckt". Der Grund
        hierfÅr liegt in der angestrebten KompatibilitÑt des Dateiformats
        der Commander-Komprimierung mit dem von PKZIP. Zu diesem Zeitpunkt
        unterstÅtzt PKZIP versteckte komprimierte Dateien nicht.

        <> KennwortgeschÅtzte komprimierte Dateien
        
        WÑhrend das Komprimiermodul des Norton Commanders kompatibel zu den
        Formaten komprimierter Dateien von PKZIP 1.x und PKZIP 2.x ist,
        gestattet der Commander fÅr alle komprimierten Dateien immer nur
        ein aktives Kennwort.

    <> EinschrÑnkungen bei komprimierten Dateien

        EnthÑlt das aktuelle Fenster eine geîffnete komprimierte Datei, so
        kann fÅr dieses Fenster das Laufwerk nicht gewechselt werden. Die
        komprimierte Datei mu· zunÑchst geschlossen werden. Dann kann das
        Verzeichnis wie gewohnt ausgewÑhlt werden.

        Aufgrund des breiten Marktangebots verschiedener Komprimierungspro-
        gramme und der gro·en Unterschiede bei den Verfahren kann es vor-
        kommen, da· Sie manche Funktionen des Norton Commanders nicht mit
        Ihrem Komprimierungsprogramm anwenden kînnen. Insbesondere gilt dies
        fÅr manche Komprimierungsprogramme, die die Dekomprimierung von Da-
        teien in ein anderes Zielverzeichnis als das aktuelle Verzeichnis
        nicht unterstÅtzen. DarÅberhinaus unterstÅtzen nicht alle Kompri-
        mierungsprogramme die Speicherung voller Pfadnamen und Verzeichnisse.

        Anweisungen zur Programmierung der Commander-UnterstÅtzung fÅr kom-
        primierte Dateien finden Sie zu Beginn der Datei PACKER.SET.


Betrachter
----------
    <> Interner Betrachter

    Zum Start des in NCMAIN.EXE enthaltenen Betrachters drÅcken Sie Alt+F3.

    <> Betrachter definieren
    
    SÑmtliche vom Norton Commander 5.0 unterstÅtzten Betrachter sind in der
    Datei NC.CFG definiert. Sie kînnen die Liste der mit den Betrachtern
    verbundenen Dateien modifizieren. Wenn die Dateien Ihres Textverarbei-
    tungsprogramms z. B. eine besondere Erweiterung wie .DCC haben, kînnen
    Sie die mit WPVIEW.EXE einsehbaren Dateien erweitern, indem Sie die
    Dateierweiterung .DCC in die unter WPVIEW.EXE aufgefÅhrte Liste auf-
    nehmen. Zum Beispiel wÅrde der von Ihnen geÑnderte WPVIEW-Abschnitt in
    NC.CFG wie folgt aussehen:

              ~wpview.exe
              $*.exe,p
              $*.com,p
              $*.dll,p
              $*.dcc,p     <----- Zeile hier eingefÅgt zur Unter-
              $*.*                stÅtzung von *.DCC-Dateien
       

Filter
------
Die Definitionen der Fensterfilter fÅr den Norton Commander 4.0 befanden
sich in der Datei NC.CFG. Im neuen Commander werden Fensterfilter (wie
auch die Aktionsfilter) in der BinÑrdatei NC.FIL abgelegt. Sie mÅssen Ihre
bestehenden Commander 4.0-Filter in diese neue Filterdatei konvertieren,
indem Sie sie im Commander 5.0 neu definieren. Anweisungen zur Definition
von Filtern entnehmen Sie bitte dem Benutzerhandbuch.


DateiÅbertragung mit dem Commander
----------------------------------

    <> Klonen mit Hilfe von SHARE.EXE

    Wenn Sie versuchen, zu einem COM-Port eines Rechners, auf dem SHARE.EXE
    installiert ist, eine Klonverbindung herzustellen, tritt ein Problem
    auf. Zwischen SHARE und der Klon-Software, die die Einheit COMX îffnet,
    kommt es zu einem Konflikt, da SHARE exklusive Rechte an den Boot-Lader
    vergibt. Dies fÅhrt wÑhrend einer Klon-Verbindung zu Fehlermeldungen
    bezÅglich der gemeinsamen Nutzung von Daten. Sie kînnen dieses Problem
    umgehen, indem Sie statt CTTY COM1: den Befehl CTTY AUX verwenden.

    <> Pinbelegung der Commander-Kabel

    Sie kînnen ein spezielles Commander-Kabel bestellen, mit dem Sie zwei
    beliebige Computer verbinden kînnen. In der Verpackung des Norton
    Commanders 5.0 liegt ein entsprechendes Bestellformular bei. Weitere
    Einzelheiten zu diesem Angebot entnehmen Sie bitte dieser Karte.

        - Pinbelegung der seriellen Kabel

        9 - 9 Seriell       9 - 25 Seriell      25 - 25 Serial

        2 ======= 3         2 ======= 2          2 ======== 3
        3 ======= 2         3 ======= 3          3 ======== 2
        4 ======= 6         4 ======= 6          4 ======== 5
        5 ======= 5         5 ======= 7          5 ======== 4
        6 ======= 4         6 ======= 20         6 ======== 20
        7 ======= 8         7 ======= 5          7 ======== 7
        8 ======= 7         8 ======= 4         20 ======== 6


        - Pinbelegung des parallelen Kabels.

         1 ======= 7
         2 ======= 15
         3 ======= 13
         4 ======= 12
         5 ======= 10
         6 ======= 11
         7 ======= 1
         8 ======= 14
         9 ======= 16
        10 ======= 5
        11 ======= 6
        12 ======= 4
        13 ======= 3
        14 ======= 8
        15 ======= 2
        16 ======= 9
        17 ======= 17
        18 ======= 18
        19 ======= 19
        20 ======= 20
        21 ======= 21
        22 ======= 22
        23 ======= 23
        24 ======= 24
        25 ======= 25

Sonderzeichen im Commander-Editor
---------------------------------
Zur Eingabe europÑischer Sonderzeichen kann es manchmal erforderlich sein,
zunÑchst die Tastenkombination STRG+Q und dann das gewÅnschte Zeichen einzu-
geben. Um beispielsweise das deutsche Paragraphenzeichen einzugeben, geben
Sie STRG+Q und anschlie·end UMSCHALT+3 ein.


Norton Commander-Umgebungsvariablen
-----------------------------------
Um festzustellen, wo temporÑre Arbeitsdateien abgelegt und gespeichert
werden sollen, durchsucht der Norton Commander Ihre Umgebung nach den drei
Umgebungsvariablen TEMP, TMP und NC.


Umlaute in Datei- und Verzeichnisnamen
--------------------------------------
Wenn Sie die in den Norton Utilities enthaltene Ersatz-Shell fÅr COMMAND.COM,
NDOS, verwenden, besteht auf Novell-Netzwerken die Mîglichkeit, mit gro·en 
und kleinen Umlauten verschiedene Dateien oder Verzeichnisse zu erstellen. 
Beispiel:

MD Ñé
MD éÑ

erstellt zwei neue Verzeichnisse. Aus diesem Grund konvertiert der Commander
Umlaute in Datei- oder Verzeichnisnamen nicht in Gro·-oder Kleinbuchstaben.


Installation des Commanders unter Windows 3.1
---------------------------------------------

Schlagen Sie den Abschnitt "Norton Commander unter Windows installieren" auf
Seite 5 des Benutzerhandbuchs auf, und fÅhren Sie die Schritte 1 bis 7 durch.

WÑhlen Sie die SchaltflÑche "Anderes Symbol...".

Geben Sie den vollen Pfadnamen der Datei NC.ICO ein, z.B. C:\NC\NC.ICO, oder
verwenden Sie die SchaltflÑche "Durchsuchen", wenn Sie den Pfad nicht genau
kennen.

WÑhlen Sie "OK".

Damit ist der Norton Commander auf Ihrem Desktop installiert.


DATEX.P-Datei
-------------

Die Datei DATEX.P enthÑlt eine Liste mit Telefonnummern, die bei AusfÅhrung
der Skriptdatei CMPSRV.SCX verwendet werden kînnen. Diese Datei wird vom
Terminalemulationsprogramm verwendet. Das Format dieser Datei ist wie folgt:

Position        1          2         3        4          5         6
1               5          5         5        5          5         5
<Ortsname    ><Vorwahl ><300     ><1200/75 ><1200    ><2400    ><9600    >

Die in dieser Datei gespeicherten Telefonnummern entsprechen den Nummern, die
der Verbindung mit dem CompuServe Bulletin Board System dienen. Die nach
Position 25 angegebenen Nummern werden abhÑngig von der Baudrate verwendet,
die Sie fÅr Ihre Verbindung benîtigen. Sie kînnen diese Datei in den
Commander-Editor laden und so Ihre eigenen Telefonnummern eintragen.


KompatibilitÑt mit Windows 95 und OS/2
--------------------------------------

Unter Windows 95 und OS/2 2.x und 3.x werden bei der Verwendung mancher
DatentrÑger-Dienstprogramme Schwierigkeiten auftreten. Insbesondere gilt
dies fÅr die Diskettenformatierung und die Systeminformationen.

DarÅberhinaus gehen bei der Kopie von Dateien mit langen Dateinamen unter
Windows 95 die den Dateien zugeordneten langen Dateinamen verloren. Das
gleiche gilt fÅr lange Dateinamen unter OS/2.


Dienstprogramm zum Kopieren von Disketten
-----------------------------------------

Die Option "Fehlerhafte Sektoren Åbergehen" wird nicht in der INI-Datei des
Commanders gespeichert. Sie wird dagegen beim Start des Dienstprogramms
automatisch deaktiviert. Alle anderen Optionen fÅr das Kopieren von Dis-
ketten werden jedoch gesichert.


Playwave-Dienstprogramm
-----------------------

Norton Commander 5.0  wird mit einem "Betrachter" zum Abspielen von WAV-
Dateien geliefert. Da dieses Programm unabhÑngig von zusÑtzlicher Sound-
Hardware in Ihrem System arbeitet, ist die Wiedergabe auf manchen Maschinen
von minderer QualitÑt.


Konvertierungsprogramm fÅr Telefonverzeichnis (DIR2DIR)
-------------------------------------------------------

Das Dienstprogramm DIR2DIR.EXE dient der Konvertierung Ihrer Telefonverzeich-
nisdatei von NC 4.0 in das neue Format des NC 5.0. Geben Sie DIR2DIR in der
Befehlszeile ein, wenn Sie weitere Informationen zu diesem Programm wÅnschen.


NC_EXIT-Dienstprogramm
----------------------

Dieses praktische Dienstprogramm lagert den Kernel des Norton Commanders ohne
Zuhilfenahme eines TSR-Programmes aus. Es Åbernimmt darÅberhinaus wahlweise
einen Befehl mit bis zu 11 Zeichen zur spÑteren AusfÅhrung. Weitere Einzel-
heiten zu diesem Dienstprogramm finden Sie in der Datei NC_EXIT.DOC.


Novell NDS
----------

Die Netzwerk-Dienstprogramme des Commanders arbeiten mit Netware 3.x und 4.x
zusammen. Die Login-Komponente verursacht Probleme bei der Verbindung mit
Netware 4.x, das Novell's Directory Services (NDS) verwendet.


Tips zur AusfÅhrung des Commanders auf Systemen mit weniger als 1 MB Speicher
-----------------------------------------------------------------------------

Das Speicherverwaltungssystem, das der Norton Commander fÅr die AusfÅhrung
seiner externen Dienstprogramme verwendet, lagert den Kernel (NCMAIN) in
den Erweiterungs- oder Expansionsspeicher aus. VerfÅgt Ihr System Åber nicht
mehr als 1 MB Speicher, lagert der Commander NCMAIN in eine Datei auf dem
DatentrÑger aus. Diese Commander-Auslagerungsdatei wird in einem temporÑren
Verzeichnis gespeichert, das Åber die Umgebungsvariablen TEMP, TMP, NC und
NORTON gefunden wird.

Wenn Sie den Commander von einer Diskette aus auf einem 1-MB-System aus-
fÅhren, sollten Sie aus GeschwindigkeitsgrÅnden eine dieser Variablen auf
ein temporÑres Verzeichnis auf Ihrer Festplatte setzen. Andernfalls ver-
sucht der Commander, seine Auslagerungsdatei auf der Diskette anzulegen.

Running Norton Commander from a shared Network Drive
----------------------------------------------------
Norton Commander can be run from a shared network drive as follows :-

1. Installation on shared network drive.
	- Log into your server as the Supervisor.
	- Create a directory called NC5NET.
	- Install the Norton Commander software into this account using 
	  the standard installation diskettes.
	- Create an User account called NC5NETUSER.
	- Ensure that this account has only Read/File Scan rights to the 
	  NC5NET directory.

2. Installation of NC 5.0 on User machine.
	- Copy only the INI files from the NC5NET account to the NC directory
	  on the users machine.
	- Modify the autoexec.bat file and set the following environment
	  variables :-
		SET NC=c:\NC5
		SET NORTON=c:\NC5
	- Login into the network as NC5NETUSER and ensure that the NC5NET 
	  directory is in the user's DOS PATH.
	- Type NC at the command prompt.

Creating a tools menu
---------------------
It is possible to add a user defined Tools Menu to the Norton Commander's 
main menu. To define a Tools Menu create a file called TOOLS.MNU and store
it in the same directory as the NC.INI file.

Each line within the TOOLS.MNU file corresponds to a single menu item. To
define a Menu item use the following format :-

	Menu_Item_Name;Command_to_be invoked_when_selected

For example a simple Tools Menu may look like :-
	
	File Date;fd.exe
	Norton Control Centre;ncc.exe
	Norton Disk Doctor;ndd.exe
	Norton Disk Editor;de.exe
	Text Search;ts.exe

The number of menu items that can be defined in the TOOLS.MNU file is 
limited only by the amount of free memory.

Using screen savers under Windows 3.1
-------------------------------------
When Commander is running in a DOS box under MS-Windows, its graphical screen
savers will be disabled even if one is selected from the configuration panel. 
In circumstances like this, Commander's default screen saver will be 
invoked instead.
