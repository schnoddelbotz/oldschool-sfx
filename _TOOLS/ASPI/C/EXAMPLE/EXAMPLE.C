
#include <stdio.h>
#include <dos.h>

#include "C:\ASPIXDOS\C\aspixdos.h"

byte Opc[6] = {0x00,0x00,0x00,0x00,0x00,0x00}; /* TestUnitReady */

void main()
{
  byte *NumHost,*InstHost;

  if (InitSCSIMgr()==01)
  {
    GetInstHostAdapters(NumHost,InstHost);
    AllocSRBExecute(Opc,6);
    SRB_ParBlock.pbTargetID=0x05;
    ((struct _ASPI_SRB_ExecuteSCSI_IORequest *) SRB_ParBlock.pbASPIsrb)->_.SCSIReqFlags=0x18;
    ExecuteSCSI_IORequest();
  };
}
