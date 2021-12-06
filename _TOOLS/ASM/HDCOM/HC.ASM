;-----------------------------------------------------------------------------|
;  ---- ScanSoft(tm) 26HDCOM (C)1991 Cornel Huth -- All Rights Reserved ----  |
;-----------------------------------------------------------------------------|
;  program:     26HDCOM.ASM                                                   |
;  version:     2.01                                                          |
;       by:     Cornel Huth                                                   |
;     date:     12/06/90                                                      |
; function:     display hard drive status and COM port status on              |
;                 line 26 of CGA, EGA, VGA (color) and line 1 of MDA (mono)   |
;   caller:     user timer interrupt 1Ch (18.2 times/sec)                     |
;      use:                                                                   |
;                                                                             |
;   C>HC       * install TSR to monitor status                                |
;     HC /U    * remove from memory                                           |
;     HC /S    * sleep mode                                                   |
;     HC /R    * restore status line and awaken if in sleep mode              |
;     HC /Cn   * monitor COM port (n=1-4  0=off)                              |
;     HC /Mn   * select controller BIOS data interpret mode (n=1-4)           |
;     HC /H    * help                                                         |
;                                                                             |
;       If you're using an MDA, press <Alt> to deactivate status display      |
;       on line 1.  Or, use Scroll Lock (on) for continuous non-display       |
;                                                                             |
;       Some older CGA monitors overscan a bit and may obscure the corners    |
;       in line 26.                                                           |
;                                                                             |
;-----------------------------------------------------------------------------|

BIOS_SEG        SEGMENT AT 0040h
                ORG 17h
KBDflags1       db ?            ;keyboard toggle flags
;---------------
                ORG 41h
status          db ?            ;floppy controller error byte
drive           db ?            ;floppy drive
headHD_1        db ?            ;HD head [mode 1]
cylHI_1         label byte      ;bits 6 & 7 represent HI cylinder * 256 [mode 1]
secHD_1         label byte      ;bits 0 - 5 represent sector of HD [mode 1]
secHD_2         label byte      ;represents sector of HD [mode 2]
                db ?            ;ORG 44h
trackFD         label byte      ;track of floppy
cylLO_1         label byte      ;LO cylinder [mode 1]
cylLO_2         label byte      ;LO cylinder [mode 2]
                db ?            ;ORG 45h
headFD          label byte      ;head of floppy
cylHI_2         label byte      ;HI cylinder * 256 [mode 2]
                db ?            ;ORG 46h
secFD           label byte      ;sector of floppy
headHD_2        label byte      ;head HD [mode 2]
                db ?            ;ORG 47h
;---------------
                ORG 49h
modeCRT         db ?            ;current mode of video system
                ORG 63h
addrCRTC        dw ?            ;CRTC address register I/O port
                ORG 74h
HDerror         db ?            ;hard disk controller error byte
                ORG 84h
rowsCRT         db ?            ;# rows -1 (should be 24 for valid EGA/VGA)
                ORG 87h
EGAinfo         db ?            ;EGA info byte (0 only if 64K EGA or no EGA)
EGAinfo2        db ?            ;checked if EGAinfo = 0 (this is 0 if no EGA)
VGAinfo         db ?            ;VGA info byte used with EGAinfo...

BIOS_SEG        ENDS

CODE_SEG        SEGMENT PUBLIC 'CODE'
                ASSUME cs:CODE_SEG,ds:CODE_SEG,es:NOTHING

                org 100h
                ;need 16 bytes of constant data after go: for DUP install check
go:             jmp start

Copyright       db 13,10,'ScanSoft(tm)  26HDCOM v2.01 (C)1991 Cornel Huth'
                db 13,10,'Harddisk and communication port monitor',13,10,'$'
                db '12/06/90',13,10
                db 'HDmode:'
HDmode          db '1...';interpret mode
;                   12345678901234567890123456
ErrorMsgs       db 'OK                        ' ; 0h
                db 'BAD COMMAND               ' ; 1
                db 'ADDRESS MARK NOT FOUND    ' ; 2
                db 'WRITE PROTECT ERROR       ' ; 3
                db 'SECTOR NOT FOUND          ' ; 4
                db 'RESET FAILED              ' ; 5
                db 'DISKETTE REMOVED          ' ; 6
                db 'BAD PARAMETER TABLE       ' ; 7
                db 'DMA OVERRUN               ' ; 8
                db 'DMA ACROSS 64K BOUNDARY   ' ; 9
                db 'BAD SECTOR FLAG DETECTED  ' ; A
                db 'BAD TRACK FLAG DETECTED   ' ; B
                db 'BAD MEDIA TYPE            ' ; C
                db 'TOO MANY SECTORS ON FORMAT' ; D
                db 'CTRL DATA ADDR MARK FOUND ' ; E
                db 'DMA ARBTRA`N OUT-OF-RANGE ' ; F
                db 'UNCORRECTABLE ECC         ' ;10
                db 'ECC CORRECTED DATA FAILURE' ;11

                db 'GENERAL CONTROLLER FAILURE' ;20->12
                db '3x - UNKNOWN ERROR        '
                db 'SEEK FAILED               ' ;40  14
                db '5x - UNKNOWN ERROR        '
                db '6x - UNKNOWN ERROR        '
                db '7x - UNKNOWN ERROR        '
                db 'TIME-OUT                  ' ;80  18
                db '9x - UNKNOWN ERROR        '
                db 'DRIVE NOT READY           ' ;AA  1A
                db 'UNDEFINED ERROR OCCURED   ' ;BB  1B
                db 'WRITE FAULT               ' ;CC  1C
                db 'Dx - UNKNOWN ERROR        '
                db 'STATUS ERROR/ERROR REG = 0' ;E0  1E
                db 'SENSE OPERATION FAILED    ' ;FF  1F

