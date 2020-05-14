@ECHO OFF
:Start
CLS
SET /A R0=%RANDOM%
SET /A ZO=%R0%/8191
IF /I %ZO% EQU 0 (ECHO 0) else IF /I %ZO% EQU 1 (ECHO 1) else IF  /I %ZO% EQU 2 (ECHO 2) else IF  /I %ZO% EQU 3 (ECHO 3)
PAUSE 
GOTO start
