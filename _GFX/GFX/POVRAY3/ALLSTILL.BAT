@echo off
echo Test>allscene\test
if not exist allscene\test md allscene
del allscene\test>nul
del userabor.mes>nul
goto Start
:Start
povray allstill +LPOV3DEMO\ATMOS +iATMOS1
povray allstill +LPOV3DEMO\ATMOS +iATMOS2
povray allstill +LPOV3DEMO\ATMOS +iATMOS3
povray allstill +LPOV3DEMO\ATMOS +iATMOS4
povray allstill +LPOV3DEMO\ATMOS +iATMOS5
povray allstill +LPOV3DEMO\ATMOS +iFOGLAYR
povray allstill +LPOV3DEMO\ATMOS +iFOGLYR2
povray allstill +LPOV3DEMO\ATMOS +iFOG_F
povray allstill +LPOV3DEMO\ATMOS +iFOG_FT
povray allstill +LPOV3DEMO\ATMOS +iFOG_STD
povray allstill +LPOV3DEMO\ATMOS +iHOLLOW1
povray allstill +LPOV3DEMO\ATMOS +iHOLLOW2
povray allstill +LPOV3DEMO\ATMOS +iHOLLOW3
povray allstill +LPOV3DEMO\ATMOS +iNUFOG2
povray allstill +LPOV3DEMO\ATMOS +iRAINBOW1
povray allstill +LPOV3DEMO\ATMOS +iSKYSPH1
povray allstill +LPOV3DEMO\ATMOS +iSKYSPH2
if EXIST userabor.mes goto End
povray allstill +LPOV3DEMO\CAMERA +iCAMERA1A
povray allstill +LPOV3DEMO\CAMERA +iCAMERA1B
povray allstill +LPOV3DEMO\CAMERA +iCAMERA1C
povray allstill +LPOV3DEMO\CAMERA +iCAMERA1D
povray allstill +LPOV3DEMO\CAMERA +iCAMERA1E
povray allstill +LPOV3DEMO\CAMERA +iCAMERA1F
povray allstill +LPOV3DEMO\CAMERA +iCAMERA3A
povray allstill +LPOV3DEMO\CAMERA +iCAMERA3B
povray allstill +LPOV3DEMO\CAMERA +iCAMERA3C
povray allstill +LPOV3DEMO\CAMERA +iCAMERA3D
povray allstill +LPOV3DEMO\CAMERA +iFOCALB1
if EXIST userabor.mes goto End
povray allstill +LPOV3DEMO\DEMO +iAREALIT1
povray allstill +LPOV3DEMO\DEMO +iAREALIT2
povray allstill +LPOV3DEMO\DEMO +iAREALIT3
povray allstill +LPOV3DEMO\DEMO +iCHARS
povray allstill +LPOV3DEMO\DEMO +iCOLORS
povray allstill +LPOV3DEMO\DEMO +iHFIELD
povray allstill +LPOV3DEMO\DEMO +iNORMAL
povray allstill +LPOV3DEMO\DEMO +iPIGMENT
povray allstill +LPOV3DEMO\DEMO +iPRIMITIV
povray allstill +LPOV3DEMO\DEMO +iSHAPES
povray allstill +LPOV3DEMO\DEMO +iSHAPES2
povray allstill +LPOV3DEMO\DEMO +iTEXTURE1
povray allstill +LPOV3DEMO\DEMO +iTEXTURE2
povray allstill +LPOV3DEMO\DEMO +iTEXTURE3
povray allstill +LPOV3DEMO\DEMO +iTEXTURE4
povray allstill +LPOV3DEMO\DEMO +iTEXTURE5
povray allstill +LPOV3DEMO\DEMO +iTEXTURE6
if EXIST userabor.mes goto End
povray allstill +LPOV3DEMO\HALO +iATTENUAT
povray allstill +LPOV3DEMO\HALO +iATTENUA1
povray allstill +LPOV3DEMO\HALO +iCLOUD
povray allstill +LPOV3DEMO\HALO +iCLOUD2
povray allstill +LPOV3DEMO\HALO +iDUST
povray allstill +LPOV3DEMO\HALO +iEMIT1
povray allstill +LPOV3DEMO\HALO +iEMIT2
povray allstill +LPOV3DEMO\HALO +iEMITTING
povray allstill +LPOV3DEMO\HALO +iGLOW
povray allstill +LPOV3DEMO\HALO +iHAZE
povray allstill +LPOV3DEMO\HALO +iMULTIPLE
povray allstill +LPOV3DEMO\HALO +iPLANETH1
povray allstill +LPOV3DEMO\HALO +iPLANETH2
povray allstill +LPOV3DEMO\HALO +iSTEAMS
if EXIST userabor.mes goto End
povray allstill +LPOV3DEMO\LIGHTS +iCYLLITE1
povray allstill +LPOV3DEMO\LIGHTS +iFADELT1
povray allstill +LPOV3DEMO\LIGHTS +iFADELT2
povray allstill +LPOV3DEMO\LIGHTS +iFILLITE
if EXIST userabor.mes goto End
povray allstill +LPOV3DEMO\OBJECTS +iBLOB1A
povray allstill +LPOV3DEMO\OBJECTS +iBLOB1B
povray allstill +LPOV3DEMO\OBJECTS +iBLOB1C
povray allstill +LPOV3DEMO\OBJECTS +iCHESMSH
povray allstill +LPOV3DEMO\OBJECTS +iFRACTAL1
povray allstill +LPOV3DEMO\OBJECTS +iFRACTAL2
povray allstill +LPOV3DEMO\OBJECTS +iFRACTAL3
povray allstill +LPOV3DEMO\OBJECTS +iFRACTAL4
povray allstill +LPOV3DEMO\OBJECTS +iLATHE1A
povray allstill +LPOV3DEMO\OBJECTS +iLATHE1B
povray allstill +LPOV3DEMO\OBJECTS +iLATHE1C
povray allstill +LPOV3DEMO\OBJECTS +iLATHE2
povray allstill +LPOV3DEMO\OBJECTS +iPOLYGON
povray allstill +LPOV3DEMO\OBJECTS +iPRISM1
povray allstill +LPOV3DEMO\OBJECTS +iPRISM2
povray allstill +LPOV3DEMO\OBJECTS +iPRISM3A
povray allstill +LPOV3DEMO\OBJECTS +iPRISM3B
povray allstill +LPOV3DEMO\OBJECTS +iPRISM3C
povray allstill +LPOV3DEMO\OBJECTS +iROBOTMSH
povray allstill +LPOV3DEMO\OBJECTS +iSOR1
povray allstill +LPOV3DEMO\OBJECTS +iSUPEREL1
povray allstill +LPOV3DEMO\OBJECTS +iSUPEREL2
povray allstill +LPOV3DEMO\OBJECTS +iSUPEREL3
povray allstill +LPOV3DEMO\OBJECTS +iTBLOB
povray allstill +LPOV3DEMO\OBJECTS +iTORUS1
povray allstill +LPOV3DEMO\OBJECTS +iTRIMESH1
povray allstill +LPOV3DEMO\OBJECTS +iTTF1
povray allstill +LPOV3DEMO\OBJECTS +iTTF2
povray allstill +LPOV3DEMO\OBJECTS +iTTF3
povray allstill +LPOV3DEMO\OBJECTS +iTTFTEST
if EXIST userabor.mes goto End
povray allstill +LPOV3DEMO\OTHER +iADCTEST
if EXIST userabor.mes goto End
rem CRAT_DAT.POV renders height_field data for CRATER.POV
povray +W640 +I480 -D +V -P +FT +LPOV3DEMO\OTHER  +ICRAT_DAT +OPOV3DEMO\OTHER\
povray allstill +LPOV3DEMO\OTHER +ICRATER
del POV3DEMO\OTHER\CRAT_DAT.TGA
povray allstill +LPOV3DEMO\OTHER +iFLOAT5
povray allstill +LPOV3DEMO\OTHER +iGRIDLOOP
povray allstill +LPOV3DEMO\OTHER +iIFELSE1
povray allstill +LPOV3DEMO\OTHER +iIFELSE2
povray allstill +LPOV3DEMO\OTHER +iIFELSE3
povray allstill +LPOV3DEMO\OTHER +iMATRIX
povray allstill +LPOV3DEMO\OTHER +iMESSAGE
povray allstill +LPOV3DEMO\OTHER +iSHEAR1
povray allstill +LPOV3DEMO\OTHER +iSHEAR2
povray allstill +LPOV3DEMO\OTHER +iSHEAR3
povray allstill +LPOV3DEMO\OTHER +iSTRINGS
povray allstill +LPOV3DEMO\OTHER +iSWITCH1
povray allstill +LPOV3DEMO\OTHER +iSWITCH2
povray allstill +LPOV3DEMO\OTHER +iSWITCH3
povray allstill +LPOV3DEMO\OTHER +iSWITCH4
povray allstill +LPOV3DEMO\OTHER +iWHILE1
if EXIST userabor.mes goto End
povray allstill +LPOV3DEMO\RADIOS  +iRAD2 +QR
povray allstill +LPOV3DEMO\RECURSE +iSPONGE1
povray allstill +LPOV3DEMO\RECURSE +iSPONGE2
povray allstill +LPOV3DEMO\RECURSE +iSPONGE3
if EXIST userabor.mes goto End
povray allstill +LPOV3DEMO\SHOWOFF +iBLOBLOOP
povray allstill +LPOV3DEMO\SHOWOFF +iCHESS2
povray allstill +LPOV3DEMO\SHOWOFF +iDIFFRACT
povray allstill +LPOV3DEMO\SHOWOFF +iFISHEYE
povray allstill +LPOV3DEMO\SHOWOFF +iGLOFLAKE
rem Note MATCHES.POV uses non-standard aspect ratio so use MATCHES.INI
povray allstill +LPOV3DEMO\SHOWOFF  MATCHES
povray allstill +LPOV3DEMO\SHOWOFF +iMIST
povray allstill +LPOV3DEMO\SHOWOFF +iQUILT1
povray allstill +LPOV3DEMO\SHOWOFF +iSMOKE
povray allstill +LPOV3DEMO\SHOWOFF +iSOMBRERO
povray allstill +LPOV3DEMO\SHOWOFF +iSUNSET3
povray allstill +LPOV3DEMO\SHOWOFF +iSWIRLBOX
povray allstill +LPOV3DEMO\SHOWOFF +iWHILTILE
if EXIST userabor.mes goto End
povray allstill +LPOV3DEMO\SHOWOFF\NEWLTPOT +iTEAPOT2
povray allstill +LPOV3DEMO\SHOWOFF\NEWLTPOT +iTEAPOT3
povray allstill +LPOV3DEMO\SHOWOFF\NEWLTPOT +iTEAPOT4
if EXIST userabor.mes goto End
povray allstill +LPOV3DEMO\SURFACES +iAGATE
povray allstill +LPOV3DEMO\SURFACES +iATTEN1
povray allstill +LPOV3DEMO\SURFACES +iATTEN2
povray allstill +LPOV3DEMO\SURFACES +iBLKHOLE
povray allstill +LPOV3DEMO\SURFACES +iBOZO
povray allstill +LPOV3DEMO\SURFACES +iBRICK
povray allstill +LPOV3DEMO\SURFACES +iBRICK2
povray allstill +LPOV3DEMO\SURFACES +iBUMPS
povray allstill +LPOV3DEMO\SURFACES +iCAUSTIC1
povray allstill +LPOV3DEMO\SURFACES +iCAUSTIC2
povray allstill +LPOV3DEMO\SURFACES +iCHECKER
povray allstill +LPOV3DEMO\SURFACES +iCOLAMB1
povray allstill +LPOV3DEMO\SURFACES +iCOLMIR1
povray allstill +LPOV3DEMO\SURFACES +iCRACK1
povray allstill +LPOV3DEMO\SURFACES +iCRACKLE
povray allstill +LPOV3DEMO\SURFACES +iDENTS
if EXIST userabor.mes goto End
povray allstill +LPOV3DEMO\SURFACES +iGRADIENT
povray allstill +LPOV3DEMO\SURFACES +iGRANITE
povray allstill +LPOV3DEMO\SURFACES +iHEXAGON
povray allstill +LPOV3DEMO\SURFACES +iIRID
povray allstill +LPOV3DEMO\SURFACES +iIRIDWLEN
povray allstill +LPOV3DEMO\SURFACES +iLEOPARD
povray allstill +LPOV3DEMO\SURFACES +iMANDEL
povray allstill +LPOV3DEMO\SURFACES +iMARBLE
povray allstill +LPOV3DEMO\SURFACES +iMT-BLOB1
povray allstill +LPOV3DEMO\SURFACES +iMT-BLOB2
povray allstill +LPOV3DEMO\SURFACES +iMT-BLOB3
povray allstill +LPOV3DEMO\SURFACES +iNORMAVG
povray allstill +LPOV3DEMO\SURFACES +iNORMMAP
povray allstill +LPOV3DEMO\SURFACES +iNUMWAVES
povray allstill +LPOV3DEMO\SURFACES +iONION
povray allstill +LPOV3DEMO\SURFACES +iPIGAVG
povray allstill +LPOV3DEMO\SURFACES +iPIGMAP
povray allstill +LPOV3DEMO\SURFACES +iQUILT2
povray allstill +LPOV3DEMO\SURFACES +iQUILTED
povray allstill +LPOV3DEMO\SURFACES +iRADIAL
if EXIST userabor.mes goto End
povray allstill +LPOV3DEMO\SURFACES +iRGBT
povray allstill +LPOV3DEMO\SURFACES +iRGBT2
povray allstill +LPOV3DEMO\SURFACES +iRIPPLES
povray allstill +LPOV3DEMO\SURFACES +iSLOPEMAP
povray allstill +LPOV3DEMO\SURFACES +iSPIRAL1
povray allstill +LPOV3DEMO\SURFACES +iSPIRAL1A
povray allstill +LPOV3DEMO\SURFACES +iSPIRAL1B
povray allstill +LPOV3DEMO\SURFACES +iSPIRAL2
povray allstill +LPOV3DEMO\SURFACES +iSPIRAL2A
povray allstill +LPOV3DEMO\SURFACES +iSPIRAL2B
povray allstill +LPOV3DEMO\SURFACES +iSPOTTED
povray allstill +LPOV3DEMO\SURFACES +iTXTRAVG
povray allstill +LPOV3DEMO\SURFACES +iTXTRMAP
povray allstill +LPOV3DEMO\SURFACES +iWARP1
povray allstill +LPOV3DEMO\SURFACES +iWARP2
povray allstill +LPOV3DEMO\SURFACES +iWAVENORM
povray allstill +LPOV3DEMO\SURFACES +iWAVEPIG
povray allstill +LPOV3DEMO\SURFACES +iWAVES
povray allstill +LPOV3DEMO\SURFACES +iWOOD
povray allstill +LPOV3DEMO\SURFACES +iWRINKLES
if EXIST userabor.mes goto End
povray allstill +LPOVSCN\LEVEL1 +iBALLBOX1
povray allstill +LPOVSCN\LEVEL1 +iBASICVUE
povray allstill +LPOVSCN\LEVEL1 +iBLOB
povray allstill +LPOVSCN\LEVEL1 +iBOX
povray allstill +LPOVSCN\LEVEL1 +iBUMPMAP
povray allstill +LPOVSCN\LEVEL1 +iCANTELOP
povray allstill +LPOVSCN\LEVEL1 +iCHECKER2
povray allstill +LPOVSCN\LEVEL1 +iCLIPTST2
povray allstill +LPOVSCN\LEVEL1 +iDODEC2
povray allstill +LPOVSCN\LEVEL1 +iFILTFUN
povray allstill +LPOVSCN\LEVEL1 +iGLASDISH
povray allstill +LPOVSCN\LEVEL1 +iGLASS
povray allstill +LPOVSCN\LEVEL1 +iGRANITE
povray allstill +LPOVSCN\LEVEL1 +iINTEE1
povray allstill +LPOVSCN\LEVEL1 +iINTERP
povray allstill +LPOVSCN\LEVEL1 +iLASER
povray allstill +LPOVSCN\LEVEL1 +iMAPPER
povray allstill +LPOVSCN\LEVEL1 +iMAPPR2
povray allstill +LPOVSCN\LEVEL1 +iMATMAP
povray allstill +LPOVSCN\LEVEL1 +iSHADOWS
povray allstill +LPOVSCN\LEVEL1 +iSPOTLITE
if EXIST userabor.mes goto End
povray allstill +LPOVSCN\LEVEL2 +iARCHES
povray allstill +LPOVSCN\LEVEL2 +iCLUSTER
povray allstill +LPOVSCN\LEVEL2 +iCRYSTAL
povray allstill +LPOVSCN\LEVEL2 +iEIGHT
povray allstill +LPOVSCN\LEVEL2 +iHFCLIP
povray allstill +LPOVSCN\LEVEL2 +iIORTEST
povray allstill +LPOVSCN\LEVEL2 +iLAMPPOST
povray allstill +LPOVSCN\LEVEL2 +iMAGGLASS
povray allstill +LPOVSCN\LEVEL2 +iMTMAND
povray allstill +LPOVSCN\LEVEL2 +iPACMAN
povray allstill +LPOVSCN\LEVEL2 +iPAWNS
povray allstill +LPOVSCN\LEVEL2 +iPLANET
povray allstill +LPOVSCN\LEVEL2 +iPOLYWOOD
povray allstill +LPOVSCN\LEVEL2 +iPOOLBALL
povray allstill +LPOVSCN\LEVEL2 +iSKYVASE
povray allstill +LPOVSCN\LEVEL2 +iSOFT
povray allstill +LPOVSCN\LEVEL2 +iSUNSETHF
povray allstill +LPOVSCN\LEVEL2 +iWATERBOW
povray allstill +LPOVSCN\LEVEL2 +iWTORUS
if EXIST userabor.mes goto End
povray allstill +LPOVSCN\LEVEL3 +iCHESS
rem DESK.POV is a multi-frame rendering but the initial frames
rem render image_maps for subsequent frames.  The end result is
rem a stlll image. Uses DESK.INI
povray          +LPOVSCN\LEVEL3  DESK allstill 
ren allscene\DESK4.TGA DESK.TGA
tga2gif -d allscene\DESK
del allscene\DES??.TGA
if EXIST userabor.mes goto End
povray allstill +LPOVSCN\LEVEL3 +iLAMP
povray allstill +LPOVSCN\LEVEL3 +iOAK2
povray allstill +LPOVSCN\LEVEL3 +iSNACK
povray allstill +LPOVSCN\LEVEL3 +iTAKEOFF
povray allstill +LPOVSCN\LEVEL3 +iTOMB
povray allstill +LPOVSCN\LEVEL3 +iWEALTH
povray allstill +LPOVSCN\LEVEL3 +iWG6
povray allstill +LPOVSCN\LEVEL3\DRUMS2 +iDRUMS
povray allstill +LPOVSCN\LEVEL3\FISH13 +iFISH13
povray allstill +LPOVSCN\LEVEL3\IONIC5 +iIONIC5
povray allstill +LPOVSCN\LEVEL3\NTREAL +iNTREAL
povray allstill +LPOVSCN\LEVEL3\PENCIL +iFPENCIL
povray allstill +LPOVSCN\LEVEL3\PENCIL +iPENCIL
povray allstill +LPOVSCN\LEVEL3\PIECE2 +iPIECE2
povray allstill +LPOVSCN\LEVEL3\PIECE3 +iPIECE3
povray allstill +LPOVSCN\LEVEL3\SNAIL +iSNAIL
povray allstill +LPOVSCN\LEVEL3\TEAPOT +iTEAPOT
if EXIST userabor.mes goto End
povray allstill +LPOVSCN\MATH +iBEZIER
povray allstill +LPOVSCN\MATH +iBICUBE
povray allstill +LPOVSCN\MATH +iFOLIUM
povray allstill +LPOVSCN\MATH +iGRAFBIC
povray allstill +LPOVSCN\MATH +iHELIX
povray allstill +LPOVSCN\MATH +iHYPTORUS
povray allstill +LPOVSCN\MATH +iLEMNISC2
povray allstill +LPOVSCN\MATH +iLEMNISCA
povray allstill +LPOVSCN\MATH +iMONKEY
povray allstill +LPOVSCN\MATH +iPARTORUS
povray allstill +LPOVSCN\MATH +iPIRIFORM
povray allstill +LPOVSCN\MATH +iQUARCYL
povray allstill +LPOVSCN\MATH +iQUARPARA
povray allstill +LPOVSCN\MATH +iSTEINER
povray allstill +LPOVSCN\MATH +iTCUBIC
povray allstill +LPOVSCN\MATH +iTEARDROP
povray allstill +LPOVSCN\MATH +iTORUS
povray allstill +LPOVSCN\MATH +iTROUGH
povray allstill +LPOVSCN\MATH +iWITCH
if EXIST userabor.mes goto End
povray allstill +LTEXSAMPS\GLASSES +iGLASSES
povray allstill +LTEXSAMPS\METALS +iBRASSES
povray allstill +LTEXSAMPS\METALS +iCHROMES
povray allstill +LTEXSAMPS\METALS +iCOPPERS
povray allstill +LTEXSAMPS\METALS +iGOLDS
povray allstill +LTEXSAMPS\METALS +iSILVERS
povray allstill +LTEXSAMPS\SKIES +iS_CLOUD1
povray allstill +LTEXSAMPS\SKIES +iS_CLOUD2
povray allstill +LTEXSAMPS\SKIES +iS_CLOUD3
povray allstill +LTEXSAMPS\SKIES +iS_CLOUD4
povray allstill +LTEXSAMPS\SKIES +iS_CLOUD5
povray allstill +LTEXSAMPS\SKIES +iSTARS
povray allstill +LTEXSAMPS\STONES +iBENEDITI
povray allstill +LTEXSAMPS\STONES +iMARBTEAL
povray allstill +LTEXSAMPS\STONES +iPINKMARB
povray allstill +LTEXSAMPS\STONES +iRDGRANIT
povray allstill +LTEXSAMPS\STONES +iSTONES1
povray allstill +LTEXSAMPS\STONES +iSTONES2
if EXIST userabor.mes goto End
povray allstill +LTEXSAMPS\WOODS +iASH
povray allstill +LTEXSAMPS\WOODS +iBUBINGA
povray allstill +LTEXSAMPS\WOODS +iCEDAR
povray allstill +LTEXSAMPS\WOODS +iORNGWOOD
povray allstill +LTEXSAMPS\WOODS +iTEAK
povray allstill +LTEXSAMPS\WOODS +iWHITEASH
povray allstill +LTEXSAMPS\WOODS +iWOODBOX
povray allstill +LTEXSAMPS\WOODS +iWOODS1
povray allstill +LTEXSAMPS\WOODS +iWOODS2
povray allstill +LTEXSAMPS\WOODS +iWOOD_1
povray allstill +LTEXSAMPS\WOODS +iWOOD_10
povray allstill +LTEXSAMPS\WOODS +iWOOD_11
povray allstill +LTEXSAMPS\WOODS +iWOOD_12
povray allstill +LTEXSAMPS\WOODS +iWOOD_13
povray allstill +LTEXSAMPS\WOODS +iWOOD_14
if EXIST userabor.mes goto End
povray allstill +LTEXSAMPS\WOODS +iWOOD_15
povray allstill +LTEXSAMPS\WOODS +iWOOD_16
povray allstill +LTEXSAMPS\WOODS +iWOOD_17
povray allstill +LTEXSAMPS\WOODS +iWOOD_18
povray allstill +LTEXSAMPS\WOODS +iWOOD_19
povray allstill +LTEXSAMPS\WOODS +iWOOD_2
povray allstill +LTEXSAMPS\WOODS +iWOOD_3
povray allstill +LTEXSAMPS\WOODS +iWOOD_4
povray allstill +LTEXSAMPS\WOODS +iWOOD_5
povray allstill +LTEXSAMPS\WOODS +iWOOD_6
povray allstill +LTEXSAMPS\WOODS +iWOOD_7
povray allstill +LTEXSAMPS\WOODS +iWOOD_8
povray allstill +LTEXSAMPS\WOODS +iWOOD_9
goto End
:End
