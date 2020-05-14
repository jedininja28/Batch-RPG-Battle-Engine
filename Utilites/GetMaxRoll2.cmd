@ECHO OFF
SETLOCAL ENABLEEXTENSIONS
::SETLOCAL ENABLEDELAYEDEXPANSION
TITLE Get Max Roll 2

PAUSE
:Start
CLS
ECHO ======================Start======================

SET Divisor=10000

SET /A R1=%random%
SET /A R2=%random%
SET /A R3=%random%
SET /A R4=%random%
SET /A R5=%random%
SET /A R6=%random%
SET /A R7=%random% 
SET /A R8=%random%
SET /A R=R1+R2+R3+R4+R5+R6+R7+R8

SET /A Roll=%R%/"%Divisor%"
SET /A Var=Var
IF %Roll% GTR %Var% SET /A Var=%Roll%
SET /A half=Var/2

ECHO.
ECHO  %R1% %R2% %R3% %R1% %R5% %R1% %R7% %R8%
ECHO.
ECHO         Roll: %R%  
ECHO      Divisor: %Divisor% 
ECHO          R/D: %Roll%
ECHO      MaxRoll: %Var% 
ECHO  HalfMaxRoll: %half%
ECHO.
ECHO =================================================
ECHO.
ECHO  R1-R8=R R/DIVISOR=MaxRoll MaxRoll/2=HalfMaxRoll
ECHO.
ECHO =================================================
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