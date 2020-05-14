@ECHO OFF
Pause
:Start
CLS

SET /A R0=%RANDOM%
SET /A R1=%RANDOM%
SET /A X=%R0%-%R1%
ECHO %X%

PAUSE 
GOTO start
