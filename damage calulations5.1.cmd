@ECHO OFF
SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION
::SETLOCAL DISABLEEXTENSIONS
::SETLOCAL DISABLEDELAYEDEXPANSION
TITLE DAMAGE CALC 5.1
:: (%R%/100) on Weapon  To set 
Pause
::echo ==================Start==================
:RESTART
CLS
SET STR=8
SET DEX=8
SET INT=8

SET mSTR=8
SET mDEX=8
SET mINT=8

SET /A HitPoints=100+(%STR%/4)
SET /A Energy=100+(%INT%/3)
SET /A Stamina=100+(%DEX%/2)

SET /A mHitPoints=100+(%mSTR%/4)
SET /A mEnergy=100+(%mINT%/3)
SET /A mStamina=100+(%mDEX%/2)

set Armor=1
set Weapon=1
set mArmor=1
set mWeapon=1

SET Kill=0
SET Death=0
set SBecost=10

set Level=1


goto Blank

:START

:Roll
SET D=100
SET RH=163
SET R=%Random% 

:mRoll
SET mD=100
SET mRH=163
SET mR=%Random% 

:Battle Math

:TURN 1 
::PLAYER ROLL
SET /A H=%R%/2
SET /A RH=%R%/%D%

::attributes
SET /A damage=1 + (%STR%/4) + (%Weapon%-%mArmor%)

::SET /A mHitPoints=%mHitPoints%-%damage%
:DISPLAY
TITLE %STR% %DEX% %INT% HitPoints:%HitPoints% Stamina:%Stamina% Energy:%Energy% Kill/Death:%Kill%/%Death%
CLS
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO.
ECHO.
ECHO    pDEBUG: %H% : %R%/%D% : %damage% - %Weapon% - %Armor%
ECHO.
ECHO    mDEBUG: %mH% : %mR%/%mD% : %mdamage% - %mWeapon% - %mArmor%
ECHO.
ECHO.
ECHO  Wep:%Weapon%                    Arm:%Armor%
ECHO ===============================================
ECHO  Life:%HitPoints%             Energy:%Energy%
ECHO ===============================================
ECHO  Stamina:%Stamina%          %Kill%/%Death%
ECHO ===============================================

IF %mHitPoints% LEQ 0 (SET /A Kill=%Kill%+1) else IF %HitPoints% LEQ 0 (SET /A Death=%Death%+1)
IF /I %HitPoints% LEQ 0 GOTO Lose
IF /I %mHitPoints% LEQ 0 GOTO Win
::IF /I %mHitPoints% LEQ 0 GOTO Win ELSE GOTO Turn 2
PAUSE>NUL
goto TURN2

:TURN2
::MONSTER ROLL
SET /A mH=%mR%/2
SET /A mRH=%mR%/%mD%

::Mattributes
SET /A mdamage=1 + (%mSTR%/4) + (%mWeapon%-%Armor%)

::SET /A HitPoints=%HitPoints%-%mdamage%

::battle

TITLE %STR% %DEX% %INT% HitPoints:%HitPoints% Stamina:%Stamina% Energy:%Energy% Kill/Death:%Kill%/%Death%
CLS
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO.
ECHO.
ECHO    pDEBUG: %H% : %R%/%D% : %damage% - %Weapon% - %Armor%
ECHO.
ECHO    mDEBUG: %mH% : %mR%/%mD% : %mdamage% - %mWeapon% - %mArmor%
ECHO.
ECHO.
ECHO  Wep:%Weapon%                    Arm:%Armor%
ECHO ===============================================
ECHO  Life:%HitPoints%             Energy:%Energy%
ECHO ===============================================
ECHO  Stamina:%Stamina%          %Kill%/%Death%
ECHO ===============================================

IF %mHitPoints% LEQ 0 (SET /A Kill=%Kill%+1) else IF %HitPoints% LEQ 0 (SET /A Death=%Death%+1)
IF /I %HitPoints% LEQ 0 GOTO Lose
IF /I %mHitPoints% LEQ 0 GOTO Win
PAUSE>NUL
goto blank

:Lose
ECHO.
ECHO ===============================================
ECHO                  Battle Ending
ECHO ===============================================
ECHO.
ECHO     After a long strenus battle the Monster 
ECHO       picks you up and eats you, You Lose!
ECHO.
ECHO ===============================================
PAUSE>NUL
GOTO blank

:Win
ECHO.
ECHO ===============================================
ECHO                  Battle Ending
ECHO ===============================================
ECHO.
ECHO    You disentigrate the Monster with a giant 
ECHO         Space Laser, Victory is yours! 
ECHO.
ECHO ===============================================
PAUSE>NUL
GOTO blank

:SelectWeapon

ECHO.
ECHO ===============================================
ECHO                  Select Weapon
ECHO ===============================================
ECHO  1 = Defensive Stance           Gain 20 Energy
ECHO  2 = Fists                      Cost  1 Energy
ECHO  3 = SpiritBlade                Cost %SBecost% Energy
ECHO  4 = SpaceLaser                 Cost 40 Energy
ECHO ===============================================
SET INPUT=
SET /P INPUT=

IF /I '%INPUT%'=='1' GOTO  DefensiveStance
IF /I '%INPUT%'=='2' GOTO  Fists
IF /I '%INPUT%'=='3' GOTO  SpiritBlade
IF /I '%INPUT%'=='4' GOTO  SpaceLaser

