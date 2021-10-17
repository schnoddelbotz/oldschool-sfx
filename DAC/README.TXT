  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
  ³                                                     ³
  ³ ***      *      ***                                 ³
  ³ *  *    * *    *                                    ³
  ³ *   *   * *   *           Digital Audio Copy        ³
  ³ *   *  *   *  *              Version 2.2            ³
  ³ *   *  *****  *     (C) 1995 by Christoph Schmelnik ³
  ³ *  *  *     *  *                                    ³
  ³ ***   *     *   ***                                 ³
  ³                                                     ³
  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
                             Documentation Version 2.0.2a

Sorry about my terrible English. If my teachers could read this, they get
Nightmares.

This Program is SHAREWARE.
You can test it for a period of 30 day and after that you must register.

It is allowed to copy the Shareware Version of this program and distribute
it on all medias, but it is not allowed for registered Users to copy their
Version besides a personal Backup.

THE AUTHOR (Christoph Schmelnik) DOES NOT UNDERTAKE ANY LIABILITY FOR ANY
DAMAGE CAUSED BY THIS PROGRAM. THERE ALSO NO GUARANTEE OF AN ERRORFREE
PROGRAMEXECUTION.


This Documentation is much smaller than the german, because of my first
Statement and the fact that I have no longer time for it.

Overview:

1.  The Program

1.1 Functions

1.2 System requirements

1.3 Installation

1.4 Changes since Version 2.1


2.  Using the Programs

2.1 Using DAC

2.2 Using CDCHECK


3.  Some Hints

3.1 About CDBench

3.2 About CDInfo and CDSize

3.3 Environment Variables

3.4 Configuration of SCSI Drives

3.5 Problems with SCSI Drives

3.6 Problems

3.7 List of tested Drives

3.8 Click sounds


4. Registering



1.  The Program

This Program was primary designed for grabbing Audio Data von CDs to the
Hard Drive. So the main aspect of this documentation will be the Part DAC.
But there are a lot of other Tools for CD-ROM drives which are also worth
for testing.

1.1 Functions

The functions of DAC:
 - read Digital Audio Data from CD and write it to Hard Disc
 - Converting from 44kHz 16 Bit Stereo to
   - 11 kHz or 22 kHz
   - 8 Bit
   - Mono (also with Channel Seperating)
 - delete Zero Samples at the beginning and end of a track
 - simultan access to all CD Drives
 - copy different tracks to seperated files in one pass
 - view information on all tracks of the Disc
 - view detailed information for the inserted Disc
 - play selected Tracks on all drives simultan
 - control all main functions of the drive
 - view actual state of the drives
*- save any section you want
*- play the marked sections and possibility to select interactive new
   sections

(*) Only available for registered Users.

The functions of CDCHECK:
 - Driveinformation as in DAC
 - View directories of the CD and all DOS files in it plus their size and
   position.
 - Analyze selected files for errors and ability to copy them to Hard Disc.
 - Check for Errorcorrection.
 - Final Report of all Results.


Here is a short overview of the included tools:
CDOPEN   - Opens the CD-Tray
CDCLOSE  - Closes the CD-Tray
CDLOCK   - Locks the CD-Tray
CDUNLOCK - Unlocks the CD-Tray
CDPLAY   - Plays a selected Track
CDSTOP   - Stopps the playing process
CDPAUSE  - Pauses the playing process
CDRESUME - Resumes the playing process
CDSKIP   - Skips to the next Audio-Track
CDSKIPB  - Skips to the previous Audio-Track
CDCHANGE - Checks if the CD have been changed
CDVER    - Reports the CD Extensiondriver Version
CDSIZE   - Reports the Size of the actual CD
CDRESET  - Resets the CD-ROM Drive and Driver
CDBENCH  - Performs a complete CD Benchmark
CDCHECK  - Checks the selected Files for errors
CDINFO   - Reports a lot of information on the inserted CD
SETLANG  - Selects the default Programlanguage


1.2 System requirements

-PC with 80286 Prozessor or higher
-500kB free DOS Memory
-500kB free Hard-Disc Space
-CDROM Drive.
 To copy Audiodata the drive must be able to read RAW Data of Audio-Sectors.
 Additionally the DOS Driver must support this mode.
 SCSI drives from following manufacturers are supported:
 Toshiba
 NEC (untested)
 Hitachi (untested)
 Sony (untested)
-Hard Disc with a lot of free space
-DOS (what ever you like - but above 3.2)
-installed CDROM Driver
-installed MSCDEX.
-installed ASPI Driver for SCSI Drives.
-Using in a OS/2 DOS Box is possible but restricted. The driver does not
 support all functions. Audio Grabbing is only available with SCSI Drives
 and a installed ASPI Driver for OS/2.

Audio Grabbing is not possible with any Mitsumi Drive!

1.3 Installation

