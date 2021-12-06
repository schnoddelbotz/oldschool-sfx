UNIT VOCTOOL;
{
 ********************************************************************
 * Unit zur Ansteuerung der Sound-Blaster-Karte in Turbo-Pascal 6.0 *
 *          unter Benutzung des Treibers CT-VOICE.DRV.              *
 ********************************************************************
 *                 (C) 1992 DATA BECKER GmbH                        *
 *                    Autor : Axel Stolz                            *
 ********************************************************************
}
INTERFACE

TYPE
   VOCFileTyp = File;

CONST
   VOCToolVersion  = 'v1.5';  { Versionsnummer der VOCTOOL-Unit }
   VOCBreakEnd     = 0;       { Konstante fÅr Schleifenabbruch  }
   VOCBreakNow     = 1;       { Konstante fÅr Schleifenabbruch  }

VAR
   VOCStatusWord        : WORD;     { Variable fÅr Sound-Blaster-Status  }
   VOCErrStat           : WORD;     { Variable fÅr Treiberfehlernummer   }
   VOCFileHeader        : STRING;   { Variable fÅr CT-Format Vorspann    }
   VOCFileHeaderLength  : BYTE;     { LÑnge des CT-Format-Vorspanns      }
   VOCPaused            : BOOLEAN;  { Flag fÅr VoiceStatus Pause         }
   VOCDriverInstalled   : BOOLEAN;  { Flag, ob Treiber installiert       }
   VOCDriverVersion     : WORD;     { Treiber-Versionsnummer             }
   VOCPtrToDriver       : Pointer;  { Zeiger auf den Treiber im Speicher }
   OldExitProc          : Pointer;  { Zeiger auf die alte Unit-ExitProc  }


PROCEDURE PrintVOCErrMessage;
FUNCTION  VOCGetBuffer(VAR VoiceBuff : Pointer; Voicefile : STRING):BOOLEAN;
FUNCTION  VOCFreeBuffer(VAR VoiceBuff : Pointer):BOOLEAN;
FUNCTION  VOCGetVersion:WORD;
PROCEDURE VOCSetPort(PortNumber : WORD);
PROCEDURE VOCSetIRQ(IRQNumber : WORD);
FUNCTION  VOCInitDriver:BOOLEAN;
PROCEDURE VOCDeInstallDriver;
PROCEDURE VOCSetSpeaker(OnOff:BOOLEAN);
PROCEDURE VOCOutput(BufferAddress : Pointer);
PROCEDURE VOCOutputLoop (BufferAddress : Pointer);
PROCEDURE VOCStop;
PROCEDURE VOCPause;
PROCEDURE VOCContinue;
PROCEDURE VOCBreakLoop(BreakMode : WORD);

IMPLEMENTATION

USES DOS,Crt;

TYPE
   TypeCastType = ARRAY [0..6000] of Char;

VAR
   Regs : Registers;

PROCEDURE PrintVOCErrMessage;
{
 * EINGABE  : keine
 * AUSGABE  : keine
 * FUNKTION : Gibt den aufgetretenen SB-Fehler als Text auf den Bildschirm
 *            aus, ohne den Fehlerstatus zu Ñndern.
}
BEGIN
   CASE VOCErrStat OF
      100 : Write(' Treiber Datei CT-VOICE.DRV nicht gefunden ');
      110 : Write(' kein Speicher fÅr Treiberdatei frei ');
      120 : Write(' falsche Treiberdatei ');

      200 : Write(' VOC-Datei nicht gefunden ');
      210 : Write(' kein Speicher fÅr VOC-Datei frei ');
      220 : Write(' Datei ist nicht im VOC-Format ');

      300 : Write(' Speicherbelegungsfehler aufgetreten ');

      400 : Write(' keine Sound-Blaster-Karte gefunden ');
      410 : Write(' falsche Port-Adresse benutzt ');
      420 : Write(' falschen Interrupt benutzt ');

      500 : Write(' keine Schleife in Bearbeitung ');
      510 : Write(' kein Sample in der Ausgabe ');
      520 : Write(' kein angehaltenes Sample vorhanden ');
      END;
   END;