PAUSE>NUL
GOTO start

:DefensiveStance
SET /A Weapon=%Weapon%+1
SET /A Armor=%Armor%+4
SET /A Energy=%Energy%+25
ECHO ===============================================
ECHO  Positioning your Stance and Montions more 
ECHO  defenivly allows you to build up some energy.
ECHO ===============================================  
ECHO  -%Energy% Energy       %Weapon% Damage         %Armor% Armor
ECHO ===============================================

REM IF /I %Kill% GEQ 10 (SET Armor=5)
REM IF /I %Kill% GEQ 10 (SET Weapon=2)
PAUSE>NUL
GOTO start

:Fists
IF /I %Energy% LSS 1 goto NeedMoreEnergy
SET /A FSD=%random% / 2500
SET /A Weapon=%Weapon%+(%R%/3100)+%FSD%
SET /A Armor=%Armor%+1
ECHO ===============================================
ECHO  Hand to hand combat is second nature to you, 
ECHO  granting some defensive ability. 
ECHO ===============================================  
ECHO  -%Energy% Energy       %FSD% Damage         %Armor% Armor
ECHO ===============================================

IF /I %FSD% LSS 7 SET /A Armor=%Armor%+1
IF /I %FSD% GTR 6 SET /A weapon=%weapon%+1 

REM IF /I %Kill% GEQ 10 (SET Weapon=%FSD%+2)
REM IF /I %Kill% GEQ 10 (SET Armor=2)
SET /A Energy=%Energy%-1
PAUSE>NUL
GOTO start

:SpiritBlade
IF /I %Energy% LSS %SBecost% goto NeedMoreEnergy
SET /A Weapon=%Weapon%+(%R%/1500)+(%SBecost%/3)

ECHO ===============================================
ECHO  The SpiritBlade is a wepaon only refered to
ECHO  in lore and myth. The harden meterials that 
ECHO  make it are said to be of magical origins.
ECHO ===============================================  
ECHO  -%SBecost% Energy       %Weapon% Damage         %Armor% Armor
ECHO ===============================================

SET /A SBecost=%SBecost%+1



::IF /I %Death% GEQ 10 ( SET /A Energy=%Energy%-25)
::IF /I %Kill% GEQ 10 ( SET /A mArmor=%mArmor%-1)
::IF /I %Kill% GEQ 10 ( SET /A Weapon=14)
SET /A Energy=%Energy%-%SBecost%
PAUSE>NUL

GOTO start

:SpaceLaser
IF /I %Energy% LSS 30 goto NeedMoreEnergy
SET /A Armor=0
SET /A Weapon=30
ECHO ===============================================
ECHO  They say good things come to those who win 
ECHO  alot of epic battles. In this case the good 
ECHO  thing is a giant space laser!
ECHO ===============================================  
ECHO  -40 Energy         ?? Damage          %Armor% Armor
ECHO ===============================================


SET /A Energy=%Energy%-40
PAUSE>NUL
GOTO start

:NeedMoreEnergy
cls
ECHO.
ECHO ===============================================
ECHO            You require more Energy!
ECHO ===============================================
PAUSE>NUL
CLS
GOTO Blank

:Blank
TITLE %STR% %DEX% %INT% HitPoints:%HitPoints% Stamina:%Stamina% Energy:%Energy% Kill/Death:%Kill%/%Death%
CLS
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO.
ECHO.
ECHO    pDEBUG: %H% : %R%/%D% : %damage% - %Weapon% - %Armor%
ECHO.
ECHO    mDEBUG: %mH% : %mR%/%mD% : %mdamage% - %mWeapon% - %mArmor%
ECHO.
ECHO.
ECHO  Wep:%Weapon%                    Arm:%Armor%
ECHO ===============================================
ECHO  Life:%HitPoints%             Energy:%Energy%
ECHO ===============================================
ECHO  Stamina:%Stamina%          %Kill%/%Death%
ECHO ===============================================
PAUSE 
GOTO SelectWeapon

REM :LevelUp
REM SET /A Level=%level%+1

REM SET /A STR=%STR%+1
REM SET /A DEX=%DEX%+1
REM SET /A INT=%INT%+1

REM SET /A HitPoints=%HitPoints%+2
REM SET /A Energy=%Energy%+2
REM SET /A Stamina=%Stamina%+2
REM :LevelUpEnd

:DISPLAY
TITLE %STR% %DEX% %INT% HitPoints:%HitPoints% Stamina:%Stamina% Energy:%Energy% Kill/Death:%Kill%/%Death%
CLS
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO.
ECHO.
ECHO    pDEBUG: %H% : %R%/%D% : %damage% - %Weapon% - %Armor%
ECHO.
ECHO    mDEBUG: %mH% : %mR%/%mD% : %mdamage% - %mWeapon% - %mArmor%
ECHO.
ECHO.
ECHO  Wep:%Weapon%                    Arm:%Armor%
ECHO ===============================================
ECHO  Life:%HitPoints%             Energy:%Energy%
ECHO ===============================================
ECHO  Stamina:%Stamina%          %Kill%/%Death%
ECHO ===============================================
PAUSE>NUL
goto START