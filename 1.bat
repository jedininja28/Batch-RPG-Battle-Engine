ECHO OFF
SETLOCAL ENABLEEXTENSIONS
:RESTART
::SET AND RESET HP AND mhp
SET /A hp=100
SET /A mhp=300

::WEAPONS
SET /a Fists=%random%/5000+1
SET /a Stick =%dam%+3
SET /a Knife =%dam%+4

::ARMORS
SET /A "Hand Washed clothing"=%Mdam%-1
SET /A "Kevlar clothing"=%Mdam%-4

:Start
::TURN 1
CLS
TITLE HP:%hp% MHP:%mhp% Win:%Win% lose:%mWin%
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO.
ECHO.

SET /A var2=%random%
SET /A mdam=%random%/2500

IF /I %var2% LEQ 16384 (

IF /I %mdam% LEQ 15 echo        The Monster attacks for %mdam% Damage!
IF /I %mdam% GEQ 16 ECHO The Monster lands a critical blow for %mdam% Damage!

SET /A hp=%hp%-%mdam% && (
IF /I %hp% LEQ 0 set /a mWin=%mWin%+1
IF /I %mhp% LEQ 0 set /a Win=%Win%+1 )
)


IF /I %var2% GEQ 16384 ( 
ECHO             You Dodge %mdam% Damage! )

ECHO.
ECHO  Fists                    Hand Washed Clothing
ECHO ===============================================
ECHO  Your Life:%hp%           Player Wins:%Win%
ECHO ===============================================
ECHO  Monster Life:%mhp%       Monster Wins:%mWin%
ECHO ===============================================
IF /I %hp% LEQ 0 GOTO Lose
IF /I %mhp% LEQ 0 GOTO Win
PAUSE >NUL
CLS

::TURN 2
TITLE HP:%hp% MHP:%mhp% Win:%Win% lose:%mWin%
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO.
ECHO.
SET /A var=%random%
SET /A dam=%random%/1000+40

IF /I %var% GEQ 16384 (

IF /I %dam% LEQ 15 ECHO           You Attack for %dam% Damage!
IF /I %dam% GEQ 16 ECHO   You land a Magical Strike for %dam% Damage!

SET /A mhp=%mhp%-%dam% && (
IF /I %hp% LEQ 0 set /a mWin=%mWin%+1
IF /I %mhp% LEQ 0 set /a Win=%Win%+1 )

)

IF /I %var% LEQ 16384 ECHO       The Monster blocked %dam% Damage!

ECHO.
ECHO  Fists                    Hand Washed Clothing
ECHO ===============================================
ECHO  Your Life:%hp%           Player Wins:%Win%
ECHO ===============================================
ECHO  Monster Life:%mhp%       Monster Wins:%mWin%
ECHO ===============================================
IF /I %hp% LEQ 0 GOTO Lose
IF /I %mhp% LEQ 0 GOTO Win
PAUSE >NUL
GOTO start

::BATTLE OUTCOME
:Lose
ECHO.
ECHO ===============================================
ECHO.
ECHO      After a short fight the Monster picks
ECHO         you up and eats you, You Lose!
ECHO.
ECHO ===============================================
ping localhost -n 2 >nul
PAUSE >NUL
GOTO RESTART

:Win
ECHO.
ECHO ===============================================
ECHO.
ECHO    You disentigrate the monster with a giant 
ECHO         Space Laser, Victory is yours! 
ECHO.
ECHO ===============================================
ping localhost -n 2 >nul
PAUSE >NUL
GOTO RESTART
