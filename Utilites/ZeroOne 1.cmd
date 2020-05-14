@ECHO OFF
Pause
:Start
CLS
(SET /A ZO=%Random%/16384)
ECHO %ZO%
PAUSE 
GOTO start