While reading this text you must have done this allready, but i will
repeat it for you.

Before you start the installation Process you have 5 Files in your
Directory (This meens you have decompressed the Archive).
To start the installation Process you have to start the Programm INSTALL.EXE
in the Directory with the installation Files.
You have to select a target Directory for the Programm files and the
default Programlanguage and after that the Files are copied to the target
Directory.

To start the Tools after that you have to install the CD Extension Driver
and the correct CD-ROM Driver for your CD-ROM Drive.
For SCSI you have to install the ASPI Driver for your Controller.


1.4 Changes since Version 2.1

There are some changes and so i will try to remember:

- Bugfix in creating the ASPI Configurationfile
- Bugfix in ASPI Copy function
- Bugfix in Sectorsynchronisation
- Bugfix in DAC command-line Version (swapping 11kHz and 44kHz).
- Bugfix in CDCheck while reading Directories
- Bugfix for using with OS/2
- Bugfix of little Problems in the Userinterface of DAC and CDCheck
- Skip Forward and Skip Back in DAC
- View Information of the inserted CD in DAC and per
  separate program
- Save tracks in seperated files
- ASPI Synchroncopy
- View used and remaining time while copying
- Added configuration for number of sectors to read in CDCheck
- Extended CDSize

Greetings to all Bugs i let out and to all i did not find yet.


2.  Using the Programms

The Programs are almost self explaining, but I should say a few words about
the using of the SAA based Programms DAC and CDCHECK.


2.1 Using DAC

There are two possible ways to use DAC. The command line version invoked
by DAC with several parameters. To see a list of these parameters simply
type 'DAC ?' at DOS Prompt.
Typing 'DAC' without any parameter will invoke the SAA based Version of DAC.
Only here you will be able to change all parameters for copying Audio Data.
This is besides the sector synchronisation the most important change from
Version 1 to 2 so i will say a few words about it.
After starting DAC you will see (it could take a few seconds) windows for
each installed Drive in your system. Each window contain a area for the
drive state and a track listing. You can switch to the other windows with
the mouse or using the F6 functionkey. It is also possible to select directly
a Window pressing the ALT-Key and the number of the window.
All command you select from the Drive and Action menu refer to the actual
selected Drive.
You can select tracks in the list with the Space Bar and the right mouse
button. This selections are used for the play and copy functions. If you
select copy the whole range between the first and the last selection is used
except having the track separation option activated.
To invoke the copy dialog type F2 or Enter. In this dialog you are able to
select a filename and (only for registered Users) select a userdefined range
for copy. This function not available when track separation is activated.

If the CD Information does not appear this is a sign for a not fully
implemented Driver such as in OS/2.

Some words to the configuration:
I have changed a few things in the copy configuration so it is smaller but
possibly not so selfexplaining as before.
All options which could only take two values (true and false) are now in
a group of checkboxes. Activating a checkbox means activating the function.
The Options are:
- Sectorsynchronisation : This enables the function to avoid Click-Sounds in
                          resulting File.
- ASPI Interface : Enable use of ASPI Interface if available.
- Kill Zero-Samples : Delete silence periods at beginning and end of track
The following options are new in version 2.2:
- Trackseparation : Write each selected Track in its own file.
- ASPI Synchroncopy : Only for SCSI Drives. Overwrites the
                      Sectorsynchronisation and enables use of a special
                      function for mostly interrupt free data-transfer from
                      CD to Hard-Disc
There are also options to select the number of sector to read in one
read-cycle and to read again for sectorsynchronisation. The last value must
be maximal the half of the first one.
The options are pre selected at install-time to receive the best result in
quality and speed. But it is a good idea to test the options for further
improvements on each system.


2.2 Using CDCHECK

Using this program is almost equal to DAC. The Drive windows contains here
no state inforamtion and shows the files in a directorie including their size
and position. Changing the Directory is possible with the Enter Key or the
right Mouse Button.
To start the check function use the F2 Functionkey or Enter on a Filename!
This function is started immediatly so take care because of the long time
this could take.
After completing the check you will get a report with all results of the
tests which you are able to save in a file.
If Read-Errors are detected during the test, the program could try the file
to disc. This could configurate to be allway or after questioning or never.
It is also possible that a error corrected by the errorcorrection causes this
process.
New is the option to select the number of sectors read in one cycle such as
in DAC. This option is useful with drives (or drivers?) which have problems
to read more than 16 Blocks at each read progress (my Toshiba with the
Adaptec drivers has this problem). You con also use this to find the excact
sector of an error, making this size smaller.
A few word to OS/2. Here this program cannot be use because of the uncomplete
drivers of it.


3.  Some Hints

3.1 About CDBench

Let me tell you a short statement to this tool.
The values determined by this programm dependends on the System, the inserted
Disc and the Systemconfiguration. To get compareable results you should use
the same components with different drives.