VGA_data        dw 7    ;registers to change for VGA (reg, data)
VGA_26_data     db 11h,0Eh,06h,0CFh,12h,09Fh,15h,0A2h,10h,0ACh,16h,0A9h,11h,8Eh
VGA_25_data     db 11h,0Eh,06h,0BFh,12h,08Fh,15h,096h,10h,09Ch,16h,0B9h,11h,8Eh
VGA             db 0

EGA_data        dw 5    ;registers to change for EGA (reg, data)
EGA_26_data     db 06h,07Ah,12h,06Bh,15h,06Ch,10h,06Ch,16h,000h
EGA_25_data     db 06h,06Ch,12h,05Dh,15h,05Eh,10h,05eh,16h,00Ah
EGA             db 0

CGA_data        dw 1    ;registers to change
CGA_26_data     db 06h,26
CGA_25_data     db 06h,25
CGA             db 0    ;(MCGA may be compatible, not tested)

MDA_data        dw 0    ;registers to change (not enough RAM for 26 lines)
MDA_26_data     db 0,0
MDA_25_data     db 0,0
MDA             db 1    ;MDA is 'worst' case (or anytime in mode 7)

VALIDMODE       db 0    ;= 1 if operating in a compatible video mode
;even though the PIC won't allow another timer tick until we're done let's...
Busy1C          dw 0    ;= 1 if already in our New_1C routine
OLD_1C          dd 0    ;interrupt vector for old user timer interrupt
CRTCaddr        dw 0    ;CRTC reg addr
Video_Seg       dw 0    ;segment of video diplay memory
StatLnOff       dw 0    ;offset into video buffer of Status line (4000/26,0/1)
StatLnAttr      db 0    ;character attribute of StatLn
CmdLineParm     db 0    ;command line parameter  (preceded by a /)
CmdLineValue    dw 0    ;command line value (follows :)
;                             1         2         3         4         5         6         7
;                   01234567890123456789012345678901234567890123456789012345678901234567890123456789
;               db 'C:1023 Hd:15 Sc:63  12345678901234567890123456 xxx
StatLn          db 'Z:0000 Hd:00 Sc:00                                                              '
StatLnend       equ $

ErrTrip         dw 36   ;ticks to count to and then release last disk error
ErrTicks        dw 0    ;tick cnt since last disk error (to save error msg)

HDstat          db 0    ;hard disk status save
LastDiskError   db 0    ;last disk error
DoCom           db 0    ;= 1 then display com status

ComPort         dw 0
PinText         DB 'DTRRTSCTSDSRRI DCD'
Psettings       DB 'NONE'
Pins            DB 0    ;bit 0=DTR,1=RTS,2=CTS,3=DSR,4=RI,5=DCD
BaudRate        DW 0
Parity          DB 0
DataBits        DB 0
StopBits        DB 0
Dlab_reg        DB 0
      
New_1C          PROC FAR
                ASSUME  ds:NOTHING, es:NOTHING
                sti
                push    ax
                push    bx
                push    cx
                push    dx
                push    bp
                push    di
                push    si
                push    es
                push    ds
                cld
                mov     ax,cs
                mov     ds,ax
                ASSUME  ds:CODE_SEG

                inc     ErrTicks        ;error save ticker
                cmp     Busy1C,0        ;are we BUSY?
                jne     New_1Cxit
                mov     Busy1C,1        ;no, make us BUSY

                mov     ax,0040h
                mov     es,ax           ;point es to BIOS data
                ASSUME  es:NOTHING

New_1C1:        call    Xlate_BIOS      ;do DISK

                cmp     DoCom,0         ;show COM status?
                je      New_1C2         ;nope

                push    es
                call    SetParms        ;do COM
                call    Refresh
                pop     es

New_1C2:        call    Get_Video_Info

                cmp     VALIDMODE,1     ;are we valid?
                jne     New_1Cxit       ;no
                mov     dx,offset StatLn
                mov     cx,offset StatLnend - offset StatLn
                mov     ah,StatLnAttr

                cmp     MDA,1
                jne     New_1C3
                test    es:KBDflags1,18h ;is <Alt> down or <Scroll Lock> on?
                jnz     New_1Cxit        ;yes, no display of MDA status

New_1C3:        mov     bp,Video_Seg
                mov     es,bp
                ASSUME  es:NOTHING
                mov     bx,StatLnOff     ;add offset into video buff of StatLn
                mov     di,bx            ;es:di -> destination
                mov     si,dx            ;ds:si -> source
New_1C4:        lodsb                    ;get a character from the write buffer
                stosw                    ;store it and the attribute
                loop    New_1C4          ;print cx char/attr pairs

New_1Cxit:      pop     ds
                pop     es
                ASSUME  ds:NOTHING,es:NOTHING
                pop     si
                pop     di
                pop     bp
                pop     dx
                pop     cx
                pop     bx
                pop     ax
                cli
                mov     cs:Busy1C,0
                jmp     cs:OLD_1C
New_1C          ENDP

; Get video system information
;  enter with es->BIOS data area

Get_Video_Info  PROC NEAR
                ASSUME  ds:CODE_SEG,es:NOTHING
                sub     ax,ax
                mov     VALIDMODE,al
                mov     CGA,al
                mov     EGA,al
                mov     VGA,al
                inc     ax
                mov     MDA,al          ;assume 'worst case'

                mov     al,es:modeCRT   ;get current BIOS video mode
                cmp     al,3            ;valid modes= 2,3,7
                je      GVI0
                cmp     al,7
                je      GVI0
                cmp     al,2
                je      GVI0
