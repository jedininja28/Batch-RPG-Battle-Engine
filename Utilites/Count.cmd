@ECHO OFF
::SETLOCAL ENABLEEXTENSIONS
::SETLOCAL ENABLEDELAYEDEXPANSION
Pause
:Start
CLS
SET /A count=%count%+1
ECHO %count%
PAUSE 
GOTO start