FUNCTION Exists (Filename : STRING):BOOLEAN;
{
 * EINGABE  : Dateiname als String
 * AUSGABE  : TRUE, falls Datei vorhanden, FALSE sonst
 * FUNKTION : PrÅft, ob eine Datei bereits vorhanden ist, und gibt dement-
              sprechend einen boolschen Ausdruck zurÅck.
}
VAR
   F : File;
BEGIN
   Assign(F,Filename);
{$I-}
   Reset(F);
   Close(F);
{$I+}
   Exists := (IoResult = 0) AND (Filename <> '');
   END;

PROCEDURE AllocateMem (VAR Pt : Pointer; Size : LongInt);
{
 * EINGABE  : Variable fÅr Puffer als Pointer,
              Grî·e des Puffers als LongInt
 * AUSGABE  : Zeiger auf Puffer in Variable oder NIL
 * FUNKTION : Reserviert soviele Bytes wie Size angibt und legt
              den Zeiger darauf in die Variable Pt. Wenn nicht genug
              Speicher vorhanden ist, dann zeigt Pt auf NIL
}
VAR
   SizeIntern : WORD;     { Grî·e des Puffers fÅr interne Berechnung }
BEGIN
   Inc(Size,15);                 { Puffergrî·e um 15 erhîhen ...   }
   SizeIntern := (Size shr 4);   { und dann durch 16 teilen.       }
   Regs.AH := $48;               { MS-DOS Funktion $48 in AH laden }
   Regs.BX := SizeIntern;        { Interne Grî·e in BX laden       }
   MsDos(Regs);                  { Speicher reservieren            }
   IF (Regs.BX <> SizeIntern) THEN Pt := NIL
   ELSE Pt := Ptr(Regs.AX,0);
   END;

FUNCTION  CheckFreeMem (VAR VoiceBuff : Pointer; VoiceSize : LongInt):BOOLEAN;
{
 * EINGABE  : Variable fÅr Puffer als Pointer, gewÅnschte Grî·e als LongInt
 * AUSGABE  : Zeiger auf Buffer, TRUE/FALSE, je nach AllocateMem
 * FUNKTION : PrÅft, ob genug Speicher fÅr eine VOC-Datei belegt werden kann.
}
BEGIN
   AllocateMem(VoiceBuff,VoiceSize);
   CheckFreeMem := VoiceBuff <> NIL;
   END;

FUNCTION  VOCGetBuffer (VAR VoiceBuff : Pointer; Voicefile : STRING):BOOLEAN;
{
 * EINGABE  : Variable fÅr Puffer als Pointer, Dateiname als String
 * AUSGABE  : Zeiger auf Puffer mit VOC-Daten, TRUE/FALSE
 * FUNKTION : LÑdt eine Datei in den Speicher und gibt bei erfolgreichem
              Laden den Wert TRUE zurÅck, ansonsten FALSE.
}
VAR
   SampleSize : LongInt;
   FPresent   : BOOLEAN;
   VFile      : VOCFileTyp;
   Segs       : WORD;
   Read       : WORD;

BEGIN
   FPresent := Exists(VoiceFile);

{ Die VOC-Datei konnte nicht gefunden werden }
   IF Not(FPresent) THEN BEGIN
      VOCGetBuffer := FALSE;
      VOCErrStat   := 200;
      EXIT
      END;

   Assign(VFile,Voicefile);
   Reset(VFile,1);
   SampleSize := Filesize(VFile);
   AllocateMem(VoiceBuff,SampleSize);