GVIjmp:         jmp     GVIxit          ;not a valid video mode

                ; get the CRTC port address

GVI0:           cmp     es:addrCRTC,03D4h       ;color adapter?
                jne     GVI1 ;BTW, let's just stay on page 0

                mov     MDA,0                   ;yes
                mov     Video_Seg,0B800h        ;video base segment of color
                mov     CRTCaddr,03D4h          ;its controller (std)
                mov     StatLnOff,4000          ;StatLn offset (line 26)
                mov     StatLnAttr,0+(2*16)     ;black on green
                jmp     short GVI2

GVI1:           mov     Video_Seg,0B000h        ;mono's video base segment
                mov     CRTCaddr,03B4h          ;its controller (std)
                mov     StatLnOff,0             ;StatLn offset (line 1)
                mov     StatLnAttr,70h          ;reverse video
                jmp     short GVI4

GVI2:           cmp     es:EGAinfo,0            ;64K EGA/VGA or no EGA/VGA?
                jne     GVI2a                   ;no, an EGA/VGA with >64K
                cmp     es:EGAinfo2,0           ;no EGA/VGA at all?
                je      GVI3                    ;should be a CGA
                cmp     es:rowsCRT,24           ;EGA or VGA should be in
                ja      GVIxit                  ; 25 line mode (not 43 or 50...)
GVI2a:          test    es:VGAinfo,11h          ;400 scanlines & VGA active?
                jz      GVI2b                   ;no, it's not a valid VGA
                mov     VGA,1
                jmp     short GVI4
GVI2b:          mov     EGA,1                   ;and should be an EGA
                jmp     short GVI4
GVI3:           mov     CGA,1                   ;it's CGA
GVI4:           mov     VALIDMODE,1

GVIxit:         ret
Get_Video_Info  ENDP

Xlate_BIOS      PROC NEAR
                ASSUME  ds:CODE_SEG,es:NOTHING
                ;enter with es->BIOS SEG

                mov     al,es:HDerror   ;get HD controller status
                mov     HDstat,al

XLB1:           cmp     al,11h          ;max linear error number
                jbe     XLB2
                mov     cl,4
                shr     al,cl
                add     al,10h          ;make 20h,40,80...to 12h,14h,18h...

XLB2:           xor     ah,ah
                cmp     al,LastDiskError ;same disk error as last?
                je      XLB2b            ;yes, reset error wait

                ;we know it's a different error than last

                or      al,al            ;an error?
                jnz     XLB2b            ;yes, must be new one

XLB2a:          mov     cx,ErrTicks     ;ticks since last disk error
                cmp     cx,ErrTrip      ;...more than ticks to wait?
                jb      XLB2c           ;no, wait some more

XLB2b:          mov     LastDiskError,al ;update last error
                mov     ErrTicks,0      ;zero error wait tick count
                mov     bx,26           ;bytes per error message
                mov     cx,bx           ;for count
                mul     bx              ;error offset into ErrorMsgs

                mov     si,offset ErrorMsgs
                add     si,ax
                mov     di,offset StatLn+20

                push    es
                push    cs
                pop     es              ;es:di -> write buffer
                ASSUME  es:NOTHING

                rep     movsb           ;write the message to the write buffer
                pop     es              ;get back es->BIOS
                ASSUME  es:NOTHING

XLB2c:          cmp     HDmode,'4'        ;monitor second drive?
                mov     al,"D"
                sbb     al,0            ;if we're in mode 3,2,1 then use 'C'
                mov     [StatLn+0],al

                cmp     HDmode,'3'
                je      XL_HD_3
                cmp     HDmode,'2'
                je      XL_HD_2
                cmp     HDmode,'1'
                je      XL_HD_1
                jmp     XL_HD_4

;******* [MODE 1] *******

XL_HD_1:        mov     al,es:headHD_1  ;head
                add     al,'0'
                mov     [StatLn+11],al  ;(A)

                mov     ah,es:cylHI_1   ;let's get the cyl hi
                rol     ah,1            ;move cyl hi bits @ 6&7 to bits 0&1
                rol     ah,1
                and     ah,00000011b    ;isolate cyl hi
                mov     al,es:cylLO_1   ;cylinder low (ax = 10 bit cylinder)
                mov     di,offset StatLn+2
                mov     cx,4            ;number of digits
                call    AX2DEC

                mov     al,es:cylHI_1   ;isolate sector
                and     al,00111111b    ;bits 0 - 5
                xor     ah,ah
                inc     ax              ;make sector 1-based [mode 1 ONLY]
                mov     di,offset StatLn+16-2   ;-2 since cx = 4-2
                mov     cx,2
                call    AX2DEC
                ret

;******* [MODE 2] *******

XL_HD_2:        mov     al,es:headHD_2  ;head
                and     al,00001111b
                add     al,'0'
                mov     [StatLn+11],al  ;(A)

                mov     ah,es:cylHI_2   ;let's get the cyl hi
                mov     al,es:cylLO_2   ;cylinder low (ax = 10 bit cylinder)
                mov     di,offset StatLn+2
                mov     cx,4            ;number of digits
                call    AX2DEC

                mov     al,es:secHD_2   ;controller updates less than mode 1
                and     al,00111111b    ;bits 0 - 5 will be valid
                xor     ah,ah
                mov     di,offset StatLn+16-2   ;-2 since cx = 4-2
                mov     cx,2
                call    AX2DEC
                ret

;******* [MODE 3] *******

