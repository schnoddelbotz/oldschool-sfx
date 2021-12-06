@echo off
ncedit jan.pov
cls
echo\
echo Rendering...
povray +Ijan.pov +OJan.tga +V320 +H200 -V -D -X
c:\gfx\qpeg\qpv jan.tga
editor.bat