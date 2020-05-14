@ECHO OFF
::SETLOCAL ENABLEEXTENSIONS
::SETLOCAL ENABLEDELAYEDEXPANSION
::SETLOCAL DISABLEEXTENSIONS
::SETLOCAL DISABLEDELAYEDEXPANSION
TITLE STRING TESTER2

Pause
:Start
CLS
echo ==================Start==================
ECHO.

SET /A Divisor=100
SET /A var=%random%/"%Divisor%"
 
ECHO  %var% : RAW DAMAGE : %B3%

IF /I %var% GEQ 163 (SET B3=1) ELSE (SET B3=0)
IF /I %var% GTR 100 (SET /A Difference=%var%-100) ELSE (SET /A Difference=0)
IF /I %var% GTR 100 (SET B=1) ELSE (SET B=0)

SET /A var2=%var%-%Difference%

IF /I %var2% LSS 100 (SET B2=0) ELSE (SET B2=1)

Echo  %var2% : REDUCED TO : %B2%
echo  %Difference% : DIFFERENCE : %B%

ECHO.
echo ===================End===================
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