��
ScanSoft(tm)  26HDCOM v2.01 (C)1991 Cornel Huth
Harddisk and communication port monitor
$12/06/90
HDmode:1...OK                        BAD COMMAND               ADDRESS MARK NOT FOUND    WRITE PROTECT ERROR       SECTOR NOT FOUND          RESET FAILED              DISKETTE REMOVED          BAD PARAMETER TABLE       DMA OVERRUN               DMA ACROSS 64K BOUNDARY   BAD SECTOR FLAG DETECTED  BAD TRACK FLAG DETECTED   BAD MEDIA TYPE            TOO MANY SECTORS ON FORMATCTRL DATA ADDR MARK FOUND DMA ARBTRA`N OUT-OF-RANGE UNCORRECTABLE ECC         ECC CORRECTED DATA FAILUREGENERAL CONTROLLER FAILURE3x - UNKNOWN ERROR        SEEK FAILED               5x - UNKNOWN ERROR        6x - UNKNOWN ERROR        7x - UNKNOWN ERROR        TIME-OUT                  9x - UNKNOWN ERROR        DRIVE NOT READY           UNDEFINED ERROR OCCURED   WRITE FAULT               Dx - UNKNOWN ERROR        STATUS ERROR/ERROR REG = 0SENSE OPERATION FAILED     ������������  zkll l]^^
                          Z:0000 Hd:00 Sc:00                                                              $        DTRRTSCTSDSRRI DCDNONE       �PSQRUWV��Ȏ��\�>� uR�� �@ ���� �>` t�k���H �>�u+�
�P �&�>�u&� u�.�ŋ������^_]ZY[X�.��  .�.�+���������@��&�I <t<t<t�y�&�>c �u�� � �� ���� �� �� ��  �p�3&�>�  u&�>�  t&�>� w &�� t�����������&�t �^<v���2�:_t
�u
�\;Zr�_�\  � ����u���>q4�D �
�>q3tu�>q2t?�>q1t� &�C 0�&�&D ���Ā�&�E �� � &�D $?2�@�� � �&�G $0�&�&F &�E �� �z &�D $?2�� �i ú��$�� �Y ���$��J�� �F ���$?2�� �5 úv�$�� �% �u�$��J�� � �s�$?2�� � û
 3����0�U��t63����0�U��t'3����0�U��t3����0���t
3����0�U�Ëa��R������B���u�z  �� º ��zZ��$�}�����$�~�����2���u�|�a���$�����y���$yÌȎ��c�9W� �! �_�� QVW�yt� ����_^�����Y��z�R� ����W�|��}0��~0�����	�!�� 3ی�C;Î�tn� ��� ��u�&߀>Uu��>Hu��	�!� ���>Cu�?��>Ru��>Su� �>Mu� ��> u�l�	�!����	�!��:� �  ���<0t��rE<4wA�&�` ���+���,1���a�@ ��3��a��&�&�a&�`���	�!� �G�	�!��>���1r��4w�&&�&q�e�	�!� ����	�!��&�\  �5�!X��;�u3P&��&���ظ%�!�Ȏ��@ �����>��  Pu�\����,� P�	�!X� �@ �����>�t���	�!�� �����	�!�5�!����;�ut&��&�����%�!� �h��5�!X��;�u^��&��&���ظ%�!�Ȏ�&� ��&�, �ôI�!r���I�!s���	�!���@ ������>�u����	�!� �L�!���	�!���> t�:�	�!����@ �����>�t�f�	�!��ø5�!�������%�!�� �� �P�	�!�>�u��	�!�����B� 1�!�� � �  ���tF��/u��F��߉�<t0< t,�� t7��0t2��9w9��0r4<9w0<0r,��0,0�Ȋĳ
���À�9w��0r��0���<9w��0r,0ð �Q�2�P$���<	v7�0�� t	��X$� �����YûZ�Ȇ�����������G�������G�����G�q�À>�uË �>�u	������>�u	������������B�J���À>�uË �>�u	������>�u	������������B�J����*** Error in releasing memory - suggest a REBOOT ASAP!
$*** Cannot become dormant - interrupt 1Ch has changed.
$*** Cannot install - must be in BIOS video modes 2, 3, or 7 (25 lines).
$*** Cannot restore - must be in BIOS video modes 2, 3, or 7 (25 lines).
$*** Cannot remove from memory - interrupt 1Ch has changed.
$*** Parameter ignored - install program first.
$*** Already installed - use /R to restore, /H for help.
$*** COM port parameter not valid (0-4).
$*** Invalid controller interpret mode (1-4).
$Use HC         * install TSR to monitor status
    HC /U      * uninstall & release memory
    HC /S      * sleep mode
    HC /R      * restore status line and awaken if in sleep mode
    HC /Cn     * monitor COM port (n=1-4  0=off)
    HC /Mn     * select controller BIOS data interpret mode (n=1-4)
    HC /H      * help

$INT 1Ch:  0000:0000
Controller interpret mode:0
$Uninstalled & released from memory.
$Sleep mode.  Use /R to restore.
$Restored.
$COMx: monitoring activated.
$COM port monitoring deactivated.
$
Use <Alt> or <Scroll Lock> to toggle display line.
$