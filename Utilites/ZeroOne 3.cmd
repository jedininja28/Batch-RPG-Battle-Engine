@ECHO OFF
Pause
:Start
CLS
SET /A R0=%RANDOM%
SET /A ZO=%R0%/16384 
IF /I %ZO% EQU 1 (GOTO W) ELSE (GOTO Q)

:Q
ECHO hey
PAUSE 
GOTO start

:W
ECHO hi
PAUSE 
GOTO start
