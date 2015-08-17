@echo off
rem Please note, the only reason this demo uses very poor and 
rem inconsistent command formating, is demonstrate the flexibility
rem of the V8Power Tools option parsing.

if not exist BIN\NUL goto MakeDemo
goto LetsGo

:MakeDemo
if not exist mkV8.bat goto NoJoy
call mkV8.bat
if ERRORLEVEL 1 goto NoJoy

goto LetsGo

:NoJoy
echo Unable to do demo.
goto Done

:LetsGo

cd bin

rem DosBOX Test
set DBTEST=yes
echo. | set /p DBTEST=
if "%DBTEST%" == "yes" goto DosBOX
vcursor | set /p MYCURSOR=
goto NotDosBOX
:DosBOX
set MYCURSOR=small
:NotDosBOX
vcursor hide

:StartUp
vcls /fGray /bBlue /c 0xb0
rem Title Bar
vgotoxy /x1/y1
vcls /b Gray /f Black EOL
vgotoxy /x 28 /y 1
vecho /f Black "Something " /fRed '1.0' /fBlack " Installation"

rem Temporary bottom menu bar
vgotoxy eop /x1
vcls /bGray /fBlack /c0 EOL
vgotoxy eop sor
vecho /n  "Previous " /fWhite "(" /fRed "Alt+P" /fWhite ")"
vgotoxy right
vecho /n "|"
vgotoxy right
vecho /n "Next " /fWhite "(" /fRed "Alt+N" /fWhite ")"
vgotoxy /x68 
vecho /n "Quit " /fWhite "(" /fRed "Alt+Q" /fWhite ")"

vframe /bBlue /fGray /x16 /y7 /w48 /h11 Hidden Shadow
vframe /x18 /y7 /w44 /h11 DoubleSides
vcls /L /fYellow
vecho
vecho /fLightGreen " What would you like to see?"
vline Hidden Dumb

:TryAgain
vecho /fLightCyan  "   X. " /fYellow "Progress and Multi-Window Demo "
vecho /fLightGreen "   5) " /fYellow "Display Locations and Writing Demo "
vecho /fLightGreen "   b: " /fYellow "Cursor Movement Demo "
vecho
vgotoxy /l /x8
vecho /n /fWhite " 0" /fGray " - " /fLightRed "Return to " 
vecho /n /fLightMagenta "DOS "

vchoice auto /d100/t15/fWhite/bRed

if errorlevel 4 goto AllDone
if ERRORLEVEL 3 goto PartC
if errorlevel 2 goto PartB
if errorlevel 1 goto PartA

rem goto TryAgain
goto NextPart
:PartA
vcls /fGray /bBlue /c 0xb0 /y2/h23

rem make top left frame and put some text there
vframe /bGray /fBlue /x4 /y5 /w35 /h10 Single Shadow
vcls /L /fBlack
vecho "Top Left frame."

rem make top right frame and put some text there
vframe /bGray /fRed /x42 /y5 /w35 /h10 Double Shadow
vcls /L /fBlack
vecho "Top Right frame."
vpcspkr 200:200 200 200:200 200 200:200 200
vpcspkr	150:100 100 250:100 100 200:200 200
vpcspkr 150:100 100 250:100 100 200:200 200 0

rem Progress bar frame
vframe /bBlue /fLightCyan /x6 /y18 /w70 /h3 Hidden Shadow
vprogres 0 left

rem back to Top Left Frame
vgotoxy /g /x5 /y6 
vgotoxy /l eot next next
vecho /fRed "Blah, Blah, Blah."
vdelay 500
vgotoxy /x7 /y19
vprogres 1 left

rem back to Top Left Frame
vgotoxy /g /x43 /y6 
vgotoxy /l eot next next
vecho /fBlue "Blah, Blah, Blah."
vdelay 500
vgotoxy /x7 /y19
vprogres 2 left

rem back and forth a bit
vgotoxy /x 5 /y 6 /l eot next next
vecho /fBlue "More, More, More."
vdelay 250
vgotoxy /x7 /y19
vprogres 3 left

vgotoxy /x43/y6 /l eot next next
vecho /fRed "More, More, More."
vdelay 250
vgotoxy /x7 /y19
vprogres 4 left