XL_HD_3:        mov     dx,01F6h
                in      al,dx           ;drive/head (io 1F6h)
                and     al,00001111b
                mov     di,offset StatLn+10-2
                mov     cx,2
                call    AX2DEC

                mov     dx,01F5h
                in      al,dx           ;cyl hi (io 1F5h)
                and     al,00000011b
                mov     ah,al
                dec     dx
                in      al,dx           ;cyl lo (io 1F4h)
                mov     di,offset StatLn+2
                mov     cx,4            ;number of digits
                call    AX2DEC

                mov     dx,01F3h
                in      al,dx           ;sector (io 1F3h)
                and     al,00111111b
                xor     ah,ah
                mov     di,offset StatLn+16-2   ;-2 since cx = 4-2
                mov     cx,2
                call    AX2DEC
                ret

;******* [MODE 4] *******

XL_HD_4:        mov     dx,0176h
                in      al,dx           ;head (io 176h)
                and     al,00001111b
                mov     di,offset StatLn+10-2
                mov     cx,2
                call    AX2DEC

                mov     dx,0175h
                in      al,dx           ;cyl hi (io 175h)
                and     al,00000011b
                mov     ah,al
                dec     dx
                in      al,dx           ;cyl lo (io 174h)
                mov     di,offset StatLn+2
                mov     cx,4            ;number of digits
                call    AX2DEC

                mov     dx,0173h
                in      al,dx           ;sector (io 173h)
                and     al,00111111b
                xor     ah,ah
                mov     di,offset StatLn+16-2   ;-2 since cx = 4-2
                mov     cx,2
                call    AX2DEC
                ret

Xlate_BIOS      ENDP
                    
;  ENTER with:
;       ax = int value 0-99999
;       cx = number of digits to interpret
;       di -> buffer
;  EXIT with:
;       ASCII value of ax in di->buffer

AX2DEC          PROC NEAR
                ASSUME  ds:CODE_SEG

                ;divide by 10 - get remainder
                mov     bx,10                   ; divisor
                xor     dx,dx                   ; using AX as dividend
                div     bx                      ; remainder in dx
                add     dl,"0"                  ; to ASCII
                mov     byte ptr [di+3],dl      ; store it
                cmp     cx,1
                je      AX2DECxit
                ;tens
                xor     dx,dx
                div     bx
                add     dl,"0"
                mov     byte ptr [di+2],dl
                cmp     cx,2
                je      AX2DECxit
                ;hundreds
                xor     dx,dx
                div     bx
                add     dl,"0"
                mov     byte ptr [di+1],dl
                cmp     cx,3
                je      AX2DECxit
                ;thousands
                xor     dx,dx
                div     bx
                add     dl,"0"
                mov     byte ptr [di],dl
                cmp     cx,4            ;(A)
                je      AX2DECxit       ; |
                ;ten-thousands          ; |
                xor     dx,dx           ; |
                div     bx              ; |
                add     dl,"0"          ; |
                mov     byte ptr [di-1],dl
AX2DECxit:      ret

AX2DEC          ENDP

;
;COM routine adapted from LITES.ASM (PC MAG V8N5 p.315)
;

SETPARMS        PROC    NEAR
                ASSUME  ds:CODE_SEG
                MOV     DX,COMPORT              ;get UART base address
                ADD     DX,3                    ;point DX to Data Format
                PUSH    DX
                IN      AL,DX                   ;read Data Format byte
                MOV     DLAB_REG,AL             ;save it
                OR      AL,80H                  ;set DLAB
                OUT     DX,AL
                SUB     DX,3                    ;read divisor LSB
                IN      AL,DX
                MOV     BL,AL
                INC     DX
                IN      AL,DX                   ;read divisor MSB
                MOV     BH,AL
                OR      BX,BX                   ;don't divide if BX = 0
                JNZ     SP1
                MOV     WORD PTR BAUDRATE,0
                JMP     SHORT SP2
SP1:            MOV     AX,0C200H               ;calculate Baud rate from
                MOV     DX,1                    ;  clock and divisor
                DIV     BX
                MOV     BAUDRATE,AX             ;save it
SP2:            POP     DX                      ;restore Data Format register
                MOV     AL,DLAB_REG
                OUT     DX,AL
;
;Determine what the parity, data bits, and stop bits settings are.
;
                MOV     AL,DLAB_REG            ;data bits in bits 0 and 1
                AND     AL,3
                ADD     AL,5
                MOV     DATABITS,AL
                MOV     AL,DLAB_REG            ;stop bits in bit 2
                SHR     AL,1
                SHR     AL,1
                AND     AL,1
                ADD     AL,1
                MOV     STOPBITS,AL
                MOV     BL,DLAB_REG            ;parity in bits 3 and 4
                MOV     CL,3
                SHR     BL,CL
                AND     BL,3
                XOR     BH,BH
                MOV     AL,BYTE PTR PSETTINGS[BX]
                MOV     PARITY,AL
;
;Determine the states of the CTS, DSR, DCD, and RI input pins.
;
                MOV     DX,COMPORT              ;point DX to Modem Status
                ADD     DX,6
                IN      AL,DX                   ;read register
                AND     AL,0F0H                 ;mask off the lower 4 bits
                SHR     AL,1                    ;then save them
                SHR     AL,1
                MOV     PINS,AL
;
;Determine the states of the RTS and DTR output pins.
;
                SUB     DX,2                    ;point DX to Modem Control
                IN      AL,DX                   ;read register
                AND     AL,3                    ;strip the upper 6 bits
                OR      PINS,AL                 ;store in PINS byte
                RET
SETPARMS        ENDP

