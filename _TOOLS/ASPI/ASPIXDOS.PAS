{;******************************************************************************
 ;* Module-Name: Adaptec Advanced SCSI Programming Interface (ASPI)            *
 ;*----------------------------------------------------------------------------*
 ;* Version   Modification Date:     Author:          History:                 *
 ;*   V2.1      26-February-1994     Ulf Rohbeck      first creation           *
 ;*   V2.11     09-June-1994         Ulf Rohbeck      GetDiskDriveInfo         *
 ;*   V2.12     09-September-1994    Ulf Rohbeck      InitSCSIMgr,/DS/         *
 ;*----------------------------------------------------------------------------*
 ;* Description: BP-unit, using ASPIxDOS.LIB [OBJ] for DOS                     *
 ;******************************************************************************}
unit ASPIxDOS;

interface

CONST
  CDBLength = 12;
  SenseLen  = 16;

TYPE
  {ASPI SCSI Request Block Header defintion}
  _ASPI_SRB_Header = RECORD
  CommandCode : BYTE; 	{Command Code
			   00h: Host Adapter Inquire
			   01h: Get Device Typ
			   02h: Execute SCSI I/O command
			   03h: Abort SCSI I/O command
			   04h: Reset SCSI device
			   05h: Set Host Adapter Parameters
			   06h: Get Disk Drive Information
			   07-7Fh: Reserved for Future Expansion
			   80-FFh: Reserved for Vendor Unique}
  Status      : Byte;	{Status
			   00h: SCSI request in progress
			   01h: SCSI request completed without error
			   02h: SCSI request aborted by host
			   04h: SCSI request completed with error
			   80h: Invalid SCSI request
			   81h: Invalid Host Adapter Number
			   82h: SCSI device not installed}
  HostAdapNum : Byte;	{Host Adapter Number [W]}
  SCSIReqFlags: Byte;	{SCSI Request Flags  [W]
			   B0 :  POST bit
			         0: disabled
			         1: enabled
			   B1 :  LINK bit
			         0: enabled
			         1: disabled
			   B34: Direction bit
			         00: Direction determined by SCSI command
				     Lenghth not checked
			         01: Transfer from SCSI target to host
				     Length checked
			         10: Transfer from host to SCSI target
				     Length checked
			         11: no data transfer}
  reserved : Array[0..3] of Byte;	{reserved for expansion = 0}
  END;

  {ASPI SCSI Request Block defintion [Host Adapter Inquire]}
  _ASPI_SRB_HostAdapterInquire = RECORD
    _              : _ASPI_SRB_Header;
    HostAdapterNum : BYTE;	         {# of Host Adapter}
    HostAdapID     : BYTE;	         {ID of Host Adapter}
    ASPI_Mgr_ID    : Array[1..16] of char; {ASPI Manager ID}
    HostAdapter_ID : Array[1..16] of char; {Host Adapter ID}
    HostAdapter_UP : Array[1..16] of BYTE; {Host Adapter Unique Parameters}
  END;

  {ASPI SCSI Request Block defintion [Get Device Type]}
    _ASPI_SRB_GetDeviceType = RECORD
    _                : _ASPI_SRB_Header;
    TargetID         : BYTE;		{Target identification}
    LUN              : BYTE;		{LUN}
    PDevTyp          : BYTE;		{Peripheral Device Typ
					 0x00 -> Disk Device
					 0x01 -> Tape Device
					 0x02 -> Printer
					 0x03 -> Processor
					 0x04 -> Write-once read-multiple
					 0x05 -> CD-ROM device
					 0x06 -> Scanner device
					 0x07 -> Optical memory device
					 0x08 -> Medium Changer device
					 0x09 -> Communications device
					 0x0A -> Reserved (low)
					 0x1E -> Reserved (high)
					 0x1F -> Unknown or no device type}
  END;

  {ASPI SCSI Request Block defintion [Execute]}
  _ASPI_SRB_ExecuteSCSI_IORequest = RECORD
    _                  : _ASPI_SRB_Header;
    TargetID           : BYTE;	{Target identification}
    LUN                : BYTE;	{LUN}
    DataAllocLen       : LongInt;	{Data Allocation Length}
    SenseAllocLen      : BYTE;	{Sense Allocation Length}
    DataBufPtrOfs      : WORD;	{Data Buffer Pointer (Offset)}
    DataBufPtrSeg      : WORD;	{Data Buffer Pointer (Segment)}
    SRBLinkPtrOfs      : WORD;	{SRB Link Pointer (Offset)}
    SRBLinkPtrSeg      : WORD;	{SRB Link Pointer (Segment)}
    SCSI_CDBLen        : BYTE;	{SCSI CDB Length}
    HostAdapStat       : BYTE;	{Host Adapter Status
    ;				 00h: Host Adapter did not detect any error
    ;				 11h: Selection timeout
    ;				 12h: Data overrun/underrun
    ;				 13h: Unexpected Bus Free
    ;				 14h: Target bus phase sequence Failure}
    TargetStat         : BYTE;	{Target Status
    ;				 00h: No Target Status
    ;				 02h: Check Status (Sense data is in SenseAllocArea)
    ;				 08h: Specified Target/LUN is busy
    ;				 18h: Reservation conflict}
    POST_ROfs          : WORD;	{POST Routine Address (Offset)}
    POST_RSeg          : WORD;	{POST Routine Address (Segment)}
    reserved           : ARRAY[0..33] of BYTE;	{Reserved for ASPI Workspace}
    SCSI_CDB           : ARRAY[0..CDBLength-1] of BYTE;	{SCSI Command Descriptor Block (CDB)}
    SenseData          : ARRAY[0..SenseLEN-1] of BYTE;	{Sense Allocation Area}
  END;

  {ASPI SCSI Request Block defintion [Abort}
  _ASPI_SRB_AbortSCSI_IORequest = RECORD
    _                  : _ASPI_SRB_Header;
    SRB_PtrOfs         : WORD;	{SRB pointer to abort (Offset)}
    SRB_PtrSeg         : WORD;	{SRB pointer to abort (Segment)}
  END;

  _ASPI_SRB_ParameterBlock = RECORD
    pbHostAdapNum: Byte;	{Hostadapter number}
    pbTargetID   : Byte;	{Target identification}
    pbLUN        : Byte;	{LUN}
    pbPostStatus : BOOLEAN;	{status post processing
    				 00H: disable
    				 01H: enable}
    pbSegPOST    : Word;	{segment of POST service routine (if pbPostStatus)}
    pbOfsPOST    : Word;	{offset  of POST service routine (if pbPostStatus)}
    pbASPIsrb    : Pointer;     {pointer to Service Request Block}
    pbASPIstatus : Byte;        {SRB._.Status}
    pbASPIentry  : Pointer;	{Entry Point ASPI}
    END;

  {ASPI SCSI Request Block defintion [Reset]}
  _ASPI_SRB_ResetSCSIDevice = RECORD
    _              : _ASPI_SRB_Header;
    TargetID       : BYTE;	{target identification}
    LUN            : BYTE;	{LUN}
    reserved       : ARRAY[0..13] of BYTE; {reserved}
    HostAdapStat   : BYTE;	{Host Adapter Status
    ;				 00h: Host Adapter did not detect any error
    ;				 11h: Selection timeout
    ;				 12h: Data overrun/underrun
    ;				 13h: Unexpected Bus Free
    ;				 14h: Target bus phase sequence Failure}
    TargetStat     : BYTE;	{Target Status
    ;				 00h: No Target Status
    ;				 02h: Check Status (Sense data is in SenseAllocArea)
    ;				 08h: Specified Target/LUN is busy
    ;				 18h: Reservation conflict}
    POST_ROfs      : WORD;	{POST Routine Address (Offset)}
    POST_RSeg      : WORD;	{POST Routine Address (Segment)}
    reserved2      : ARRAY[0..33] of BYTE;	{Reserved for ASPI Workspace}
  END;

  {ASPI SCSI Request Block defintion [Set Host Adapter Parameters]}
  _ASPI_SRB_SetHostAdapterParameters = RECORD
    _                : _ASPI_SRB_Header;
    HostAdapter_UPB  : ARRAY[0..15] of BYTE;	{Host Adapter Unique Parameters Block}
  END;

  {ASPI SCSI Request Block definition [Get Disk Drive Information]}
  _ASPI_SRB_GetDiskDriveInformation = RECORD
    _                  : _ASPI_SRB_Header;
    TargetID           : BYTE;	{Target identification}
    LUN                : BYTE;    {LUN}
    DriveFlags         : BYTE;	{Drive Flags
    ;				 B7..B2: reserved
    ;				 B1..B0: INT 13 Info Bits
    ;				 00: The given drive is not accessible via INT 13h.
    ;				     The INT13h field is invalid.
    ;				 01: The given drive is accessible via INT 13h.
    ;				     The INT13h field contains the drive's INT 13h
    ;				     drive number. The drive is under the control of DOS.The given drive is accessible via INT 13h.
    ;				     The INT13h field contains the drive's INT 13h
    ;				     drive number. The drive is not under the control of DOS.
    ;				 11: invalid}
    INT13H_Drive       : BYTE;	{drive's INT 13h drive number}
    PrefHeadTrans      : BYTE;	{Prefered Head Translation}
    PrefSectTrans      : BYTE;	{Prefered Sector Translation}
    reserved           : ARRAY[0..9] of BYTE;	{reserved for expansion}
  END;

VAR
  SRB_ParBlock:_ASPI_SRB_ParameterBlock;

function HostAdapterInquire:byte;
procedure GetInstHostAdapters(var InstHostAdap:byte;var NumHostAdap:byte);
function GetDeviceType:byte;
function ExecuteSCSI_IORequest:byte;
function AbortSCSI_IORequest:byte;
function ResetSCSIDevice:byte;
function SetHostAdapterParam(PtrParLST:pointer):byte;
function GetDiskDriveInformation:byte;
function InitSCSIMgr:BOOLEAN;
function AllocSRBExecute(PtrOpC:pointer;OpCLEN:byte):Boolean;

implementation

{$L ASPIxDOS.OBJ}

function HostAdapterInquire:byte;external;
procedure GetInstHostAdapters(var InstHostAdap:byte;var NumHostAdap:byte);external;
function GetDeviceType:byte;external;
function ExecuteSCSI_IORequest:byte;external;
function AbortSCSI_IORequest:byte;external;
function ResetSCSIDevice:byte;external;
function SetHostAdapterParam(PtrParLST:pointer):byte;external;
function GetDiskDriveInformation:byte;external;
function InitSCSIMgr:BOOLEAN;external;
function AllocSRBExecute(PtrOpC:pointer;OpCLEN:byte):Boolean;external;

{-----------------------------------------------------------------------------}
BEGIN
END.