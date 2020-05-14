@ECHO OFF
Pause
:restart
SET tt=0
SET c=0
set /A Hp=0+%HP%

set tt1=0

:Start
CLS

set /a tt=%tt%+1 
IF /I %tt% GTR 10 goto Q
ECHO Hit Points: %hp% Turn Timer: %tt%

(SET /A ZO2=%Random%/2000)

(SET /A ZO=%Random%/16384)
(IF /I %ZO%==1 ( set /a hp=%hp%-%ZO2%) ELSE ( set /a hp=%hp%+1 ))

IF /I %ZO%==0 ECHO YOUR GETTING YOUR FUCKING ASS KICKED BY POISON AND SHIT!
IF /I %ZO%==1 ECHO YOUR LOSING FUCKING HIT POINTS MANS!
goto ResetTTend                                                         /
:ResetTT
SET c=0

:ResetTTend
SET /A c=%c%+1

PAUSE 
GOTO start

:Q
cls
set /a tt1=%tt1%+1 
set /a hp=%hp%+1 

IF /I %tt1% GTR 10 goto restart
ECHO Hit Points: %hp% Turn Timer: %tt1%

SET /A zeroone=(%Random%/16384)
if /I %zeroone% equ 1 (ECHO YOU REGENERATE YOUR FUCKING POWER!)
if /I %zeroone% equ 0 (ECHO YOU BLOCK ALL THE EVERYTHING WITH FUCKING SPACE LASERS!)
	
PAUSE 
GOTO start
