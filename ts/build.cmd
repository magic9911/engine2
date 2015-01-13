@echo off
REM
REM cnc-patch environment config
REM
set PATH=%PATH%;C:\win-builds-32\bin
make clean
make
pause
