September 1, 1993

Title:      Documentation for SNOOP, an Ethernet data snooper
Written by: Rahner James
Copyright (c) September 1993, Ryu Consulting
                              8476 Oakwind Court
                              Orangevale, CA 95662
                              (916) 722 - 1939
                              (BBS) 722 - 1984


Purpose
--------
This is a simple document that will allow you to use SNOOP, the
Ethernet data snooper for NE-2000 compatible interface boards.
A more complete description is provided with the paid version.
Additionally, an ODI compatible SNOOP is available with the paid
version.


Semi-legal Stuff
-----------------
This program may be used for any non-commercial purpose.  It has
been released to demonstrate the real version.  It does not have
to work.  It is distributed "as is", so there is no implied or
directly stated warranty.  If it makes your system freeze up and
die, well tough.  Don't blame Ryu Consulting or Rahner James,
because we told ya so.  Don't expect us to support it, unless
you have cold hard cash.


Environment Requirements
-------------------------
NE-2000 network interface controller or one of it's many clones
running on an 80286 or higher.
EGA or VGA adapter with a color monitor advisable.


Introduction
-------------
SNOOP allows the user to look at the data traffic on an Ethernet
network.  It is aimed specifically at a Novell Netware network
although it will work with other network operating systems.

I wrote this program to monitor and analyze the network traffic in
real-time.  I have worked with other sniffers and snoopers and
have generally been disappointed.  They have all these fancy dials
and switches, and all I really wanted was to know what was being
sent from one node to another.

SNOOP allows you to view data packets in real-time, with minimal
packet loss only in very high traffic environments.  It allows
the user to write the packets to a file, view previously stored
packets and print them on a printer.  It allows the user to select
which nodes are being monitored and which sockets.

Heavy traffic on a network can be overwelming for SNOOP if it is
run on a slow machine (particularly if file logging is turned on).
If this happens, try setting the real-time viewing mode to 1 or 2,
or run SNOOP on your fastest system and log to a RAM disk.


Program Execution
------------------
SNOOP is run from MS-DOS with the following command line syntax:

       SNOOP [options]

where [options] is a list of options to modify SNOOP's execution.
If you want to run with the defaults, just type:

       SNOOP

The default running parameters are:

       IRQ 11
       Base port address 300h
       Look at all packets

The command line options are as follows (case insensitive):

? - command list
Lists the available command line options.  This does not run the
program.


F - source node address
Allows the user to access packets being transmitted from a specific
node ID.  Assume that you wanted to see packets coming from node IDs
0080C8205D73 and 0080C8205F26, you would use the following command
line:

	SNOOP F0080C8205D73 F0080C8205F26

Up to ten source node addresses may be specified.


T - destination node address
Allows the user to access packets being transmitted to a specific
node ID.  Assume that you wanted to see packets going to node IDs
0080C8205D73 and 0080C8205F26, you would use the following command
line:

	SNOOP T0080C8205D73 T0080C8205F26

Up to ten destination node addresses may be specified.


A - node address
Allows the user to access packets being transmitted to or from a
specific node ID.  Assume that you wanted to see packets being sent
to and from nodes IDs 0080C8205D73 and 0080C8205F26, you would use
the following command line:

	SNOOP A0080C8205D73 A0080C8205F26

Up to ten node addresses may be specified.


B - set base port
Sets the base port address of the NE-2000.  The number must be in
hexadecimal.  The default base port address is 320h.  This is not
usual, but it is the one I use for my develop systems, that way I
can have one NE-2000 attached to the network and another NE-2000
to use for snooping on the same system.  If you want to use base
port 300h, use the following command line:

       SNOOP B300


I - interrupt number
Sets the IRQ number to use for the NE-2000.  This number must be
in decimal.  The default setting is 11.  To set IRQ-15, for example,
use the following command line:

       SNOOP I15


O - ignore IPX TSR
Normally, when SNOOP starts up, it checks to make sure IPX is not
currently loaded (except with the R option).  If only one NE-2000
is being used, SNOOP can not be run with IPX.COM loaded.  If you
wish to circumvent this check, use the following command line:

       SNOOP O


