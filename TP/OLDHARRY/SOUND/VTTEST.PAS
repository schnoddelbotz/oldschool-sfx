PROGRAM VToolTest;
{
 *************************************************************************
 *   Demonstrationsprogramm zur Unit VOCTOOL, (W) in Turbo-Pascal 6.0    *
 *************************************************************************
 *                     (C) 1992 DATA BECKER GmbH                         *
 *                         Autor : Axel Stolz                            *
 *************************************************************************
 * Die Speicherobergrenze des Hauptprogramms mu· heruntergesetzt werden, *
 * sonst belegt das Programm den kompletten zur VerfÅgung stehenden      *
 * Speicher. Somit ist dann kein Speicher mehr fÅr den Treiber und die   *
 * Sampledaten Åbrig. Die Speicherparameter mÅssen je nach Hauptprogramm *
 * angepa·t werden.                                                      *
 *************************************************************************
}

{$M 16000,0,50000}

USES Crt,Voctool;

VAR
   Sound : Pointer; { Zeiger auf die Sampledaten im Speicher }
   Check : BOOLEAN; { Flag fÅr boolsche Abfragen             }
   Ch    : CHAR;    { Zeichenpuffer fÅr Benutzer-Eingabe     }

PROCEDURE Fehler;
{
 * EINGABE  : keine, die Daten kommen aus der globalen Variable VOCErrStat
 * AUSGABE  : keine
 * FUNKTION : Gibt den aufgetretenen SB-Fehler als Text auf den Bildschirm
              aus, inklusive der Fehlernummer und beendet das Programm mit
              dem Errorlevel, der der Fehlernummer entspricht.
}
BEGIN
   Write(' Fehler #',VOCErrStat:3,' =');
   PrintVOCErrMessage;
   WriteLn;
   HALT(VOCErrStat);
   END;

BEGIN
  ClrScr;

{ Treiber ist nicht initalisiert worden }
  IF Not(VOCDriverInstalled) THEN Fehler;

{ LÑdt die Datei DEMO.VOC in den Speicher }
  Check := VOCGetBuffer(Sound,'DEMO.VOC');

{ VOC-Datei konnte nicht geladen werden }
  IF Not(Check) THEN Fehler;

{ Hauptschleife des Programms }
  Write('CT-Voice-Driver Version : ');
  WriteLn(Hi(VOCDriverVersion),'.',Lo(VOCDriverVersion));
  WriteLn('Wollen Sie den Sound (e)inmal oder (m)ehrmals hîren ?');
  Write('Eingabe : '); Ch := ReadKey;WriteLn;WriteLn;
  CASE UpCase(Ch) OF
   'E' : BEGIN
            Write('Tippen Sie eine Taste um den Sound zu unterbrechen ...');
            VOCOutput(Sound);
            REPEAT UNTIL KeyPressed OR (VOCStatusWord = 0);
            IF KeyPressed THEN VOCStop;
            END;
   'M' : BEGIN
            Ch := #0;
            Write('DrÅcken Sie <ESC> zum Abbruch...');
            REPEAT
               VOCOutputLoop(Sound);
               REPEAT UNTIL KeyPressed OR (VOCStatusWord = 0);
               IF KeyPressed THEN Ch := ReadKey;
               UNTIL Ch = #27;
            VOCStop;
            END;
   END;

{ Speicher der VOC-Datei wieder frei geben }
  Check := VOCFreeBuffer(Sound);
  IF Not(Check) THEN Fehler;
  END.