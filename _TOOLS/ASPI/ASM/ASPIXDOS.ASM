	PAGE	63,132
	.386
	%NoIncl
	%Macs
	%NoMacs
	%NoSyms
IFDEF MemMod
%	.MODEL	USE16 MemMod,Pascal
ELSE
	.MODEL	USE16 SMALL,Pascal
ENDIF
	ASSUME	CS:@Code,DS:@Data
;******************************************************************************
;* Module-Name: Adaptec Advanced SCSI Programming Interface (ASPI)            *
;*----------------------------------------------------------------------------*
;* Version   Modification Date:     Author:           History:                *
;*   V1.0      20-July-1993         Ulf Rohbeck       First Creation          *
;*   V1.01     11-August-1993       Ulf Rohbeck       ExecuteSCSI_IORequest   *
;*                                                    if not post_processing  *
;*                                                      if ExecuteStatus=0    *
;*                                                        wait                *
;*                                                      if ExecuteStatus<>02  *
;*                                                        error               *
;*  V1.02      16-August-1993       Ulf Rohbeck       GetDiskDriveInformation *
;*  V1.03      18-August-1993       Ulf Rohbeck       SRB_ParBlock.ASPI_Entry *
;*  V1.04      10-September-1993    Ulf Rohbeck       GetDiskDriveInformation *
;*  V1.04a     14-September-1993    Ulf Rohbeck       EXTRN SRB_ParBlock      *
;*  V2.0       15-September-1993    Ulf Rohbeck       using for BP7.0/TCC     *
;*  V2.01      26-November-1993     Ulf Rohbeck       bug in ExecuteSCSI...   *
;*                                                    LES  DI,[SRB_ParBlock.. *
;*  V2.02      06-February-1994     Ulf Rohbeck       GetInstHostAdapters     *
;*                                                    GetDeviceTyp            *
;*  V2.1       26-February-1994     Ulf Rohbeck       MemMod ...              *
;*  V2.11      09-June-1994         Ulf Rohbeck       GetDiskDriveInformation *
;*  V2.12      10-September-1994    Ulf Rohbeck       InitSCSIMGR,{DS}        *
;*----------------------------------------------------------------------------*
;* Description: ASPI programming tools DOS specification                      *
;*============================================================================*
;*  TASM /DMemMod={MemoryModel} ASPIxDOS              /default=SMALL/         *
;*  TLIB ASPIxDOS.LIB +ASPIxDOS                                               *
;******************************************************************************
IF @Model EQ 01
;Model={TINY}
SetDS	MACRO
	PUSH	CS
	POP	DS
	ENDM
ELSE
;Model={SMALL|MEDIUM|COMPACT|LARGE|HUGE}
SetDS	MACRO
	MOV	AX,@Data
	MOV	DS,AX
	ENDM
ENDIF
;-------------------------------------------------------------------------------
        INCLUDE	ASPIxDOS.DEF
	INCLUDE	ASPIxDOS.MAC
;*******************************************************************************
	PUBLIC	HostAdapterInquire
	PUBLIC	GetDeviceType
	PUBLIC	ExecuteSCSI_IORequest
	PUBLIC	AbortSCSI_IORequest
	PUBLIC	ResetSCSIDevice
	PUBLIC	SetHostAdapterParam
	PUBLIC	GetDiskDriveInformation
	PUBLIC	InitSCSIMgr
        PUBLIC	GetInstHostAdapters
	PUBLIC	AllocSRBExecute
	.Data
;*******************************************************************************
	EXTRN	SRB_ParBlock:_ASPI_SRB_ParameterBlock
;===============================================================================
	LOCALS
	.CODE
;*******************************************************************************
;*                      H o s t A d a p t e r I n q u i r e                    *
;*-----------------------------------------------------------------------------*
;* ASM   : @HostAdapterInquire                                                 *
;* Pascal: function HostAdapterInquire:byte;external;                          *
;* C     : extern pascal far byte HostAdapterInquire(void);                    *
;*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
;* parameter input: none                                                       *
;*-----------------------------------------------------------------------------*
;* parameter output:                                                           *
;* AL:     status of SRB                                                       *
;*         FF: Error_no_unused_SRB                                             *
;*******************************************************************************
HostAdapterInquire	PROC	Pascal FAR
	USES	DS,DI,SI
        SetDS
	CALL	AllocSRB
	JC	@@End	;Error_no_unused_SRB
;initialize SRB
@@001:	MOV	ES:[(_ASPI_SRB_HostAdapterInquire Ptr DI)._.CommandCode],00
;
	PUSH	ES
	PUSH	DI
	CALL	[SRB_ParBlock.pbASPIentry]
	POP	DI
	POP	ES	;pointer to SRB (struc _ASPI_SRB_HostAdapterInquire)
	MOV	AL,ES:[(_ASPI_SRB_HostAdapterInquire Ptr DI)._.Status]
	CMP	AL,000
        JNZ	@@End
;	bug in ASPI !!!
;	Status=0: invalid value -> 81H: Invalid Host Adapter Number
        MOV	AL,081H	;Invalid HostAdapterNumber
        MOV	ES:[(_ASPI_SRB_HostAdapterInquire Ptr DI)._.Status],AL
@@End:	MOV	[SRB_ParBlock.pbASPIstatus],AL
      	RET
	ENDP
;===============================================================================

;*******************************************************************************
;*                   G e t I n s t H o s t A d a p t e r s                     *
;*-----------------------------------------------------------------------------*
;* ASM   : @GetInstHostAdapters  InstHostAdap,NumHostAdap                      *
;* Pascal: procedure                                                           *
;*           GetInstHostAdapters(var InstHostAdap:byte;                        *
;*                               var NumHostAdap:byte);external;               *
;* C     : extern pascal far void                                              *
;*           GetInstHostAdapters(byte *InstHostAdap,                           *
;*                               byte *NumHostAdap);                           *
;*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
;* parameter input: none                                                       *
;*-----------------------------------------------------------------------------*
;* parameter output:                                                           *
;* InstHostAdap: logical HostAdapterNumber                                     *
;*		 B7..B0: 0: HostAdapter not installed                          *
;*			 1: HostAdapter installed                              *
;* NumHostAdap : Number of installed HostAdapters                              *
;*               (NumHostAdap=0)&(InstHostAdap=0FFH) -> Error_no_unused_SRB    *
;*******************************************************************************
GetInstHostAdapters	PROC	Pascal FAR
	ARG	InstHostAdap:DWord,NumHostAdap:DWord
	USES	DS
        SetDS
	XOR	AX,AX
	MOV	CX,0007
@@001:	PUSH	CX
	PUSH	AX
        MOV	[SRB_ParBlock.pbHostAdapNum],CL
        @HostAdapterInquire
        JNC	$+6
        POP	AX	;V2.02
        POP	CX
        JMP	@@End
	XOR	BL,BL
	CMP	AL,01
	JNZ	$+5
	OR	BL,001
	POP	AX
	POP	CX
	SHL	BL,CL
	OR	AL,BL
	DEC	CX
	JNS	@@001
        LES	DI,[SRB_ParBlock.pbASPIsrb]
        MOV	AH,ES:[(_ASPI_SRB_HostAdapterInquire Ptr DI).HostAdapterNum]
;set output parameter
@@End:  LES	DI,[InstHostAdap]
        MOV	ES:[Byte Ptr DI],AL
        LES	DI,[NumHostAdap]
        MOV	ES:[Byte Ptr DI],AH
	RET
	ENDP
;===============================================================================
;*******************************************************************************
;*                            G e t D e v i c e T y p e                        *
;*-----------------------------------------------------------------------------*
;* ASM   : @GetDeviceType                                                      *
;* Pascal: function GetDeviceType:byte;external;                               *
;* C     : extern pascal far byte GetDeviceType(void);                         *
;*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
;* parameter input: none                                                       *
;*-----------------------------------------------------------------------------*
;* parameter output:                                                           *
;* AL:     status of SRB                                                       *
;*         FF: Error_no_unused_SRB                                             *
;*******************************************************************************
GetDeviceType 	PROC	Pascal FAR
	USES	DS,DI,SI
        SetDS
	CALL	AllocSRB
	JC	@@End	;Error_no_unused_SRB
;initialize SRB
@@001:	MOV	AL,[SRB_ParBlock.pbTargetID]
        MOV	ES:[(_ASPI_SRB_GetDeviceType Ptr DI).TargetID],AL
        MOV	AL,[SRB_ParBlock.pbLUN]
        MOV	ES:[(_ASPI_SRB_GetDeviceType Ptr DI).LUN],AL
	MOV	ES:[(_ASPI_SRB_GetDeviceType Ptr DI)._.CommandCode],01	;V2.02 >ES:<
;
        PUSH	ES
        PUSH	DI
	CALL	[SRB_ParBlock.pbASPIentry]
	POP	DI
        POP	ES	;pointer to SRB (struc _ASPI_SRB_GetDeviceType)

       	MOV	AL,ES:[(_ASPI_SRB_GetDeviceType Ptr DI)._.Status]
@@End:	MOV	[SRB_ParBlock.pbASPIstatus],AL
	RET
	ENDP
;==============================================================================
;*******************************************************************************
;*                       E x e c u t e S C S I _ I O R e q ue s t              *
;*-----------------------------------------------------------------------------*
;* ASM   :   @ExecuteSCSI_IORequest                                            *
;* Pascal:   function ExecuteSCSI_IORequest:byte;external;                     *
;* C     :   extern pascal far byte ExecuteSCSI_IORequest(void);               *
;*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
;* parameter input: none                                                       *
;*-----------------------------------------------------------------------------*
;* parameter output:                                                           *
;* AL:     status of SRB                                                       *
;*******************************************************************************
ExecuteSCSI_IORequest	PROC	Pascal FAR
	USES	DS,DI,SI
        SetDS
        LES	DI,[DWord Ptr SRB_ParBlock.pbASPIsrb]
;initialize SRB
      	MOV	AL,[SRB_ParBlock.pbTargetID]
	MOV	ES:[(_ASPI_SRB_ExecuteSCSI_IORequest Ptr DI).TargetID],AL
	MOV	AL,[SRB_ParBlock.pbLUN]
	MOV	ES:[(_ASPI_SRB_ExecuteSCSI_IORequest Ptr DI).LUN],AL
	MOV	[(_ASPI_SRB_ExecuteSCSI_IORequest Ptr DI)._.CommandCode],02
;POST_Processing ?
	MOV	AL,[Byte Ptr SRB_ParBlock.pbPostStatus]
	AND	AL,001B
	PUSHF
	OR	ES:[(_ASPI_SRB_ExecuteSCSI_IORequest Ptr DI)._.SCSIReqFlags],AL
	MOV	AX,[Word Ptr SRB_ParBlock.pbSegPOST]
	MOV	ES:[(_ASPI_SRB_ExecuteSCSI_IORequest  Ptr DI).POST_RSeg],AX
	MOV	AX,[Word Ptr SRB_ParBlock.pbOfsPOST]
	MOV	ES:[(_ASPI_SRB_ExecuteSCSI_IORequest  Ptr DI).POST_ROfs],AX
	PUSH	ES
	PUSH	DI
	CALL	[SRB_ParBlock.pbASPIentry]
        POP	DI
        POP	ES	;pointer to SRB (struc _ASPI_SRB_ExecuteSCSI_IORequest)
	XOR	AL,AL	;if post_processing
;post_processing ?
        POPF
        JNZ	@@End
	MOV	AL,ES:[(_ASPI_SRB_ExecuteSCSI_IORequest Ptr DI)._.Status]
	CMP	AL,00	;complete ?
	JZ	$-6	;wait !!!
@@End:	MOV	[SRB_ParBlock.pbASPIstatus],AL
	RET
	ENDP
;==============================================================================
;*******************************************************************************
;*                         A b o r t S C S I _ I O R e q u e s t               *
;*-----------------------------------------------------------------------------*
;* ASM   :   @AbortSCSI_IORequest                                              *
;* Pascal:   function AbortSCSI_IORequest:byte;external;                       *
;* C     :   extern pascal far byte AbortSCSI_IORequest(void);                 *
;*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
;* parameter input: none                                                       *
;*-----------------------------------------------------------------------------*
;* parameter output:                                                           *
;* AL:     status of SRB                                                       *
;*******************************************************************************
AbortSCSI_IORequest 	PROC	Pascal FAR
	USES	DS,DI,SI
	SetDS
        PUSH	[SRB_ParBlock.pbASPIsrb]	;SRB pointer to abort
        CALL	AllocSRB
	JC	@@End	;Error_no_unused_SRB
;initialize SRB
@@001:  POP	ES:DWord Ptr [(_ASPI_SRB_AbortSCSI_IORequest Ptr DI).SRB_PtrOfs]
	MOV	[(_ASPI_SRB_AbortSCSI_IORequest Ptr DI)._.CommandCode],03
        PUSH	ES
        PUSH	DI
	CALL	[SRB_ParBlock.pbASPIentry]
        POP	DI
        POP	ES	;pointer to SRB (struc _ASPI_SRB_AbortSCSI_IORequest)

       	MOV	AL,ES:[(_ASPI_SRB_AbortSCSI_IORequest Ptr DI)._.Status]
@@End:	MOV	[SRB_ParBlock.pbASPIstatus],AL
	RET
	ENDP
;==============================================================================
;*******************************************************************************
;*                           R e s e t S C S I D e v i c e                     *
;*-----------------------------------------------------------------------------*
;* ASM   :   @ResetSCSIDevice                                                  *
;* Pascal:   function ResetSCSIDevice:byte;external;                           *
;* C     :   extern pascal far byte ResetSCSIDevice(void);                     *
;*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
;* parameter input: none                                                       *
;*-----------------------------------------------------------------------------*
;* parameter output:                                                           *
;* AL:     status of SRB                                                       *
;*******************************************************************************
ResetSCSIDevice	PROC	Pascal FAR
	USES	DS,DI,SI
	SetDS
	CALL	AllocSRB
	JC	@@End	;Error_no_unused_SRB
;initialize SRB
@@001:	MOV	AL,[SRB_ParBlock.pbTargetID]
	MOV	ES:[(_ASPI_SRB_ResetSCSIDevice Ptr DI).TargetID],AL
	MOV	AL,[SRB_ParBlock.pbLUN]
	MOV	ES:[(_ASPI_SRB_ResetSCSIDevice Ptr DI).LUN],AL
	MOV	[(_ASPI_SRB_ResetSCSIDevice Ptr DI)._.CommandCode],04
;POST_Processing ?
	MOV	AL,[Byte Ptr SRB_ParBlock.pbPostStatus]
	AND	AL,001B
	PUSHF
	OR	ES:[(_ASPI_SRB_ResetSCSIDevice Ptr DI)._.SCSIReqFlags],AL
	MOV	AX,[Word Ptr SRB_ParBlock.pbSegPOST]
	MOV	ES:[(_ASPI_SRB_ResetSCSIDevice Ptr DI).POST_RSeg],AX
	MOV	AX,[Word Ptr SRB_ParBlock.pbOfsPOST]
	MOV	ES:[(_ASPI_SRB_ResetSCSIDevice Ptr DI).POST_ROfs],AX
	PUSH	ES
	PUSH	DI
	CALL	[SRB_ParBlock.pbASPIentry]
        POP	DI
        POP	ES	;pointer to SRB (struc _ASPI_SRB_ResetSCSIDevice)
	XOR	AL,AL	;if post_processing
;post_processing ?
        POPF
        JNZ	@@End
	MOV	AL,ES:[(_ASPI_SRB_ResetSCSIDevice Ptr DI)._.Status]
	CMP	AL,00	;complete ?
	JZ	$-6	;wait !!!
@@End:	MOV	[SRB_ParBlock.pbASPIstatus],AL
	RET
        ENDP
;==============================================================================
;*******************************************************************************
;*                      S e t H o s t A d a p t e r P a r a m e t e r s        *
;*-----------------------------------------------------------------------------*
;* ASM   :   @SetHostAdapterParam	PtrParLST                              *
;* Pascal:   function SetHostAdapterParam(PtrParLST:pointer)                   *
;*             :byte;external;                                                 *
;* C     :   extern pascal far byte SetHostAdapterParam(int *PtrParLST);       *
;*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
;* parameter input:                                                            *
;* PtrParLST: pointer to parameter list (Unique Parameters)                    *
;*-----------------------------------------------------------------------------*
;* parameter output:                                                           *
;* AL:     status of SRB                                                       *
;*******************************************************************************
SetHostAdapterParam	PROC	Pascal FAR
	ARG	@@PtrParLST:DWord
	USES	DS,DI,SI
        SetDS
        CALL	AllocSRB
	JC	@@End	;Error_no_unused_SRB
;initialize SRB
@@001:	MOV	[(_ASPI_SRB_SetHostAdapterParameters Ptr DI)._.CommandCode],05

	PUSH	ES
	PUSH	DI
;copy Host Adapter Unique Parameters
        LDS	SI,[@@PtrParLST]
        LEA	DI,[(_ASPI_SRB_SetHostAdapterParameters Ptr DI).HostAdapter_UPB]
        MOV	CX,16
	CLD
REP	MOVSB
;
	CALL	[SRB_ParBlock.pbASPIentry]
        POP	DI
        POP	ES	;pointer to SRB (struc _ASPI_SRB_SetHostAdapterParameters)
	MOV	AL,ES:[(_ASPI_SRB_SetHostAdapterParameters Ptr DI)._.Status]
@@End:	MOV	[SRB_ParBlock.pbASPIstatus],AL
        RET
	ENDP
;==============================================================================
;*******************************************************************************
;*                      G e t D i s k D r i v e I n f o r m a t i o n          *
;*-----------------------------------------------------------------------------*
;* ASM   :   @GetDiskDriveInformation                                          *
;* Pascal:   function GetDiskDriveInformation:byte;external;                   *
;* C     :   extern pascal far byte GetDiskDriveInformation(void);             *
;*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
;* parameter input: none                                                       *
;*-----------------------------------------------------------------------------*
;* parameter output:                                                           *
;* AL:     status of SRB                                                       *
;*******************************************************************************
GetDiskDriveInformation	PROC	Pascal FAR
	USES	DS,DI,SI
	SetDS
	CALL	AllocSRB
	JC	@@End	;Error_no_unused_SRB
;initialize SRB
@@001:	MOV	[(_ASPI_SRB_GetDiskDriveInformation Ptr DI)._.CommandCode],06
	MOV	AL,[SRB_ParBlock.pbTargetID]
	MOV	ES:[(_ASPI_SRB_GetDiskDriveInformation Ptr DI).TargetID],AL
	MOV	AL,[SRB_ParBlock.pbLUN]
	MOV	ES:[(_ASPI_SRB_GetDiskDriveInformation Ptr DI).LUN],AL

	PUSH	ES
	PUSH	DI
	CALL	[SRB_ParBlock.pbASPIentry]
	POP	DI
	POP	ES	;pointer to SRB (struc _ASPI_SRB_GetDiskDriveInformation )
	MOV	AL,ES:[(_ASPI_SRB_GetDiskDriveInformation Ptr DI)._.Status]
@@End:	MOV	[SRB_ParBlock.pbASPIstatus],AL
	RET
	ENDP
;==============================================================================

;*******************************************************************************
;*                           I n i t S C S I M g r                             *
;*-----------------------------------------------------------------------------*
;* ASM   :    @InitSCSIMgr                                                     *
;* Pascal:    function InitSCSIMgr:BOOLEAN;external;                           *
;* C     :    extern pascal far byte InitSCSIMgr();                            *
;*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
;* parameter input: none                                                       *
;*-----------------------------------------------------------------------------*
;* parameter output:                                                           *
;* AL:     status of operation                                                 *
;*         01: complete without error (TRUE)                                   *
;*         00: Error_SCSIMgr          (FALSE)                                  *
;* CY      error condition                                                     *
;*******************************************************************************
InitSCSIMgr	PROC	Pascal FAR
	ENTER	0000,00
	PUSH	DS
	SetDS
;clear SRB_ParameterBlock
	MOV	CX,Size SRB_ParBlock
	MOV	AX,DS
	MOV	ES,AX
	XOR	AL,AL
	MOV	DI,Offset SRB_ParBlock
	CLD
REP	STOSB
;OpenFile "SCSIMgr$"
	NoSmart
	CALL	FAR Ptr $+5          ;if not <CALL FAR InitSCSIMgr>
	Smart
	ADD	SP,4
	PUSH	DS
	MOV	AX,CS		;Seg SCSIMgrName
	MOV	DS,AX
	MOV	DX,Offset SCSIMgrName
	MOV	AX,03D02H
	INT	21H
	POP	DS
	JC	ErrSCSIMgr
;IOCTL_FKT2	pbASPIentry
	MOV	BX,AX     ;Handle
	MOV	AX,4402H  ;read data from char driver
	MOV	CX,0004H  ;counter
	MOV	DX,Offset SRB_ParBlock.pbASPIentry
	INT	21H
	JC	ErrSCSIMgr
	CMP	AX,004
	JNE	ErrSCSIMgr
;CLose "SCSIMgr$"
	MOV	AX,3E00H
	INT	21H
	MOV	AX,0001		;Status=TRUE
	CLC
	JMP	$+5
ErrSCSIMgr:
	XOR	AX,AX
	STC
	POP	DS
	LEAVE
	RET
;------------------------------------------------------------------------------
SCSIMgrName	DB	'SCSIMGR$',0
	ENDP
;==============================================================================

;******************************************************************************
;* Module-Name: Allocate ASPI_SRB                                             *
;*----------------------------------------------------------------------------*
;* Version   Modification Date:     Author:           History:                *
;*   V1.0      20-July-1993         Ulf Rohbeck       First Creation          *
;*   V2.0      30-September-1993    Ulf Rohbeck       special for BP/TC       *
;*----------------------------------------------------------------------------*
;* Description: Allocate Service Request Block                                *
;******************************************************************************
	.Data
@SRBPtrList	STRUC
OfsSRB	DW	?
SegSRB	DW	?
	ENDS
SizeSRBPtrList	=	8
SRB	STRUC
_	_ASPI_SRB_Header	<>
	DB	128-(size _ASPI_SRB_Header) DUP(?)
	ENDS
SizeSRBmax	=	Size SRB
PosSRBPtrList  DB       ?
SRBPtrList     @SRBPtrList SizeSRBPtrList DUP(?)
SRBList        SRB SizeSRBPtrList DUP(?)
;==============================================================================
	.Code
;*******************************************************************************
;*                                 A l l o c S R B                             *
;*-----------------------------------------------------------------------------*
;*      AllocSRB              --                                               *
;*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
;* parameter: none                                                             *
;*-----------------------------------------------------------------------------*
;* result:                                                                     *
;*   CY      ERROR_NO_UNUSED_SRB                                               *
;*           AX: 00FFh                                                          *
;*   ES:DI   pointer to SRB                                                    *
;*           NIL/NULL: ERROR_NO_UNUSED SRB                                     *
;*******************************************************************************
AllocSRB       	PROC	Pascal NEAR
        ENTER	0000,00
        PUSH	DS
        SetDS
;only first CALL AllocSRB
        CALL	NEAR Ptr ClrSRBPtrLST
;search for unused SRBPtr
        MOV	CX,SizeSRBPtrList
@@ASE0: INC	[Byte Ptr PosSRBPtrList]
        CMP	[Byte Ptr PosSRBPtrList],SizeSRBPtrList
        JL	$+7
        MOV	[Byte Ptr PosSRBPtrList],00H
        MOV	AL,[Byte Ptr PosSRBPtrList]
        MOV	AH,Size @SRBPtrList
        MUL	AH
        MOV	BX,Offset SRBPtrList
        ADD	BX,AX
        LES	DI,[BX]
	CMP	[(_ASPI_SRB_Header Ptr DI).Status],000H    ;Status in progress ?
        JE	@@ASE1
;clear SRB
        MOV	CX,SizeSRBmax
        PUSH	DI
        XOR	AL,AL
	CLD
REP     STOSB
        POP	DI
      	MOV	AL,[SRB_ParBlock.pbHostAdapNum]
        MOV	ES:[(_ASPI_SRB_Header Ptr DI).HostAdapNum],AL
        CLC
	JMP	@@End
;search for unused SRBPtr
@@ASE1: LOOP	@@End
;ERROR_NO_UNUSED_SRB
        XOR	DI,DI
        MOV	ES,DI
        MOV	AX,00FFH
        STC
@@End:  MOV	[Word Ptr SRB_ParBlock.pbASPIsrb],DI
        MOV	[Word Ptr SRB_ParBlock.pbASPIsrb+2],ES
	POP	DS
        LEAVE
	RET
	ENDP
;*******************************************************************************
ClrSRBPtrLST	PROC NEAR
        ENTER	0000,00
        PUSH	DS
;initialize SRBList
        MOV	CX,SizeSRBPtrList
        MOV	[Byte Ptr PosSRBPtrList],0FFH
        MOV	BX,Offset SRBPtrList
        MOV	DI,Offset SRBList
@@ID:   MOV	[(@SRBPtrList Ptr BX).OfsSRB],DI   ;Offset SRB
	MOV	[(@SRBPtrList Ptr BX).SegSRB],DS   ;Seg SRB
        MOV	AX,DS
        MOV	ES,AX
;clear SRB
        PUSH	DI
        PUSH	CX
        MOV	CX,SizeSRBmax
        XOR	AL,AL
	CLD
REP     STOSB
        POP	CX
        POP	DI
	MOV	ES:[(_ASPI_SRB_Header Ptr DI).Status],0FFH ;unused SRB
        ADD	DI,SizeSRBmax
        ADD	BX,size @SRBPtrList
        LOOPNZ	@@ID
;delete >CALL SRBPtrLST<
        MOV	DI,[BP+2]	;Ptr RETA
        MOV	AX,CS
        MOV	ES,AX
	MOV	CX,0003		;size <CALL NEAR>
	SUB	DI,CX
        MOV     AL,90H          ;NOP
	CLD
REP	STOSB			;CALL -> NOP
        POP	DS
        LEAVE
	RET
        ENDP
;==============================================================================
;*******************************************************************************
;*                        A l l o c S R B E x e c u t e                        *
;*-----------------------------------------------------------------------------*
;* ASM   : @AllocSRBExecute     PtrOpC,OpCLEN                                  *
;* Pascal: function AllocSRBExecute(PtrOpC:pointer;                            *
;*                                  OpCLEN:byte):Boolean;external;             *
;* C     : extern pascal far byte AllocSRBExecute(int *PtrOpC,byte OpCLEN);    *
;*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
;* parameter input:                                                            *
;*   PtrOpC : pointer to Operation Code                                        *
;*   OpCLEN : length  of Operation Code                                        *
;*-----------------------------------------------------------------------------*
;* parameter output:                                                           *
;* AL:     status of operation                                                 *
;*         01: complete without error (TRUE)                                   *
;*         00: Error_no_unused_SRB    (FALSE)                                  *
;* CY      ERROR_NO_UNUSED_SRB                                                 *
;*******************************************************************************
AllocSRBExecute	PROC	Pascal FAR
	ARG	@@PtrOpC:DWord,@@OpCLEN:Byte
	USES	DS,DI,SI
	SetDS
	CALL	AllocSRB
        MOV	[Word Ptr SRB_ParBlock.pbASPIsrb],DI
        MOV	[Word Ptr SRB_ParBlock.pbASPIsrb+2],ES
        JC	@@End	;ERROR_NO_UNUSED SRB
;set Operation Code
        XOR	CH,CH
	MOV	CL,[@@OpCLEN]
	MOV	ES:[(_ASPI_SRB_ExecuteSCSI_IORequest Ptr DI).SCSI_CDBLen],CL
        MOV	ES:[(_ASPI_SRB_ExecuteSCSI_IORequest Ptr DI).SenseAllocLen],SenseLen
        LDS	SI,[@@PtrOpC]
	LEA	DI,[(_ASPI_SRB_ExecuteSCSI_IORequest Ptr DI).SCSI_CDB]
	CLD
REP	MOVSB
	XOR	AL,AL
        CLC
@@End:	NOT	AL
	AND	AL,001H	;status of operation
	RET
	ENDP
;==============================================================================
        END
