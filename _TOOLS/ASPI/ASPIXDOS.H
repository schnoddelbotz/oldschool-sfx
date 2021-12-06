/*******************************************************************************
 ;* Module-Name: Adaptec Advanced SCSI Programming Interface (ASPI)            *
 ;*----------------------------------------------------------------------------*
 ;* Version   Modification Date:     Author:          History:                 *
 ;*   V2.0      30-September-1993    Ulf Rohbeck      first creation           *
 ;*   V2.01     26-November-1993     Ulf Rohbeck      _ASPI_SRB_Exec...        *
 ;*                                                   long DataAllocLen ...    *
 ;*----------------------------------------------------------------------------*
 ;* Description: C-headerfile, using ASPIxDOS.LIB for DOS                      *
 ;******************************************************************************/

#define word unsigned int
#define byte unsigned char
#define CDBLength 12
#define SenseLen 16

struct _ASPI_SRB_ParameterBlock
  {
    char pbHostAdapNum;		/*Hostadapter number*/
    char pbTargetID;		/*Target identification*/
    char pbLUN;			/*LUN*/
    char pbPostStatus;		/*status post processing
				 00H: disable
				 01H: enable*/
    word pbSegPOST;		/*segment of POST service routine (if pbPostStatus)*/
    word pbOfsPOST;		/*offset  of POST service routine (if pbPostStatus)*/
    word *pbASPIsrb;		/*pointer to service request block */
    byte pbASPIstatus;          /* SRB._.Status */
    word *pbASPIentry;	 	/*Entry Point ASPI*/
  } pascal SRB_ParBlock;

struct _ASPI_SRB_Header
  {
      char CommandCode;		/* Command Code
				   ;00h: Host Adapter Inquire
				   ;01h: Get Device Typ
				   ;02h: Execute SCSI I/O command
				   ;03h: Abort SCSI I/O command
				   ;04h: Reset SCSI device
				   ;05h: Set Host Adapter Parameters
				   ;06h: Get Disk Drive Information
				   ;07-7Fh: Reserved for Future Expansion
				   ;80-FFh: Reserved for Vendor Unique */
      char Status;		/* Status
				   ;00h: SCSI request in progress
				   ;01h: SCSI request completed without error
				   ;02h: SCSI request aborted by host
				   ;04h: SCSI request completed with error
				   ;80h: Invalid SCSI request
				   ;81h: Invalid Host Adapter Number
				   ;82h: SCSI device not installed */
      char HostAdapNum;		/* Host Adapter Number [W] */
      char SCSIReqFlags;	/* SCSI Request Flags  [W]
				   ;B0 :  POST bit
				   ;      0: disabled
				   ;      1: enabled
				   ;B1 :  LINK bit
				   ;      0: enabled
				   ;      1: disabled
				   ;B34: Direction bit
				   ;     00: Direction determined by SCSI command
				   ;         Lenghth not checked
				   ;     01: Transfer from SCSI target to host
				   ;         Length checked
				   ;     10: Transfer from host to SCSI target
				   ;         Length checked
				   ;     11: no data transfer */
      long rsvd;		/* ;reserved for expansion = 0 */
  };

/*ASPI SCSI Request Block defintion [Host Adapter Inquire]*/
struct _ASPI_SRB_HostAdapterInquire
  {
    struct _ASPI_SRB_Header _;
    byte HostAdapterNum;	/* number of Host Adapter*/
    byte HostAdapID;		/* ID of Host Adapter*/
    byte ASPI_Mgr_ID[16];	/* ASPI Manager ID*/
    byte HostAdapter_ID[16];	/* Host Adapter ID*/
    byte HostAdapter_UP[16];	/* Host Adapter Unique Parameters*/
  };
/*ASPI SCSI Request Block defintion [Get Device Type] */
struct _ASPI_SRB_GetDeviceType
  {
    struct _ASPI_SRB_Header _;
    byte TargetID;		/* Target identification */
    byte LUN;			/* LUN */
    byte PDevTyp;		/* Peripheral Device Type
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
				   0x1F -> Unknown or no device type */
  };