REFRESH         PROC    NEAR
                ASSUME  ds:CODE_SEG
                MOV     AX,CS
                MOV     ES,AX                   ;es->our SEG
                ASSUME  es:nothing
;
;Construct the portion of the string pertaining to the 6 pins.
;
                MOV     SI,OFFSET PINTEXT               ;point SI to text
                MOV     DI,OFFSET StatLn + 48-1 ;(A)    ;point DI to buffer
                push    di
                mov     al,20h                  ;clear COM area
                mov     cx,33   ;(A)            ;32 bytes
                rep     stosb                   ;at es:di
                pop     di
                MOV     BL,1
                MOV     CX,6                    ;6 pins to test
RLOOP1:         PUSH    CX
                PUSH    SI
                PUSH    DI
                TEST    PINS,BL                 ;copy pin name to buffer if
                JZ      PINLOW                  ;  corresponding bit is set
                MOV     CX,3
RLOOP2:         LODSB
                STOSB
                LOOP    RLOOP2
PINLOW:         POP     DI
                POP     SI
                SHL     BL,1
                ADD     SI,3
                ADD     DI,4
                POP     CX
                LOOP    RLOOP1                  ;loop until all 6 are done
;
;Add Baud rate, parity, data bits, and stop bits indicators to the string.
;
                MOV     AX,BAUDRATE             ;Baud rate
                mov     di,offset StatLn+48+24
                mov     cx,5    ;(A)
                call    AX2DEC
                MOV     DI,OFFSET StatLn + 48 + 29
                MOV     AL,PARITY               ;parity
                STOSB
                MOV     AL,DATABITS             ;data bits
                ADD     AL,30H
                STOSB
                MOV     AL,STOPBITS             ;stop bits
                ADD     AL,30H
                STOSB
                RET
REFRESH         ENDP

                ;================================================
                ;let's install it - CODE AFTER start: IS NOT KEPT
                ;================================================

                ASSUME  cs:CODE_SEG,ds:CODE_SEG,ss:CODE_SEG

start:          cld
                mov     dx,offset Copyright
                mov     ah,9
                int     21h

                call    GetParm

                ;---------------------
                not     byte ptr go     ;modify to avoid self-match
                xor     bx,bx           ;start search at segment zero (really 1)
                mov     ax,cs           ;compare to current code segment
start1:         inc     bx              ;look at next segment
                cmp     ax,bx           ;until reaching this code seg
                mov     es,bx
                je      start3
                mov     si,offset go    ;set up to compare strings
                mov     di,si
                mov     cx,16           ;16 bytes must match
                rep     cmpsb           ;compare ds:si to es:di
                or      cx,cx           ;did the strings match?
                jnz     start1          ;if no match, try next segment
                                        ;else fall through (already installed)
                                        ; with es -> matching code segment

                and     CmdLineParm,255-32 ;make it UPPERCASE now
                cmp     CmdLineParm,'U' ;unchain
                jne     start?
                jmp     Unchain
start?:         cmp     CmdLineParm,'H' ;help
                jne     startC
                mov     dx,offset Use
                mov     ah,9
                int 21h
                mov     al,0
                jmp     Exit4c

startC:         cmp     CmdLineParm,'C' ;do COM port
                jne     startR
                jmp     ComPortit
startR:         cmp     CmdLineParm,'R' ;restore 26 lines; awaken if dormant
                jne     startD
                jmp     RedoStatLn
startD:         cmp     CmdLineParm,'S' ;sleep
                jne     startM
                jmp     Sleep
startM:         cmp     CmdLineParm,'M' ;controller interpret mode
                jne     startElse
                jmp     ModeSelect
startElse:      mov     dx,offset UseBeep
                cmp     CmdLineParm,0
                jne     start2          ;invalid parm
                mov     dx,offset DupMsg;no parms?,(/) already installed msg
start2:         mov     ah,9
                int 21h
                mov     al,1
                jmp     Exit4c

start3:         mov     dx,offset Use   ;we're not installed
                mov     ah,9
                int 21h
                jmp     notinstalled

                ;---------------------
                ;es->match segment

ComPortit:      mov     di,offset StatLn + 48   ;point DI to buffer
                mov     al,20h                  ;clear COM area
                mov     cx,32                   ;32 bytes
                rep     stosb                   ;at es:di

                mov     ax,CmdLineValue
                xchg    ah,al
                cmp     al,'0'                  ;0, turn it off
                je      ComPortit1
                mov     dx,offset NoComMsg
                jb      ComPortitErr            ;below 0
                cmp     al,'4'                  ;or
                ja      ComPortitErr            ;above 4 is an error
                jmp     short ComPortit2

ComPortit1:     mov     es:DoCom,0
                mov     dx,offset ComPortOffMsg
                jmp     ComPortitX

ComPortit2:     mov     ComPortM,al
                SUB     AL,"1"                  ;normalize the entry(0-based)
                MOV     BL,AL                   ;save it
                ;* THE NEXT 6 LINES ARE NOT ASSEMBLED BECAUSE IF YOU
                ;* ARE USING COM PORT 2 WITHOUT ANYTHING IN COM 1 THEN
                ;* YOU CAN'T USE /C:2 BECAUSE INT 11 RETURNS ONLY THE
                ;* NUMBER OF SERIAL DEVICES...
                ;INT     11H                     ;determine number of COM
                ;SHR     AH,1                    ;  ports installed
                ;AND     AH,07H
                ;MOV     DX,OFFSET NoComMsg
                ;CMP     AH,BL                   ;exit on error if COM port
                ;JNA     start2                  ;  number is invalid
                push    es
                MOV     BYTE PTR COMPORT,BL     ;save port designator
                MOV     AX,40H                  ;get UART address from BIOS
                MOV     ES,AX                   ;  data area using the port
                XOR     DI,DI                   ;  number as an index into
                MOV     BX,COMPORT              ;  the table
                SHL     BX,1                    ;IF YOU HAVE MORE THAN 4 SERIAL
                MOV     AX,WORD PTR ES:[DI][BX] ;DEVICES YOU HAVE TO FIND OUT
                pop     es                      ;WHERE THEIR BASE ADDR IS...
                MOV     es:COMPORT,AX           ;ID COM port in TSR
                mov     es:DoCom,1              ;flag COM port monitoring
                mov     dx,offset ComMsg
