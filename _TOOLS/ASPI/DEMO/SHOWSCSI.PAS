PROGRAM SHOWSCSI;
{SHOWSCSI V1.0, 12-September-1993, by U. Rohbeck
	  V1.01 08-October-1993, ReadCDF...
	  V1.02 09-September-1994, CD-ROM/ReadCDR...}

USES Crt,ASPIxDOS;

TYPE
  InquireDataFormat = Record
    ConfigPara: ARRAY[0..7] of BYTE;
    VendorID  : ARRAY[1..8] of char;
    ProductID : ARRAY[1..16] of char;
    ProductRev: ARRAY[1..4] of char;
  END;
  PSenseData  = ^SenseData;
  SenseData   = Array[0..SenseLEN-1] of BYTE;
  ReadCapacityFormat = Record
    LogicalBlockAddress: LongInt;
    BlockLength        : LongInt;
  END;
  _ASPI_00 = _ASPI_SRB_HostAdapterInquire;
  _ASPI_01 = _ASPI_SRB_GetDeviceType;
  _ASPI_02 = _ASPI_SRB_ExecuteSCSI_IORequest;
  _ASPI_03 = _ASPI_SRB_AbortSCSI_IORequest;
  _ASPI_04 = _ASPI_SRB_ResetSCSIDevice;
  _ASPI_05 = _ASPI_SRB_SetHostAdapterParameters;
  _ASPI_06 = _ASPI_SRB_GetDiskDriveInformation;

VAR
  INQBuf      : InquireDataFormat;
  InstHost    : BYTE; {installed Hostadapter}
  NumHost     : BYTE; {number of Hostadapters}
  InstDev     : BYTE; {installed devices}
  PDevTyp     : BYTE; {peripheral device type}
  I           : WORD; {index_variable}
  PtrSenseData: PSenseData; {Ptr SenseData}
  ReadCDF     : ReadCapacityFormat;

{;*******************************************************************************
 ;*                               I n q u i r e                                 *
 ;*-----------------------------------------------------------------------------*
 ;*      Inquire                 PtrBuf,AllocLEN                                *
 ;*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
 ;* parameter:                                                                  *
 ;* PtrBuf  : pointer of buffer data                                            *
 ;* AllocLEN: specifies the number of bytes that the initiator has allocated    *
 ;*           for data                                                          *
 ;*-----------------------------------------------------------------------------*
 ;* result:                                                                     *
 ;* AL:     status of SRB                                                       *
 ;*         FF: Error_no_unused_SRB                                             *
 ;*******************************************************************************}
FUNCTION Inquire(INQBuf:pointer;AllocLEN:BYTE):BYTE;

CONST
  OpC:Array[0..5] of BYTE =($12,0,0,0,0,0);

BEGIN
  IF AllocSRBExecute(@OpC,6)
  THEN
  BEGIN
    _ASPI_02 (SRB_ParBlock.pbASPIsrb^)._.SCSIReqFlags:=$08;
    _ASPI_02 (SRB_ParBlock.pbASPIsrb^).DataBufPtrOfs:=Ofs(InqBuf^);
    _ASPI_02 (SRB_ParBlock.pbASPIsrb^).DataBufPtrSeg:=Seg(InqBuf^);
    _ASPI_02 (SRB_ParBlock.pbASPIsrb^).DataAllocLen:=AllocLEN;
    _ASPI_02 (SRB_ParBlock.pbASPIsrb^).SCSI_CDB[4]:=AllocLEN;
    Inquire:=ExecuteSCSI_IORequest;
  END;
END;

{;*******************************************************************************
 ;*                           R e a d  C a p a c i t y                          *
 ;*-----------------------------------------------------------------------------*
 ;*      ReadCapacity            PtrBuf                                         *
 ;*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
 ;* parameter:                                                                  *
 ;* PtrBuf  : pointer of buffer [Read Capacity Data Format;size=8 byte]         *
 ;*-----------------------------------------------------------------------------*
 ;* result:                                                                     *
 ;*  pointer: pointer to SRB (_ASPI_SRB_ExecuteSCSI_IORequest)                  *
 ;*           NIL: error -> no SRB available                                    *
 ;*******************************************************************************}
