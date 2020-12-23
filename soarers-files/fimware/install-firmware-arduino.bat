@ECHO OFF
TITLE soarers-dongle Firmware Flasher
echo I encourage you to read the Wiki page (https://github.com/vaugerbird/soarers-dongle/wiki/How-to-flash-the-firmware) about this process before continuing. If you feel you can figure it out, continue on.
PAUSE
cls
set /p ard="Do you have the Arduino IDE installed? [y/n]"
if /i '%ard%'=='n' goto ardinst
if /i '%ard%'=='y' goto cont

:ardinst
echo Please install the Arduino IDE from https://www.arduino.cc/en/software before continuing.
PAUSE

:cont
cls
set /P filepath="Paste entire file path of the included firmware file now: "
cls
echo Please enter programming mode now. If you need help entering programming mode, please read step 3 on this page (https://github.com/vaugerbird/soarers-dongle/wiki/How-to-flash-the-firmware).
PAUSE
cls
set /P port="Please enter the port number of the dongle when in programming mode: "
cls
"C:\Program Files (x86)\Arduino\hardware\tools\avr\bin\avrdude" -CC:"\Program Files (x86)\Arduino\hardware\tools\avr\etc\avrdude.conf" -v -patmega32u4 -cavr109 -PCOM%port% -b57600 -D -Uflash:w:"%filepath%":i
echo If AVRDUDE threw any errors, please see the troubleshooting section on the Wiki
PAUSE