ComPortitX:     mov     ah,9
                int 21h
                mov     al,0
                jmp     Exit4c

ComPortitErr:   mov     ah,9
                int 21h
                mov     al,2                    ;COM errorlevel = 2
                jmp     Exit4c

                ;---------------

ModeSelect:     mov     ax,CmdLineValue
                cmp     ah,'1'
                jb      ModeSelectErr           ;below 1
                cmp     ah,'4'                  ;or
                ja      ModeSelectErr           ;above 4 is an error
                mov     ModeM,ah
                mov     es:HDmode,ah
                mov     dx,offset ModeMsg

ModeSelect1:    mov     ah,9
                int 21h
                mov     al,0
                jmp     Exit4c

ModeSelectErr:  mov     dx,offset BadModeMsg
                mov     ah,9
                int 21h
                mov     al,3            ;MODE errorlevel = 3
                jmp     Exit4c
  
                ;---------------------
Sleep:          push    es              ;save TSR's segment

                mov     es:ErrTicks,0

                mov     ax,351Ch        ;get current timer interrupt (1Ch)
                int     21h
                pop     ax
                mov     dx,es
                cmp     ax,dx           ;compare matched seg with 1Ch seg
                jne     Sleep2          ;cannot sleep since seg has changed
                push    ax
                pop     es              ;get back es
                mov     dx,es:word ptr Old_1C
                mov     ax,es:word ptr Old_1C+2
                mov     ds,ax
                mov     ax,251Ch
                int 21h
                mov     ax,cs           ;restore ds
                mov     ds,ax
                push    es              ;save es
                mov     ax,0040h
                mov     es,ax           ;requirement of Get_Video_Info
                call    Get_Video_Info
                pop     es              ;get it back
                cmp     VALIDMODE,1
                mov     ax,0
                push    ax              ;save errorlevel
                jne     Sleep1
                call    Set_Line25      ;only if in a valid mode
Sleep1:         mov     dx,offset SleepMsg
                jmp     short Sleep3
Sleep2:         mov     dx,offset NoSleepMsg
                mov     ax,4            ;sleep errorlevel = 4
                push    ax              ;save errorlevel
Sleep3:         mov     ah,9
                int 21h
                pop     ax
                jmp     Exit4c
                
                ;---------------------
RedoStatLn:     push    es              ;save es
                mov     ax,0040h
                mov     es,ax           ;requirement of Get_Video_Info
                call    Get_Video_Info
                pop     es              ;get it back
                cmp     VALIDMODE,1
                je      RedoStatLn1
                mov     dx,offset NoRestoreMsg
                mov     ah,9
                int 21h
                mov     al,5            ;RESTORE errorlevel = 5
                jmp     Exit4c
RedoStatLn1:    call    Set_Line26
                mov     dx,offset Redo26Msg
                mov     ah,9
                int 21h
                push    es              ;save es
                mov     ax,351Ch        ;get current timer interrupt (1Ch)
                int     21h             ; since it may have changed
                mov     cx,es           ;save int 21h's es into cx
                pop     es              ;get back es
                mov     dx,es
                cmp     cx,dx           ;if interrupt 1Ch has changed
                jne     RedoStatLn2     ; then need to awaken
                je      RedoStatLn3
RedoStatLn2:    mov     es:word ptr [Old_1C],bx    ;save current offset in TSR
                mov     es:word ptr [Old_1C+2],cx  ;save current segment
                mov     dx,offset New_1C
                push    es
                pop     ds              ;matching code seg
                ASSUME  ds:NOTHING
                mov     ax,251Ch
                int     21h             ;set interrupt (1Ch) (time to awaken)
                push    cs
                pop     ds              ;get back ds
                ASSUME  ds:CODE_SEG
RedoStatLn3:    mov     ah,0
                jmp     Exit4c

                ;---------------------
                ;es -> matching segment
