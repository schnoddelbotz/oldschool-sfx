SOUND BLASTER 16
================

Diese Datei enth„lt zus„tzliche Informationen als Erg„nzung zum
Handbuch. Lesen Sie bitte erst alle Abschnitte durch, bevor Sie mit der
Installation beginnen.

Diese Datei enth„lt folgende Abschnitte:

    1.  DOS-Treiber
    2.  Blaster-Zeile
    3.  Online-Dokumentation
    4.  Danksagung

1. DOS-TREIBER

   Während der benutzerdefinierten Installation haben Sie die Möglichkeit,
   folgende DOS-Treiber in Ihre CONFIG.SYS-Datei einzubeziehen.

      DEVICE=C:\SB16\DRV\CTSB16.SYS /UNIT=0 /BLASTER=A:220 I:5 D:1 H:5
      DEVICE=C:\SB16\DRV\CTMMSYS.SYS

   Wobei: BLASTER=A:220 I:5 D:1 H:5 zeigt Hardware-Ressourcen an, die
          von Ihrer Audiokarte verwendet werden.

   Dieser BLASTER-Schalter ist unwirksam, wenn Sie eine Plug and Play-
   Audiokarte verwenden.

   Bei Plug and Play-Audiokarten werden die Hardware-Ressourcen durch
   den Intel Konfigurationsmanager zugewiesen. Ist dies der Fall, 
   muß der Intel Konfigurationsmanager vor Ihren DOS-Audiotreibern geladen
   werden.


2. BLASTER-ZEILE

   Die BLASTER-Zeile in Ihrer AUTOEXEC.BAT-Datei

      SET BLASTER=A220 I5 D1 H5 P330 E620 T6

   ist unwirksam, wenn Sie aus dem oben beschriebenen Grund eine 
   Plug and Play-Audiokarte verwenden.


3. ONLINE-DOKUMENTATION

   Um den Zugriff auf die Informationen über die Anwendungen in diesem 
   Paket zu vereinfachen, haben wir die Online-Dokumentation zusammen-
   gestellt. Sie befindet sich im Programmgruppen-Fenster Ihrer 
   Audiokarte. Doppelklicken Sie einfach auf die Symbole, deren 
   Namen mit dem Wort "Verwenden ..." beginnen.


4. DANKSAGUNG

   Diese Version des SB16FM.DRV ist von "Voyetra Technologies".


                ******** ENDE VON README.TXT ********

