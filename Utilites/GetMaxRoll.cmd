@ECHO OFF
SETLOCAL ENABLEEXTENSIONS
::SETLOCAL ENABLEDELAYEDEXPANSION
TITLE Get Max Roll

Pause
:Start
CLS
echo ==================Start==================

SET Divisor=150
SET /A roll=%random%/"%Divisor%"
set /a var=var
IF %roll% GTR %var% SET /A var=%roll%
ECHO %random% %roll% %Divisor% %var%

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

:: SET Divisor=100
:: SET /A roll=%random%/"%Divisor%"
:: IF /I %roll% GEQ 162 (SET /A B3=1 ) ELSE (SET B3=0)
:: IF /I %roll% GTR 100 (SET /A blah=%roll%-100) ELSE (SET blah=0)
:: IF /I %roll% GTR 100 (SET B=1) ELSE (SET B=0)
:: SET /A roll2=%roll%-%blah%
:: IF /I %roll2% LSS 100 (SET /A B2=0 ) ELSE (SET B2=1)