3.2 About CDInfo and CDSize

These information refers to the stand alone tools and the integrated report
function in DAC.
Both functions take their information from the Primary-Volume-Descriptor,
der Table of Contents and from the tracks of the disc.
Not all results must be correct because i did not found sufficient
information. This applies to the detection of Hybrid-, Photo-, Video-
and Interactive-(CDI) CDs.
The second point is the size of discs with XA Extension. Here it is possible
that Sector in Form 1 and 2 are mixed in one Track. To test this it is
necessary to read each sector of the disc, but this would take al long time
even on a 4x spin Drive. So i decide to declare the whole track to the
format of its first legal sector. I think this is not a restriction because
of the fact that there are currently not many (i couldn't find any) Discs
which use this possibility of XA.


3.3 Environment Variables

You can use the Enviroment Variable DACSW for configuring a few main
functions.
Possible Values are:
-q : Quiet Mode. All unnecessary Screenoutputs are surpressed.
-S : Sony Fix enable. Allows DAC and CDCHECK to open the drive, even the
     the driver returns that the drive is already open.


3.4 Configuration of SCSI Drives

If you use a SCSI drive it could be possibly to edit the configuration
to make the program run. It is necessary to make a relation between the
DOS Drive-Letter and the SCSI Device-ID. This problem occurs sometimes when
more than one Drive is installed.
DAC uses the information of the ASPICD.CFG which will be automaticly installed
if it is not present and ASPI-Use is enabled. You can also generate this
file with the tool mapaspi.
This file can be edited with any ASCII Editor to correct the drive letter.
You could also test other drives which are not supported for use with DAC
by editing this file. In this case you must enter a valid value in the
manufactorer field (these are TOSHIBA,SONY,NEC,HITACHI). Each values must be
separated by commas.


3.5 Problems with SCSI Drives

I hope that there are no longer problems with them, besides not supported
drives (see 3.4). I need more Documentation!!!
It seem to be a common Problem of SCSI drives that they need a long time
to copy audio data (up to 5 times longer than playing time).


3.6 Problems

It is possible that DAC refuses copying a Track (specially the first on a
disc). Here you have to increase the start sector until DAC starts (only
available for registered users).
Similar problems are possible at the last Track. My Toshiba refuses to read
the last sector on a disc, but it is definitely present.
If you encounter other problems, write me a E-Mail.


3.7 List of tested Drives

I haven't tested all Drives by my own, so be careful with the information
below (besides the first two which are working in my system).
The listed drives are all able to read audio data. It would be great if
everone with an unlisted Drive (which is able to copy Audio Data) would
send me a E-Mail (with the exact Type-Description, Interface and Driver-
revision).

Here is the list:
Type-Description           Speed   Copy Speed   Interface      Driver
----------------------------------------------------------------------------
-Matsushita CR-562          2       2           ATBUS           alle
 (baugleich Panasonic und
  Creative CR-563)
-Toshiba 5301 TA            4       1           SCSI II         Adaptec
-Toshiba 3501 TA            4       1           SCSI II         Adaptec
-Toshiba 3601 TA            4,4     1           SCSI II         Adaptec
-Toshiba 5302b              4       ?           ATAPI           ??
-Sony CDU33A                2       2           ATBUS           ??
-Sony CDU55E                2       ?           ATAPI           >=2.24a
-Sony CDU55S                2       ?           SCSI II         ??
-Sony CDU76E                4       ?           ATAPI           ??
-Sony CDU76S                4       ?           SCSI II         ??
-Sony CDU561                ?       ?           SCSI            Adaptec

Definitions:
?,??  : unknown Value
ATBUS : Drives with its own Interface Card
ATAPI : Drives which could be connected like IDE-Hard Discs


3.8 Click sounds

My last tests shows the possibility of click sounds in the resulting Wave
File which are no results of a failed sectorsynchronisation. This problem
is caused by read difficulties of a frame in a sector. There is currently
no chance for DAC to detect this problem, so the only way to get good results
is to listen carefully to the Wave File and repeat the copying if you hear
any click.
I am currently working in a function to solve this problem, but this will
take some time because of the complex problem.
Please don't ask me any question about this problem until next year, except
for tips about a algorithm to find disharmonies in a Wave form or hints where
to find literature about it.


4. Registering

For registering please fill out the Formular in the File REGISTER.TXT
and send it along with the registration fee to me.
Please note that I want a good exchange rate, when you pay in any other
currency than DM.

The Units are only documented in german, but when this is no problem you
can order them too.


Adress:
Christoph Schmelnik
Stolzingweg 29
D-45307 Essen
Germany

Email:
Fido: 2:2448/2010.4
Internet: christoph@kali.rhein-ruhr.de
          Christoph.Schmelnik@eslapion.mediaserve.de
Compuserve: INTERNET:christoph@kali.rhein-ruhr.de