R - read file
Allows the user to read and view a previously logged file.  The
file will be loaded and the user may page through the packets
and send them to a printer.  If no filename is specified, this
option will read the file PACKETS.DAT.  To view a previously
logged file called, GEORGE.PAK, use the following command line:

       SNOOP RGEORGE.PAK

This option does not access the NE-2000 regardless of any other
command line options.  Only one file may be viewed at a time.


S - socket
Allows the user to specify which sockets are to be accessed.
In order to access packets on sockets 5000h and 451h, the
following command line would be used:

       SNOOP S5000 S451

This option can be used in conjunction with the A, F and T options
to further specify the packets that you wish to access.  If no
sockets are defined, all sockets are viewed.  Up to ten sockets
may be specified.  This is disabled in the non-paid version.


W - write packet file
Allows the user to specify a file to create and write any accessed
packets.  For example, to write data packets to the file JOE.NVL,
the following command line syntax would be used:

       SNOOP WJOE.NVL

If no filename is specified, the file PACKETS.DAT will be used.
This option will overwrite any file of the name specified without
warning the user, so be careful with your name selection.  DO NOT
WRITE PACKETS TO A NETWORK DRIVE OR YOU WILL REGRET IT.  DATA
DEATH MAY OCCUR.  DON'T DO IT!!!!  I REALLY MEAN IT!!!


Keys Accepted During Real-time Monitoring (case sensitive)
-----------------------------------------------------------

? or F1
Shows the user a list of the acceptable key commands.

1 - show counts
Shows the user the current packet counts and various statistics.
This is a good display method if there is a possiblity of not
logging all the packets.


2 - show lines
Displays single line entries for all the packets coming in. 
This is a good display method if there is a possiblity of not
logging all the packets.


3 - full packet display
Allows the user to view the entire packet (depending on screen
size).  This tends to slow the logging process down, so in a
high traffic environment, it is not the best display if you are
logging packets.


c - clear display
If the display gets messy, use this key to initialize it.


l - start logging
Start logging packets to a file.  Uses file specified by the 'W'
option or PACKETS.DAT if none was specified.


s - stop logging
Stops file logging and closes the file.  If the logging is reopened,
this file will be overwritten.


Keys Accepted During File Viewing (case sensitive)
---------------------------------------------------

UP arrow
Moves up one page in the packet buffer display.

DOWN arrow
Moves down one page in the packet buffer display.

LEFT arrow
Moves down one byte in the packet buffer display.

RIGHT arrow
Moves up one byte in the packet buffer display.

HOME
Moves to the first packet in the file.

END
Moves to the last packet in the file.

PGUP
Moves back one packet in the file.

PGDN
Moves forward one packet in the file.

0
Allows the user to set the timer base at 0 for a particular
packet.  All other packet times will be displayed relative to
that time.

/
Allows the user to display the packet times in microseconds
or milliseconds.  The timer is a very rough estimate and should
only be used to get a rough idea of the exact time of each
packet received.  In the microsecond range, the timer display
is in 1.119 microseconds.  The millisecond range is 1024 times
that value.

E or e
Allows the user to move to specific packet number.

P or p
Prints the currently displayed packet.  This is defeated in the
non-paid version.

S or s
Search forward (S) or backward (s) for a specific NCP packet.
Very handy for checking out specific processes.

T or t
Allows the user to move to a packet time value.

^L (that's control-L)
Purges the print buffer.  This is primarily to get the print
server to spit out the current page.


Conclusion
-----------
Well, there are other things about the program, but you will have
to browse through it and see for yourself.  The format may be a
little busy at first, but you will get used to it fairly quickly.


If you would like to get rid of the signon and enable all the
options, send US$95.00 to:

	Ryu Consulting
	8476 Oakwind Court
	Orangevale, CA  95662

	Checks payable to: Ryu Consulting
	Handling/shipping is included.
	Outside US, add US$15.00
