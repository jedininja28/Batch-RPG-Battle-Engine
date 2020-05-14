@ECHO OFF
::SETLOCAL ENABLEEXTENSIONS
::SETLOCAL ENABLEDELAYEDEXPANSION

TITLE DAMAGE CALS 3
Pause
:Start
CLS
ECHO ==================Start==================
ECHO.
SET D=100 && SET RH=16383 && SET R=%Random% 
(SET /A H=%R%/2) && (SET /A RV=%R%/%D%)
IF /I %R% LSS %RH% (SET B=0) ELSE (SET B=1)
ECHO %H% : %R%/%D% - %B%
ECHO.
ECHO ===================End===================
PAUSE
GOTO start

:Q
ECHO hey
PAUSE 
GOTO start

:W
ECHO hi
PAUSE 
GOTO start

:E
ECHO hello
PAUSE 
GOTO start
