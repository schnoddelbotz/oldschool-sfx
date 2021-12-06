                        PLASH README FILE


****************************************************************************
*  -> Flash EPROM provides you a convenient way to update your system      *
*     BIOS, please note that updating your system BIOS is serious, only    *
*     update when you need to do it. Unnecessary updating can cause        *
*     damage to the system which will not be covered under the warranty.   *
*                                                                          *
*  -> If you update an incorrect file to your FLASH EPROM, the system      *
*     may no longer boot, please carefully follow the procedures in        *
*     the manual or ask a qualified technician and/or call your dealer.    * 
****************************************************************************

Flash EPROM updating procedures:

  (1) Make sure the FLASH Read/Write jumper of the M/B is correct. If the
      setting is incorrect, the Flash EPROM cannot be programed. Please
      refer to the manual for jumper location and settings.

  (2) Boot your system from a MS-DOS system diskette which contains no
      CONFIG.SYS and AUTOEXEC.BAT files.

      NOTE:    FLASH.EXE can't work under protected mode/virtual mode.
               Memory managers like QEMM386, EMM386, and 386MAX should
               not be loaded.

  (3) Type "PFLASH", then press <ENTER> within the program's directory.

  (4) To support "Plug & Play" BIOS Programming, you require a "Block Mode"
      type FLASH EPROM.  Do not continue to program the FLASH EPROM if the
      FLASH type is "UNKNOWN".

  (5) Choose command option "2" (Update BIOS Main Block From File)
      to load a new BIOS file into the FLASH EPROM on the motherboard.

      NOTE:    If necessary, the utility will instruct you to use command
               option "3" (Advanced Feature) and then choose command
               option "2" (Update BIOS Including Boot Block and ESCD) to
               load a new BIOS file into the entire FLASH EPROM. (Plug & 
               Play System settings held in the BIOS will be lost and will 
               require reconfiguration through BIOS and operating system)
       
      WARNING: When using command option "3", the power must not be turned 
               off or else the BIOS will be lost and the system will no 
               longer boot.  

      There is one BIOS file in this diskette. Please key-in the correct 
      BIOS file to program the Flash EPROM.  For example:

      T25IXXXX.AWD     ----- for P/I-P55T2P4 M/B OR P/I-XP55T2P4 M/B

      XXXX = the BIOS Version Number

****************************************************************************
*  -> Using an incorrect or unauthorized BIOS file can cause the entire    *
*     BIOS, including the Boot Block, to be damaged to the point where     *
*     the system cannot be rescued from the floppy.                        *
****************************************************************************



  (6) If you get any error messages during the update of the EPROM, please 
      go back to repeat step 5 until the EPROM is successfully updated, 
      otherwise, your system may no longer boot.

  (7) Press the <ESC> key to exit.

  (8) Turn OFF the power and back on to reboot your system.

  (9) Hold down the <Delete> key to enter BIOS setup.

 (10) Load Setup Defaults in the BIOS main menu and then make other changes
      that you may have had prior to updating the BIOS.

 (11) Save and Exit Setup.


