;******************************************************************************
;* Module-Name: Adaptec Advanced SCSI Programming Interface (ASPI)            *
;*----------------------------------------------------------------------------*
;* Version   Modification Date:     Author:           History:                *
;*   V1.0      14-July-1993         Ulf Rohbeck       First Creation          *
;*   V1.01     16-August-1993       Ulf Rohbeck       GetDiskDriveInfo        *
;*   V2.0      28-September-1993    Ulf Rohbeck       using for BP/TC         *
;*   V2.11     09-June-1994         Ulf Rohbeck       GetDiskDriveInformation *
;*----------------------------------------------------------------------------*
;* Description: ASPI definition of external modules, DOS specification        *
;******************************************************************************
	EXTRN	HostAdapterInquire:FAR
	EXTRN	GetDeviceType:FAR
	EXTRN	ExecuteSCSI_IORequest:FAR
	EXTRN	AbortSCSI_IORequest:FAR
	EXTRN	ResetSCSIDevice:FAR
	EXTRN	SetHostAdapterParam:FAR
	EXTRN	GetDiskDriveInformation:FAR
	EXTRN	InitSCSIMgr:FAR
	EXTRN	GetInstHostAdapters:FAR
	EXTRN	AllocSRBExecute:FAR
;------------------------------------------------------------------------------
	INCLUDELIB	ASPIxDOS.LIB
;******************************************************************************