vgotoxy /x5/y6/l eot next next
vecho /fRed "More, More, More."
vdelay 250
vgotoxy /x7 /y19
vprogres 5 right
vgotoxy /x43/y6/l eot next next
vecho /fBlue "More, More, More."
vdelay 250
vgotoxy /x7 /y19
vprogres 6 right
vgotoxy /x5/y6/l eot next next
vecho /fBlue "More, More, More."
vdelay 250
vgotoxy /x7 /y19
vprogres 7 right
vgotoxy /x43/y6/l eot next next
vecho /fRed "More, More, More."
vdelay 250
vgotoxy /x7 /y19
vprogres 8 right
vgotoxy /x5/y6/l eot next next
vecho /fRed "More, More, More."
vdelay 250
vgotoxy /x7 /y19
vprogres 9 right
vgotoxy /x43/y6/l eot next next
vecho /fBlue "More, More, More."
vdelay 250
vgotoxy /x7 /y19
vprogres 10 right
vgotoxy /x5/y6/l eot next next
vecho /fBlue "More, More, More."
vdelay 250
vgotoxy /x7 /y19
vprogres 11
vgotoxy /x43/y6/l eot next next
vecho /fRed "More, More, More."
vdelay 250
vgotoxy /x7 /y19
vprogres 12
vgotoxy /x5/y6/l eot next next
vecho /fRed "More, More, More."
vdelay 250
vgotoxy /x7 /y19
vprogres 15
vgotoxy /x43/y6/l eot next next
vecho /fBlue "More, More, More."

vgotoxy /x7 /y19
vprogres 49
vdelay 500
vgotoxy /x7 /y19
vprogres 50
vdelay 500
vgotoxy /x7 /y19
vprogres 51
vdelay 500
vgotoxy /x7 /y19
vprogres 52
vdelay 500

vgotoxy /x5/y6/l eot 
vecho
vecho
vecho /fBlue "Faster, faster and faster."
vgotoxy /x43/y6/l eot
vecho
vecho
vecho /fRed "Faster, faster and faster."
vgotoxy /x5/y6/l eot next next
vecho /fRed "Faster, faster and faster."
vgotoxy /x43/y6/l eot next next
vecho /fBlue "Faster, faster and faster."
vgotoxy /x5/y6/l eot next next
vecho /fBlue "Faster, faster and faster."
vgotoxy /x43/y6/l eot next next
vecho /fRed "Faster, faster and faster."
vgotoxy /x5/y6/l eot next next
vecho /fRed "Faster, faster and faster."
vgotoxy /x43/y6/l eot next next
vecho /fBlue "Faster, faster and faster."
vgotoxy /x5/y6/l eot next next
vecho /fBlue "Faster, faster and faster."
vgotoxy /x43/y6/l eot next next
vecho /fRed "Faster, faster and faster."
vgotoxy /x5/y6/l eot next next
vecho /fRed "Faster, faster and faster."
vgotoxy /x43/y6/l eot next next
vecho /fBlue "Faster, faster and faster."

vgotoxy /x7 /y19
vprogres 98
vdelay 1000
vgotoxy /x7 /y19
vprogres 99
vdelay 1000
vgotoxy /x7 /y19
vprogres 100
vdelay 3000

vgotoxy /x5/y6
vcls /l/fBlue
vecho "Now I will write " /fRed "V8Power Tools!" 
vecho /n /fBlue "in the other box "
vecho /fBlack 10,000 /fBlue " times."
vgotoxy /x43/y6/l
vcls /l/fRed
vdelay 2000
vecho /fRed /r10000 "V8Power Tools! "
vgotoxy /x5/y6/l eot next
vecho
vecho
vecho /fRed "Pretty neat, eh?"
vdelay 2000

goto NextPart

:PartB
cd ..
call Demo1.bat
cd bin
goto NextPart

:PartC
cd ..
call Demo2.bat
cd bin
goto NextPart

:NextPart
goto StartUp

:AllDone
vcls text
vdelay 2000

vcls 	/a0x07
vecho Goodbye...
rem restore the cursor size and shape
vcursor %MYCURSOR%
set MYCURSOR=
set DOSBOX_TEST=
cd ..
:Done