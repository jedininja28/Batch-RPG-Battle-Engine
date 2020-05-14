@ECHO OFF
Pause
:Start
CLS

set /a tt=%tt%+1
IF /I %tt% GTR 10 goto Q
ECHO %tt%

SET /A c=%c%+1
ECHO %c%

SET /a D=32767/"%c%"
ECHO %D%

PAUSE 
GOTO start

:Q
cls
ECHO LEVEL UP!
PAUSE 
GOTO start
