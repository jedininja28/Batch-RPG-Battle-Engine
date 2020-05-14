@ECHO OFF
SETLOCAL ENABLEEXTENSIONS
::SETLOCAL ENABLEDELAYEDEXPANSION

TITLE DAMAGE CALS 2
Pause
:Restart
SET /A Binary1=0
:Start
CLS
echo ==================Start==================

SET RandomHalf=16384
SET /A Divisor=100
SET /A RandomValue1=%random%/"%Divisor%"
IF /I %Random% LEQ %RandomHalf% ( SET /A Binary1=0 ) ELSE ( SET /A Binary1=1 ) 
IF /I %Binary1%==0 (ECHO ZERO) ELSE (ECHO ONE)
ECHO %RandomHalf% %Random%/%Divisor% %Binary1%

ECHO.
echo ===================End===================
PAUSE `````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
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


REM SET RandomHalf=16384 && SET /A Divisor=100 && SET /A RandomValue1=%random%/"%Divisor%"
REM IF /I %Random% LEQ %RandomHalf% ( SET /A Binary1=0 ) ELSE ( SET /A Binary1=1 ) 
REM IF /I %Binary1%==0 (ECHO ZERO) ELSE (ECHO ONE)
REM ECHO %RandomHalf% %Random%/%Divisor% = %Binary1%

REM ECHO  Divisor=%Divisor%
REM ECHO. 
REM ECHO  %dam% : RAW DAMAGE : %B3%

REM IF /I %dam% GEQ 162 (SET /A B3=1 ) ELSE (SET B3=0)
REM IF /I %dam% GTR 100 (SET /A Difference=%dam%-100) ELSE (SET Difference=0)
REM IF /I %dam% GTR 100 (SET B=1) ELSE (SET B=0)

REM SET /A dam2=%dam%-%Difference%

REM IF /I %dam2% LSS 100 (SET /A B2=0 ) ELSE (SET B2=1)

REM Echo  %dam2% : REDUCED TO : %B2%
REM echo  %Difference% : DIFFERENCE : %B%

:: SET Divisor=100
:: SET /A dam=%random%/"%Divisor%"
:: IF /I %dam% GEQ 162 (SET /A B3=1 ) ELSE (SET B3=0)
:: IF /I %dam% GTR 100 (SET /A Difference=%dam%-100) ELSE (SET Difference=0)
:: IF /I %dam% GTR 100 (SET B=1) ELSE (SET B=0)
:: SET /A dam2=%dam%-%Difference%
:: IF /I %dam2% LSS 100 (SET /A B2=0 ) ELSE (SET B2=1)
REM ECHO %RandomHalf% %Random%/%Divisor% = %Binary1%