FUNCTION ReadCapacity(ReadCDF:pointer):BYTE;

CONST
  OpC:Array[0..9] of BYTE =($25,0,0,0,0,0,0,0,0,0);

BEGIN
  IF AllocSRBExecute(@OpC,10)
  THEN
  BEGIN
    _ASPI_02 (SRB_ParBlock.pbASPIsrb^)._.SCSIReqFlags:=$08;
    _ASPI_02 (SRB_ParBlock.pbASPIsrb^).DataBufPtrOfs:=Ofs(ReadCDF^);
    _ASPI_02 (SRB_ParBlock.pbASPIsrb^).DataBufPtrSeg:=Seg(ReadCDF^);
    _ASPI_02 (SRB_ParBlock.pbASPIsrb^).DataAllocLen:=08;

    ReadCapacity:=ExecuteSCSI_IORequest;
  END;
END;
{;-------------------------------------------------------------------------------}
FUNCTION HexOut(HexVal:BYTE):STRING;
CONST
  KonvTab: STRING[16] = ('0123456789ABCDEF');

BEGIN
  HexOut:= KonvTab[(HexVal SHR 4)+1]+KonvTab[(HexVal AND $0F)+1];
END;

BEGIN
  ClrScr;
  WRITELN('... SHOWSCSI V1.02');
  WRITELN;
  IF NOT (InitSCSIMgr)
  THEN
  BEGIN
    WRITELN('+++ no SCSIMgr installed');
    HALT;
  END;

  GetInstHostAdapters(InstHost,NumHost);
{ WRITELN('number of installed Hostadapters: ',NumHost);
  WRITELN;}
  SRB_ParBlock.pbHostAdapNum:=0;
  WHILE (NumHost>0) DO
  BEGIN
    IF ((InstHost SHR SRB_ParBlock.pbHostAdapNum) AND $01)=01
    THEN
    BEGIN
      WRITELN('浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融');
      WRITELN('� Host Adapter #',SRB_ParBlock.pbHostAdapNum,'                                                �');
      WRITELN('把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超');
      {Host Adapter Inquire}
      IF MaxAvail < SizeOf(_ASPI_SRB_HostAdapterInquire)
      THEN
        Writeln('Not enough memory')
      ELSE
      BEGIN
        HostAdapterInquire;

        WRITELN('� Host Adapter SCSI_ID: #',_ASPI_00 (SRB_ParBlock.pbASPIsrb^).HostAdapID,
	        '                                       �');
        WRITELN('� ASPI-Manager        : ',_ASPI_00 (SRB_ParBlock.pbASPIsrb^).ASPI_Mgr_ID,
	        '                         �');
        WRITELN('� Host Adapter ID     : ',_ASPI_00 (SRB_ParBlock.pbASPIsrb^).HostAdapter_ID,
	        '                         �');
        WRITELN('藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕');
        WRITELN;
      END;
      {get device information}
      InstDev:=0;
      SRB_ParBlock.pbTargetID:=0;
      SRB_ParBlock.pbLUN:=0;
      WHILE SRB_ParBlock.pbTargetID<8 DO
      BEGIN
        IF GetDeviceType=01
        THEN
        BEGIN
          INC(InstDev);
          PDevTyp:=_ASPI_01 (SRB_ParBlock.pbASPIsrb^).PDevTyp;
          WRITELN('敖陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳朕');
          WRITE('� Host Adapter #',SRB_ParBlock.pbHostAdapNum,' ');
          WRITE('- SCSI ID ',SRB_ParBlock.pbTargetID,
	        ' - LUN ',SRB_ParBlock.pbLUN,': ');
          case PDevTyp of
            $00: {disk drive}
                 WRITELN('Disk Device               �');
            $01: {tape drive}
                 WRITELN('Tape Device               �');
            $02: {Printer}
                 WRITELN('Printer                   �');
            $03: {Processor}
                 WRITELN('Processor                 �');
            $04: {WORM}
                 WRITELN('WORM                      �');
            $05: {CD-ROM Device}
                 WRITELN('CD-ROM Device             �');
            $06: {Scanner Device}
                 WRITELN('Scanner Device            �');
            $07: {Optical Memory Device}
                 WRITELN('Optical Memory Device     �');
            $08: {Medium Changer Device}
                 WRITELN('Medium Changer Device     �');
            $09: {Communications Device}
                 WRITELN('Communications Device     �');
            else
                 WRITELN('                         �');
          END;


          IF Inquire(@InqBuf,SizeOf(InqBuf)) = $0FF
          THEN
          BEGIN
            WRITELN('団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調');
            WRITELN('� +++ error modul: AllocSRBExecute [no SRB available]            �');
            WRITELN('青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰');
          END
          ELSE
          BEGIN
            IF SRB_ParBlock.pbASPIstatus = $01
            THEN
            BEGIN
              WRITELN('団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳賃陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調');
              WRITELN('� Device Information             � Miscellaneous                 �');
              WRITE  ('�   Vendor ID  : ',InqBuf.VendorID,'        ');
              WRITELN('�   Device Type : SCSI-',chr((InqBuf.ConfigPara[2] AND $0F)OR $30),'        �');
              WRITE  ('�   Product ID : ',InqBuf.ProductID);
              WRITE  ('�   Capacity    : ');
              CASE PDevTyp of
		$00, {disk drive}
		$05: {CD-ROM}
		     BEGIN
		       IF (ReadCapacity(@ReadCDF) = 01)
		       THEN
		       BEGIN
			 with ReadCDF do
			 BEGIN
			   LogicalBlockAddress:=swap(LogicalBlockAddress shr 16) or
						(swap(LogicalBlockAddress) * $10000);
			   BlockLength:=swap(BlockLength shr 16) or
					    (longint(swap(BlockLength)) shl 16);
			 END;
		       WRITELN(trunc((ReadCDF.LogicalBlockAddress*ReadCDF.BlockLength)/$100000):4,' MByte    �');
		     END
		     ELSE
		       WRITELN('not mounted   �');
		   END;
		ELSE
		     WRITELN('n/a           �');
	      END;
	      WRITE('�   Revision   : ',InqBuf.ProductRev,'            ');
	      WRITE  ('�   Bytes/Sector: ');
	      CASE PDevTyp of
		$00, {disk drive}
		$05: {CD-ROM}
		     BEGIN
		       IF SRB_ParBlock.pbASPIstatus=01
		       THEN
			 WRITELN(ReadCDF.BlockLength:4,' Byte     �')
		       ELSE
			 WRITELN('not mounted   �');
		     END;
		ELSE
		     WRITELN('n/a           �');
	      END;
	      IF (InqBuf.ConfigPara[2] AND $0F) = 02
              THEN
              BEGIN
                {only SCSI-2 devices}
                WRITELN('団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳珍陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調');
                WRITELN('�  SCSI-Features                                                 �');
                WRITE  ('�    [');
                IF (InqBuf.ConfigPara[7] AND $10) <>0
                THEN
                  WRITE('�')
                ELSE
                  WRITE(' ');
                WRITE('] Synchronous Mode          [');
	        IF (InqBuf.ConfigPara[7] AND $20) <>0
                THEN
                  WRITE('�')
                ELSE
                  WRITE(' ');
                WRITELN('] WIDE SCSI (16-bit)        �');
                WRITE('�    [');
	        IF (InqBuf.ConfigPara[7] AND $08) <>0
                THEN
                  WRITE('�')
                ELSE
                  WRITE(' ');
                WRITE('] SCSI Linking              [');
	        IF (InqBuf.ConfigPara[7] AND $40) <>0
                THEN
                  WRITE('�')
                ELSE
                  WRITE(' ');
	        WRITELN('] WIDE SCSI (32-bit)        �');
                WRITE('�    [');
	        IF (InqBuf.ConfigPara[7] AND $02) <>0
                THEN
                  WRITE('�')
                ELSE
                  WRITE(' ');
	        WRITELN('] Command Queuing                                         �');
              END;
            END
            ELSE
            BEGIN
              WRITELN('団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調');
              CASE SRB_ParBlock.pbASPIstatus of
                $02: WRITELN('� +++ error [SCSI request aborted by host]                       �');
                $04: WRITELN('� +++ error [SCSI request completed with error]                  �');
                $80: WRITELN('� +++ error [Invalid SCSI request]                               �');
                $81: WRITELN('� +++ error [Invalid Host Adapter Number]                        �');
                $82: WRITELN('� +++ error [SCSI device not installes]                          �');
              END;
              WRITELN('�                                                                �');
              WRITE  ('� Host Adapter Status: $',HexOut(_ASPI_02 (SRB_ParBlock.pbASPIsrb^).HostAdapStat),' - ');
              CASE _ASPI_02 (SRB_ParBlock.pbASPIsrb^).HostAdapStat of
                $00: WRITELN('No Host Adapter error               �');
                $11: WRITELN('Selection timeout                   �');
                $12: WRITELN('Data overrun/underrun               �');
	        $13: WRITELN('Unexpected Bus Free                 �');
                $14: WRITELN('Target bus phase sequence failure   �');
                else
                  WRITELN('                                    �');
              END;
              WRITE('� Target Status      : $',HexOut(_ASPI_02 (SRB_ParBlock.pbASPIsrb^).TargetStat),' - ');
              CASE _ASPI_02 (SRB_ParBlock.pbASPIsrb^).TargetStat of
                $00: WRITELN('No target status                    �');
                $02: WRITELN('Check Status                        �');
                $08: WRITELN('Specified Target/LUN is busy        �');
	        $18: WRITELN('Reservation conflict                �');
                else
                  WRITELN('                                    �');
              END;
              WRITELN('�                                                                �');
              WRITE  ('� SCSI CDB Sent     ($) : ');
              FOR I:=0 TO _ASPI_02 (SRB_ParBlock.pbASPIsrb^).SCSI_CDBLen-1 DO
                WRITE(HexOut(_ASPI_02 (SRB_ParBlock.pbASPIsrb^).SCSI_CDB[I]),' ');
	      CASE _ASPI_02 (SRB_ParBlock.pbASPIsrb^).SCSI_CDBLen of
	        06: WRITELN('                     �');
                10: WRITELN('         �');
              END;
              {get pointer to SenseData area}
	      PtrSenseData:=Ptr(Seg(_ASPI_02 (SRB_ParBlock.pbASPIsrb^).SCSI_CDB),
	                        Ofs(_ASPI_02 (SRB_ParBlock.pbASPIsrb^).SCSI_CDB)+
				_ASPI_02 (SRB_ParBlock.pbASPIsrb^).SCSI_CDBLen);
              WRITELN('� Sense Key             : $',HexOut(PtrSenseData^[2] AND $0F),'                                    �');
              WRITELN('� Additional Sense Code : $',HexOut(PtrSenseData^[$0B]),'                                    �');
              WRITELN('� + Sense Code Qualifier: $',HexOut(PtrSenseData^[$0C]),'                                    �');
            END;
          END;
	  WRITELN('青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰');
          WRITELN;
          WRITELN('*** press any key to continue *** ');
          WHILE ReadKey='' DO
            ;
        END;
        INC(SRB_ParBlock.pbTargetID);
      END;
      IF InstDev=0
      THEN
      BEGIN
        WRITELN('敖陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳朕');
        WRITELN('�               +++ no SCSI devices found +++                    �');
        WRITELN('青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰');
        WRITELN;
        WRITELN('*** press any key to continue *** ');
        WHILE ReadKey='' DO
	  ;
      END;
      DEC(NumHost);
    END;
    INC(SRB_ParBlock.pbHostAdapNum);
  END;
  WRITELN;
  WRITELN('... program terminated');
END.

