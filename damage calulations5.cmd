@ECHO OFF
::SETLOCAL ENABLEEXTENSIONS
::SETLOCAL ENABLEDELAYEDEXPANSION
::SETLOCAL DISABLEEXTENSIONS
::SETLOCAL DISABLEDELAYEDEXPANSION
TITLE DAMAGE CALC 5

Pause
:Start
CLS
echo ==================Start==================
ECHO.
SET D=100
SET RH=163
SET R=%Random% 

SET mD=100
SET mRH=163
SET mR=%Random% 

SET STR=8
SET DEX=8
SET INT=8

SET mSTR=8
SET mDEX=8
SET mINT=8

SET /A HiTPoints=100+(%STR%/4)
SET /A Enegry=100+(%INT%/3)
SET /A Stamina=100+(%DEX%/2)

SET /A mHiTPoints=100+(%mSTR%/4)
SET /A mEnegry=100+(%mINT%/3)
SET /A mStamina=100+(%mDEX%/2)

set armor=1
set weapon=1
set marmor=1
set mweapon=1

set Level=1

:LevelUp
SET /A Level=%level%+1

SET /A STR=%STR%+1
SET /A DEX=%DEX%+1
SET /A INT=%INT%+1

SET /A HiTPoints=%HiTPoints%+2
SET /A Enegry=%Enegry%+2
SET /A Stamina=%Stamina%+2

::TURN 1 PLAYER
SET /A H=%R%/2
SET /A RH=%R%/%D%

SET /A damage=1 + %R% / 100 + (%STR%/4) + ( %weapon% - %marmor% )


::TURN 2 MONSTER
SET /A mH=%mR%/2
SET /A mRH=%mR%/%mD%

SET /A mdamage=1 + %mR% / 100 + (%mSTR%/4) + ( %mweapon% - %armor% )


:DISPLAY

ECHO pDEBUG: %H% : %R%/%D% : %damage% - %weapon% - %armor%
ECHO mDEBUG: %mH% : %mR%/%mD% : %mdamage% - %mweapon% - %marmor%
::BATTLECALCULATOR

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