{ Es ist nicht genÅgend Speicher fÅr die VOC-Datei da }
   IF (VoiceBuff = NIL) THEN BEGIN
      Close(VFile);
      VOCGetBuffer := FALSE;
      VOCErrStat   := 210;
      EXIT;
      END;

   Segs := 0;
   REPEAT
      Blockread(VFile,Ptr(seg(VoiceBuff^)+4096*Segs,Ofs(VoiceBuff^))^,$FFFF,Read);
      Inc(Segs);
      UNTIL Read = 0;
   Close(VFile);

{ Die Datei ist nicht im VOC-Format }
   IF (TypeCastType(VoiceBuff^)[0]<>'C') OR
      (TypeCastType(VoiceBuff^)[1]<>'r') THEN BEGIN
      VOCGetBuffer := FALSE;
      VOCErrStat := 220;
      EXIT;
      END;

{ Das Laden ist erfolgreich verlaufen }
   VOCGetBuffer := TRUE;
   VOCErrStat   := 0;

{ LÑnge des Headers aus der Datei lesen }
   VOCFileHeaderLength := Ord(TypeCastType(VoiceBuff^)[20]);
   END;

FUNCTION VOCFreeBuffer (VAR VoiceBuff : Pointer):BOOLEAN;
{
 * EINGABE  : Zeiger auf Puffer als Pointer
 * AUSGABE  : keine
 * FUNKTION : Gibt den von den VOC-Daten belegten Speicher wieder frei
}
BEGIN
   Regs.AH := $49;              { MS-DOS Funktion $49 in AH laden   }
   Regs.ES := seg(VoiceBuff^);  { Segment des Speichers in ES laden }
   MsDos(Regs);                 { Speicher wieder frei geben        }
   VOCFreeBuffer := TRUE;
   IF (Regs.AX = 7) OR (Regs.AX = 9) THEN BEGIN
      VOCFreeBuffer := FALSE;
      VOCErrStat := 300       { beim Freigeben ist ein DOS-Fehler }
      END;                      { aufgetreten.                      }
   END;

FUNCTION VOCGetVersion:WORD;
{
 * EINGABE  : keine
 * AUSGABE  : Treiber-Versionsnummer
 * FUNKTION : Ermitteln der Versionsnummer des Treibers
}
VAR
   VDummy : WORD;
BEGIN
   ASM
      MOV       BX,0
      CALL      VOCPtrToDriver
      MOV       VDummy, AX
      END;
   VOCGetVersion := VDummy;
   END;

PROCEDURE VOCSetPort(PortNumber : WORD);
{
 * EINGABE  : Portadressen-Nummer
 * AUSGABE  : keine
 * FUNKTION : Setzen der Portadresse vor der Initialisierung
}
BEGIN
   ASM
      MOV    BX,1
      MOV    AX,PortNumber
      CALL   VOCPtrToDriver
      END;
   END;

PROCEDURE VOCSetIRQ(IRQNumber : WORD);
{
 * EINGABE  : Interrupt-Nummer
 * AUSGABE  : keine
 * FUNKTION : Setzen der Interrupt-Nummer vor der Initialisierung
}
BEGIN
   ASM
      MOV    BX,2
      MOV    AX,IRQNumber
      CALL   VOCPtrToDriver
      END;
   END;

FUNCTION  VOCInitDriver: BOOLEAN;
{
 * EINGABE  : keine
 * AUSGABE  : Fehlermeldungsnummer, je nach Initialisierungsergebnis
 * FUNKTION : Initialisierung der Treibersoftware
}
VAR
   Out, VSeg, VOfs : WORD;
   F   : File;
   Drivername,
   Pdir        : DirStr;
   Pnam        : NameStr;
   Pext        : ExtStr;

BEGIN
{ ZunÑchst wird der Treiber  CT-VOICE.DRV in dem Pfad gesucht, in dem
  das Programm, das den Treiber benutzen will, aufgefunden wurde.       }
   Pdir := ParamStr(0);
   Fsplit(ParamStr(0),Pdir,Pnam,Pext);
   Drivername := Pdir+'CT-VOICE.DRV';

   VOCInitDriver := TRUE;