/*;ASPI SCSI Request Block defintion [Execute]*/
struct _ASPI_SRB_ExecuteSCSI_IORequest
  {
    struct _ASPI_SRB_Header _;
    byte TargetID;		/* Target identification */
    byte LUN;			/* LUN */
    long DataAllocLen;		/* Data Allocation Length */
    byte SenseAllocLen;		/* Sense Allocation Length */
    word DataBufPtrOfs;		/* Data Buffer Pointer (Offset) */
    word DataBufPtrSeg;		/* Data Buffer Pointer (Segment) */
    word SRBLinkPtrOfs;		/* SRB Link Pointer (Offset) */
    word SRBLinkPtrSeg;		/* SRB Link Pointer (Segment) */
    byte SCSI_CDBLen;		/* SCSI CDB Length */
    byte HostAdapStat;		/* Host Adapter Status
				     00h: Host Adapter did not detect any error
				     11h: Selection timeout
				     12h: Data overrun/underrun
				     13h: Unexpected Bus Free
				     14h: Target bus phase sequence Failure */
    byte TargetStat;		/* Target Status
				     00h: No Target Status
				     02h: Check Status (Sense data is in SenseAllocArea)
				     08h: Specified Target/LUN is busy
				     18h: Reservation conflict */
    word POST_ROfs;		/* POST Routine Address (Offset) */
    word POST_RSeg;		/* POST Routine Address (Segment) */
    byte reserved2[34];		/* Reserved for ASPI Workspace */
    byte SCSI_CDB[CDBLength];	/* SCSI Command Descriptor Block (CDB) */
    byte SenseData[SenseLen];	/* Sense Allocation Area */
  };

/* ASPI SCSI Request Block defintion [Abort] */
struct _ASPI_SRB_AbortSCSI_IORequest
  {
  struct	_ASPI_SRB_Header _;
  word SRB_PtrOfs;		/* SRB pointer to abort (Offset) */
  word SRB_PtrSeg; 		/* SRB pointer to abort (Segment) */
  };

/* ASPI SCSI Request Block defintion [Reset] */
struct _ASPI_SRB_ResetSCSIDevice
  {
    struct _ASPI_SRB_Header	_;
    byte TargetID;			/* Target identification */
    byte LUN;			/* LUN */
    byte reserved[14];     		/* reserved */
    byte HostAdapStat;		/* Host Adapter Status
				       00h: Host Adapter did not detect any error
				       11h: Selection timeout
				       12h: Data overrun/underrun
				       13h: Unexpected Bus Free
				       14h: Target bus phase sequence Failure */
    byte TargetStat;		/* Target Status
				       00h: No Target Status
				       02h: Check Status (Sense data is in SenseAllocArea)
				       08h: Specified Target/LUN is busy
				       18h: Reservation conflict */
    word POST_ROfs;			/* POST Routine Address (Offset) */
    word POST_RSeg;			/* POST Routine Address (Segment) */
    byte reserved2[34];		/* Reserved for ASPI Workspace */
  };

/* ASPI SCSI Request Block defintion [Set Host Adapter Parameters] */
struct _ASPI_SRB_SetHostAdapterParameters
  {
    struct _ASPI_SRB_Header	_;
    byte HostAdapter_UPB[16];		/* Host Adapter Unique Parameters Block */
  };

/* ASPI SCSI Request Block definition [Get Disk Drive Information] */
struct _ASPI_SRB_GetDiskDriveInformation
  {
    struct _ASPI_SRB_Header _;
    byte TargetID;			  /* Target identification */
    byte LUN;				  /* LUN */
    byte DriveFlags;			  /* Drive Flags
						B7..B2: reserved
						B1..B0: INT 13 Info Bits
						  00: The given drive is not accessible via INT 13h.
						      The INT13h field is invalid.
						  01: The given drive is accessible via INT 13h.
						      The INT13h field contains the drive's INT 13h
						      drive number. The drive is under the control of DOS.The given drive is accessible via INT 13h.
						      The INT13h field contains the drive's INT 13h
						      drive number. The drive is not under the control of DOS.
						  11: invalid */
    byte INT13H_Drive;			/* drive's INT 13h drive number */
    byte PrefHeadTrans;			/* Prefered Head Translation */
    byte PrefSectTrans;			/* Prefered Sector Translation */
    byte reservered[10];		/* reserved for expansion */
  };

/* declaration of prototype's */
extern pascal far byte HostAdapterInquire(void);
extern pascal far void GetInstHostAdapters(byte far *InstHostAdap,byte far *NumHostAdap);
extern pascal far byte GetDeviceType(void);
extern pascal far byte ExecuteSCSI_IORequest(void);
extern pascal far byte AbortSCSI_IORequest(void);
extern pascal far byte ResetSCSIDevice(void);
extern pascal far byte SetHostAdapterParam(byte far *PtrParLST);
extern pascal far byte GetDiskDriveInformation(void);
extern pascal far byte InitSCSIMgr();
extern pascal far byte AllocSRBExecute(byte far *PtrOpC,byte OpCLEN);

/* ########################################################################## */
