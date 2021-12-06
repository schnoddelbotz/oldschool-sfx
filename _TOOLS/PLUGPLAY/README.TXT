PLUG AND PLAY INSTALLATION DISK README.TXT
==========================================

This file contains the following sections:

	 1. Release Notes
	 2. Configuration Assistance Utility
	 3. Plug And Play Configuration Manager (CM)
	 4. ISA Configuration Utility (ICU)
	 5. Problems with EMM386
	 6. Acknowledgement


1. RELEASE NOTES

   Parts of the information here is extracted from the
   Intel Plug and Play Kit. All the program in this installation
   diskette are taken from the Intel Plug and Play Kit.


2. CONFIGURATION ASSISTANCE UTILITY

   The installation program will run this utility to scan all the
   hardware resources that is used by a non Plug and Play card.
   A database file (ESCD.RF) will be created in the root directory.
   This database file is used by the Configuration Manager to do
   the resource allocation.


3. PLUG AND PLAY CONFIGURATION MANAGER (CM)

   The Plug and Play Configuration Manager provides all of the
   functionality  defined in the "Plug and Play Device Driver
   Specification for Microsoft(R) Windows(TM) and MS-DOS".
   It will do the resource allocation for all Plug and Play cards.

   The Configuration Manager also complies with the specifications
   and definitions in:

   "Plug and Play ISA Specification", Version 1.0a
	   from Intel Corporation and Microsoft Corporation

   "Plug and Play BIOS Specification", Version 1.0a
	   from Intel Corporation, Compaq Computer Corporation,
	   Phoenix Technologies, Ltd.,	and Microsoft Corporation

   "Plug and Play BIOS Extensions Guide", Version 1.1
	   from Intel Corporation

   "PCI BIOS Specification", Version 2.0, from Intel Corporation


4. ISA CONFIGURATION UTILITY (ICU)

   ISA Configuration Utility is for ISA system only. You should
   not run it on EISA systems. You need to use EISA Configuration
   Utility to run it on EISA systems.
   You can view the devices installed on your system, and modify
   the hardware resources used by your devices.


   Notes :

   You can increase the size of the Smartdrv buffer to make the ICU
   faster.

   You can see the Help options in DOS ICU and the ICU Users Guide
   Help files in Windows for informations on using ICU.


5. PROBLEMS WITH EMM386

   5.1 32-bit I/O reads

   When you are using any version of EMM386 prior to version 4.49, you
   may experience a hang and/or reset situation. This occurs only on
   systems with a Plug and Play BIOS, Plug and Play software (ICU and
   Configuration Manager) and EMM386 versions prior to 4.49.

   Please contact your system manufacturer or Microsoft for information
   on obtaining an updated EMM386 device driver.

   5.2 HIGHSCAN parameter to EMM386

   The HIGHSCAN parameter to EMM386 will cause conflict with the
   Configuration Manager on a system with a Plug and Play BIOS.
   The system may reboot when the Configuration Manager begins
   initialization; the behaviour may vary from system to system.

   Please do not select the "Aggressive" memory scan option on Memmaker.

   5.3 Problem with the old implementation of Plug and Play BIOS

   Some old implementation of Plug and Play BIOS may not have a BIOS
   signature. Without a signature, EMM386 may corrupt the ESCD data if
   the ESCD storage is map into the E000:0 block of memory.

   Please contact your system manufacturer when your system's ESCD
   is mapped into the E000:0 range and does not have a BIOS signature.
   If this is the case, you must EXCLUDE this range from the EMM386
   command line in the CONFIG.SYS file. The example below shows you
   how to exclude the specified block of memory.

   e.g. DEVICE=C:\EMM386.EXE X=E000-EFFF


6. ACKNOWLEDGEMENT

   MS-DOS is a registered trademark, and Windows is a trademark of
   Microsoft Corporation.

   Other names and trademarks are the property of their respective
   companies.

                 ******** END OF README.TXT ********