{ Treiberdatei nicht gefunden }
   IF Not Exists(Drivername) THEN BEGIN
      VOCInitDriver := FALSE;
      VOCErrStat    := 100;
      EXIT;
      END;

{ Laden des Treibers }
   Assign(F,Drivername);
   Reset(F,1);
   AllocateMem(VOCPtrToDriver,Filesize(F));

{ Es konnte kein Speicher fÅr den }
{ Treiber belegt werden           }
   IF VOCPtrToDriver = NIL THEN BEGIN
      VOCInitDriver := FALSE;
      VOCErrStat    := 110;
      EXIT;
      END;

   Blockread(F,VOCPtrToDriver^,Filesize(F));
   Close(F);

{ Treiberdatei beginnt nicht mit "CT" }
{ Also liegt falscher Treiber vor     }
   IF (TypeCastType(VOCPtrToDriver^)[3]<>'C') OR
      (TypeCastType(VOCPtrToDriver^)[4]<>'T') THEN BEGIN
         VOCInitDriver := FALSE;
         VOCErrStat    := 120;
         EXIT;
         END;

{ Versionsnummer ermitteln und an globale Variable Åbergeben }
   VOCDriverVersion := VOCGetVersion;

{ Starten des Treibers }
   Vseg := Seg(VOCStatusWord);
   VOfs := Ofs(VOCStatusWord);
   ASM
      MOV       BX,3
      CALL      VOCPtrToDriver
      MOV       Out,AX
      MOV       BX,5
      MOV       ES,VSeg
      MOV       DI,VOfs
      CALL      VOCPtrToDriver
      END;

{ Es konnte keine Sound-Blaster-  }
{ Karte gefunden werden           }
   IF Out = 1 THEN BEGIN
      VOCInitDriver := FALSE;
      VOCErrStat    := 400;
      EXIT;
      END;

{ Falsche Portadresse benutzt.    }
   IF Out = 2 THEN BEGIN
      VOCInitDriver := FALSE;
      VOCErrStat    := 410;
      EXIT;
      END;

{ Falscher Interrupt benutzt.     }
   IF Out = 3 THEN BEGIN
      VOCInitDriver := FALSE;
      VOCErrStat    := 420;
      EXIT;
      END;
   END;

PROCEDURE VOCDeInstallDriver;
{
 * EINGABE  : keine
 * AUSGABE  : keine
 * FUNKTION : Ausschalten des Treibers und Freigabe des Speichers
}
VAR
   Check : BOOLEAN;
BEGIN
   IF VOCDriverInstalled THEN
   ASM
      MOV       BX,9
      CALL      VOCPtrToDriver
      END;
   Check := VOCFreeBuffer(VOCPtrToDriver);
   END;

PROCEDURE VOCSetSpeaker(OnOff:BOOLEAN);
{
 * EINGABE  : TRUE fÅr Lautspr. an, FALSE fÅr Lautspr. aus
 * AUSGABE  : keine
 * FUNKTION : EIN/AUS - Schalten des Lautsprechers der SB-Karte
}
VAR
   Switch : BYTE;
BEGIN
   Switch := Ord(OnOff) AND $01;
   ASM
      MOV       BX,4
      MOV       AL,Switch
      CALL      VOCPtrToDriver
      END;
   END;

PROCEDURE VOCOutput (BufferAddress : Pointer);
{
 * EINGABE  : Zeiger auf Sampledaten als Pointer
 * AUSGABE  : Keine
 * FUNKTION : Abspielen eines Samples
}
VAR
   VSeg, VOfs : WORD;
BEGIN
   VOCSetSpeaker(TRUE);
   VSeg := Seg(BufferAddress^);
   VOfs := Ofs(BufferAddress^)+VOCFileHeaderLength;
   ASM
      MOV       BX,6
      MOV       ES,VSeg
      MOV       DI,VOfs
      CALL      VOCPtrToDriver
      END;
   END;

