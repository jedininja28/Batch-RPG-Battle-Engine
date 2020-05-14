@ECHO OFF
Pause
:Start
CLS
SET /A dice=%Random%/5461+1
echo %dice%
PAUSE 
GOTO start
