REM REARJ program to convert ZIP, LZH archives on C: hard disk to ARJ format
REM You should have a backup of your hard disk before running this program
REM This program converts the archives to ARJ format deleting the originals.
REM It also checks for viruses assuming you have SCAN.

REARJ C:\*.ZIP C:\*.LZH /r /v /d /a* /u /lC:\REARJ.LOG