Unchain:        push    es              ;save TSR's segment
                mov     ax,351Ch        ;get current timer interrupt (1Ch)
                int     21h
                pop     ax
                mov     dx,es
                cmp     ax,dx           ;compare matched seg with 1Ch seg
                jne     Unchain4        ;cannot unchain since seg has changed
                mov     es,ax           ;get back es
                mov     dx,es:word ptr Old_1C
                mov     ax,es:word ptr Old_1C+2
                mov     ds,ax
                mov     ax,251Ch        ;set timer interrupt to interrupt valid
                int 21h                 ; when installed
                mov     ax,cs           ;restore ds
                mov     ds,ax

                not     es:byte ptr go  ;precludes matching on next install

                mov     cx,es           ;save es -> PSP/COM BLOCK (not in EXE's)
                mov     bx,es:[002Ch]   ;segment address of environment block
                mov     es,bx
                mov     ah,49h
                int 21h                 ;release the environment block
                jc      Unchain1        ;an error

                mov     es,cx
                mov     ah,49h          ;release the TSR block
                int 21h
                jnc     Unchain2

Unchain1:       mov     dx,offset DeAllocMsg ;memory dealloc error
                mov     ah,9
                int     21h
                mov     al,7            ;REMOVE errorlevel = 7
                jmp     short Exit4c

Unchain2:       push    es              ;save es (though not needed)
                mov     ax,0040h
                mov     es,ax
                call    Get_Video_Info
                pop     es              ;get it back
                cmp     VALIDMODE,1
                jne     Unchain3
                call    Set_Line25      ;only if in a valid mode

Unchain3:       mov     dx,offset UniMsg
                mov     ah,9
                int 21h
                mov     al,0

                ;---------------------
Exit4c:         mov     ah,4Ch
                int 21h

                ;---------------------
Unchain4:       mov     dx,offset NoUnchain
                mov     ah,9
                int 21h
                mov     al,6            ;UNCHAIN errorlevel = 6
                jmp     short Exit4c

                ;---------------------
notinstalled:   cmp     CmdLineParm,0   ;not yet installed, should be no parms
                je      notinstalled1
                mov     dx,offset NotInstalledMsg
                mov     ah,9
                int 21h
                mov     al,1            ;INSTALL errorlevel = 1
                jmp     short Exit4c

                ;---------------------
notinstalled1:  push    es              ;save es (though not needed here)
                mov     ax,0040h
                mov     es,ax
                call    Get_Video_Info
                pop     es              ;get it back
                cmp     VALIDMODE,1     ;are we in a valid mode?
                je      notinstalled2
                mov     dx,offset NoInstallMsg
                mov     ah,9
                int 21h
                mov     al,1            ;INSTALL errorlevel = 1
                jmp     short Exit4c

                ;---------------------
notinstalled2:  mov     ax,351Ch        ;get timer interrupt (1Ch)
                int     21h
                mov     word ptr [Old_1C],bx    ;save offset
                mov     word ptr [Old_1C+2],es  ;save segment
                mov     dx,offset New_1C
                mov     ax,251Ch
                int     21h             ;set new interrupt (1Ch)

                call    Set_Line26

                call    EntryAt
                mov     dx,offset EntryAtMsg   ;1Ch entry address
                mov     ah,9
                int 21h

                cmp     MDA,1           ;in mode 7?
                jne     notinstalled3
                mov     dx,offset MDAmsg
                mov     ah,9
                int 21h

notinstalled3:  mov     dx,offset start
                mov     cl,4
                shr     dx,cl
                inc     dx
                mov     ax,3100h
                int     21h     ;Terminate - stay resident (keep up to start)

                ;---------------------
GetParm:        mov     si,81h
                mov     CmdLineParm,0
                mov     CmdLineValue,0
GetParm1:       mov     bl,[si]
                cmp     bl,0dh
                je      GetParm_Exit
                inc     si
                cmp     bl,'/'
                jne     GetParm1
                mov     bl,[si]
                mov     CmdLineParm,bl
                inc     si              ;get 2 ASCII bytes after the :
                mov     bx,[si]
                xchg    bl,bh           ;put them in normal order
                mov     CmdLineValue,bx
GetParm_Exit:   ret

;
; two-byte ASCII in ax to byte in al (al=0 if number invalid or entry was 0)
; ah=1st digit  al=2d digit
;
 
ConvASCIIw2Byte PROC NEAR
                ASSUME ds:CODE_SEG

                cmp     al,0dh          ;ending CR (check this first)
                je      ConvAsingleL
                cmp     al,' '          ;ending space
                je      ConvAsingleL
                cmp     ah,' '          ;leading space
                je      ConvAsingleR
                cmp     ah,'0'          ;leading zero
                je      ConvAsingleR

                ;convert 2-digit ASCII number to byte

                cmp     ah,'9'          ;check bounds on ten's digit
                ja      ConvAnull
                cmp     ah,'0'
                jb      ConvAnull
                cmp     al,'9'          ;and on one's digit
                ja      ConvAnull
                cmp     al,'0'
                jb      ConvAnull
                sub     ah,'0'
                sub     al,'0'          ;normalize
                mov     cx,ax           ;save number
                mov     al,ah           ;get ten's digit in al
                mov     bl,10
                mul     bl              ;ax = 10*ten's digit
                add     al,cl           ;add in one's digit
                ret

ConvAsingleL:   cmp     ah,'9'          ;AL was space or CR
                ja      ConvAnull
                cmp     ah,'0'
                jb      ConvAnull
                sub     ah,'0'
                mov     al,ah
                ret

ConvAsingleR:   cmp     al,'9'          ;AH was space or zero
                ja      ConvAnull
                cmp     ah,'0'
                jb      ConvAnull
                sub     al,'0'
                ret

ConvAnull:      mov     al,0
                ret

ConvASCIIw2Byte ENDP

;
; byte in al to two-byte ASCII hex in ax (A5 to 'A5')
;

ConvByte2ASCII  PROC NEAR
                ASSUME  ds:CODE_SEG

                push    cx
                mov     cl,4            ;mult x 16
                xor     ah,ah           ;just the low-order byte
                push    ax              ;save data passed in AX
                and     al,0F0h         ;hi-order nybble
                shr     al,cl           ;div hi-nybble by 16
ConvB:          cmp     al,9            ;hex letter?
                jna     ConvBdec
                add     al,55           ;10+55=65(A)
                jmp     short ConvB1
ConvBdec:       add     al,'0'          ;adjust ASCII to decimal 9+30h(0)=39h(9)
ConvB1:         cmp     cl,0            ;done both ASCII bytes?
                je      ConvB2          ;*** exit 2x loop here
                xchg    al,ch           ;save it
                pop     ax              ;get it again
                and     al,0Fh          ;low-order nybble
                mov     cl,0            ;make it last time around
                jmp     short ConvB     ;do low-order nybble
ConvB2:         xchg    ch,ah           ;get hi-order
                xchg    al,ah           ;put in correct order
                clc                     ;and we're done
                pop     cx
                ret

ConvByte2ASCII  endp

;
; get 1Ch entry address
;

EntryAt         PROC NEAR
                ASSUME  ds:CODE_SEG

                mov     bx,offset EntryAtMsg+10
                mov     ax,cs
                xchg    ah,al
                call    ConvByte2ASCII  ;seg high byte
                mov     word ptr [bx],ax
                mov     ax,cs
                call    ConvByte2ASCII  ;seg low byte
                mov     word ptr [bx+2],ax
                mov     ax,offset New_1C
                xchg    ah,al
                call    ConvByte2ASCII  ;off high byte
                mov     word ptr [bx+5],ax
                mov     ax,offset New_1C
                call    ConvByte2ASCII  ;off low byte
                mov     word ptr [bx+7],ax

                mov     al,HDmode
                mov     ModeM,al
                ret

EntryAt         ENDP

;
; program CRTC to display 26 lines
;

Set_Line26      PROC NEAR
                ASSUME  ds:CODE_SEG

                cmp     MDA,1                   ;skip if MDA
                jne     SL261
                ret
SL261:          mov     dx,CRTCaddr             ;CRTC port address
                cmp     VGA,1
                jne     SL26_EGA
                mov     cx,VGA_data
                mov     si,offset VGA_26_data
                jmp     short SL26_LR
SL26_EGA:       cmp     EGA,1
                jne     SL26_CGA
                mov     cx,EGA_data
                mov     si,offset EGA_26_data
                jmp     short SL26_LR
SL26_CGA:       mov     cx,CGA_data
                mov     si,offset CGA_26_data
SL26_LR:        cli                             ;interrupts off
SL26_LR1:       lodsb
                out     dx,al                   ;CRTC register
                lodsb
                inc     dx
                out     dx,al                   ;data
                dec     dx
                loop    SL26_LR1
                sti                             ;interrupts on
                ret
Set_Line26      ENDP

;
; program CRTC to display 25 lines
;

Set_Line25      PROC NEAR
                ASSUME  ds:CODE_SEG

                cmp     MDA,1
                jne     SL251
                ret
SL251:          mov     dx,CRTCaddr
                cmp     VGA,1
                jne     SL25_EGA
                mov     cx,VGA_data
                mov     si,offset VGA_25_data
                jmp     short SL25_LR
SL25_EGA:       cmp     EGA,1
                jne     SL25_CGA
                mov     cx,EGA_data
                mov     si,offset EGA_25_data
                jmp     short SL25_LR
SL25_CGA:       mov     cx,CGA_data
                mov     si,offset CGA_25_data
SL25_LR:        cli
SL25_LR1:       lodsb
                out     dx,al
                lodsb
                inc     dx
                out     dx,al
                dec     dx
                loop    SL25_LR1
                sti
                ret
Set_Line25      ENDP

;---------------
DeAllocMsg      db '*** Error in releasing memory - suggest a REBOOT ASAP!'
                db 13,10,7,'$'
NoSleepMsg      db '*** Cannot become dormant - interrupt 1Ch has changed.'
                db 13,10,7,'$'
NoInstallMsg    db '*** Cannot install - must be in BIOS video modes 2, 3, or 7 (25 lines).'
                db 13,10,7,'$'
NoRestoreMsg    db '*** Cannot restore - must be in BIOS video modes 2, 3, or 7 (25 lines).'
                db 13,10,7,'$'
NoUnchain       db '*** Cannot remove from memory - interrupt 1Ch has changed.'
                db 13,10,7,'$'
NotInstalledMsg db '*** Parameter ignored - install program first.'
                db 13,10,7,'$'
DupMsg          db '*** Already installed - use /R to restore, /H for help.'
                db 13,10,7,'$'
NoComMsg        db '*** COM port parameter not valid (0-4).'
                db 13,10,7,'$'
BadModeMsg      db '*** Invalid controller interpret mode (1-4).'
                db 13,10,7,'$'

UseBeep         db 7
Use             db 'Use HC         * install TSR to monitor status',13,10
                db '    HC /U      * uninstall & release memory',13,10
                db '    HC /S      * sleep mode',13,10
                db '    HC /R      * restore status line and awaken if in sleep mode',13,10
                db '    HC /Cn     * monitor COM port (n=1-4  0=off)',13,10
                db '    HC /Mn     * select controller BIOS data interpret mode (n=1-4)',13,10
                db '    HC /H      * help',13,10
                db 13,10,'$'
EntryAtMsg      db 'INT 1Ch:  0000:0000',13,10
ModeMsg         db 'Controller interpret mode:'
ModeM           db '0'
                db 13,10,'$'
UniMsg          db 'Uninstalled & released from memory.'
                db 13,10,'$'
SleepMsg        db 'Sleep mode.  Use /R to restore.'
                db 13,10,'$'
Redo26Msg       db 'Restored.'
                db 13,10,'$'
ComMsg          db 'COM'
ComPortM        db 'x: monitoring activated.'
                db 13,10,'$'
ComPortOffMsg   db 'COM port monitoring deactivated.'
                db 13,10,'$'
MDAmsg          db 13,10,'Use <Alt> or <Scroll Lock> to toggle display line.'
                db 13,10,'$'
 
CODE_SEG        ENDS
                END go