PROCEDURE VOCOutputLoop (BufferAddress : Pointer);
{
 *    Unterschied zu VOCOutput :
 *    hier wird nicht vor jeder Ausgabe des Samples der Lautsprecher einge-
 *    schaltet, da dies beim abspielen einer Schleife bei manchen Sound-
 *    Blaster-Karten zu KnackgerÑuschen fÅhrt.
}
VAR
   VSeg, VOfs : WORD;
BEGIN
   VSeg := Seg(BufferAddress^);
   VOfs := Ofs(BufferAddress^)+VOCFileHeaderLength;
   ASM
      MOV       BX,6
      MOV       ES,VSeg
      MOV       DI,VOfs
      CALL      VOCPtrToDriver
      END;
   END;

PROCEDURE VOCStop;
{
 * EINGABE  : keine
 * AUSGABE  : keine
 * FUNKTION : Stoppen eines Samples
}
BEGIN
   ASM
      MOV       BX,8
      CALL      VOCPtrToDriver
      END;
   END;

PROCEDURE VOCPause;
{
 * EINGABE  : keine
 * AUSGABE  : keine
 * FUNKTION : Anhalten eines Samples
}
VAR
   Switch : WORD;
BEGIN
   VOCPaused := TRUE;
   ASM
      MOV       BX,10
      CALL      VOCPtrToDriver
      MOV       Switch,AX
      END;
   IF (Switch = 1) THEN BEGIN
      VOCPaused := FALSE;
      VOCErrStat := 510;
      END;
   END;

PROCEDURE VOCContinue;
{
 * EINGABE  : keine
 * AUSGABE  : keine
 * FUNKTION : Fortsetzen eines angehaltenen Samples
}
VAR
   Switch : WORD;
BEGIN
   ASM
      MOV       BX,11
      CALL      VOCPtrToDriver
      MOV       Switch,AX
      END;
   IF (Switch = 1) THEN BEGIN
      VOCPaused := FALSE;
      VOCErrStat := 520;
      END;
   END;

PROCEDURE VOCBreakLoop(BreakMode : WORD);
{
 * EINGABE  : Abbruchmodus
 * AUSGABE  : keine
 * FUNKTION : Abbrechen einer Sample-Schleife
}
BEGIN
   ASM
      MOV       BX,12
      MOV       AX,BreakMode
      CALL      VOCPtrToDriver
      MOV       BreakMode,AX
      END;
   IF (BreakMode = 1) THEN VOCErrStat := 500;
   END;

{$F+}
PROCEDURE VoiceToolsExitProc;
{$F-}
{
 * EINGABE  : keine
 * AUSGABE  : keine
 * FUNKTION : In der neuen ExitProc wird am Ende des Programms der
              Voice-Driver wieder deinstalliert.
}
BEGIN
   VOCDeInstallDriver;
   ExitProc := OldExitProc;
   END;

BEGIN
{
 * Die folgenden Befehle werden automatisch ausgefÅhrt, sobald die Unit
 * in ein Programm eingebunden wird, und dieses gestartet wird.
}
{ Verlegen der alten ExitProc auf die neue der Tool-Unit }
   OldExitProc := ExitProc;
   ExitProc := @VoiceToolsExitProc;
{ Grundwerte initialisieren }
   VOCStatusWord := 0;
   VOCErrStat    := 0;
   VOCPaused     := FALSE;
   VOCFileHeaderLength := $1A;
   VOCFileHeader :=
      'Creative Voice File'+#$1A+#$1A+#$00+#$0A+#$01+#$29+#$11+#$01;
{
 * VOCDriverInstalled enthÑlt nach der Installation entweder TRUE oder
 * FALSE, je nachdem, ob der Treiber erfolgreich installiert werden konnte,
 * oder nicht.
}
   VOCDriverInstalled := VOCInitDriver;
   END.
