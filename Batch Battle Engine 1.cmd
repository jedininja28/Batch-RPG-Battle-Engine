ECHO OFF
SETLOCAL ENABLEEXTENSIONS
SET /A Weapon=0+%Weapon%
SET /A Armor=0+%Armor%
SET /A Item=0+%Item%
:RESTART
::SET AND RESET HP AND MHP 
SET /A hp=100
SET /A mhp=300
SET /A enegry=100
SET /A menegry=100



SET /a defence=1
SET /a mdefence=1
SET /a Fists=1
SET /a Hands=3
SET /A Weapon=%Fists%
SET /a Mweapon=%Hands%

:Start
::TURN 1
CLS
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO.
ECHO.
ECHO.
::Battle Math
SET /A var2=%random%
SET /A mdam=%random%/3500+(%mwepaon%-%defence%)

IF /I %var2% GEQ 16384 ( ECHO              You Dodge %mdam% Damage! )

IF /I %var2% LEQ 16384 (

IF /I %mdam% LEQ 15 ( ECHO        The Monster attacks for %mdam% Damage! )
IF /I %menegry% GEQ 7 (
IF /I %mdam% GEQ 16 (

SET /A menegry=%menegry%-7
ECHO    The Monster lands a critical blow for %mdam% Damage!! )))

SET /A hp=%hp%-%mdam%
IF %mhp% LEQ 0 (set /a Kill=%Kill%+1) else IF %hp% LEQ 0 (set /a Death=%Death%+1)

::Displays
TITLE Hitpoints:%hp% Enegry:%enegry% Kill/Death:%Kill%/%Death%
ECHO.
ECHO.
ECHO  %Weapon%                        Hand Washed Clothing
ECHO ===============================================
ECHO  Your Life:%hp%             Enegry:%Enegry%
ECHO ===============================================
ECHO  Monster Life:%mhp%         %Kill%/%Death%
ECHO ===============================================
IF /I %hp% LEQ 0 GOTO Lose
IF /I %mhp% LEQ 0 GOTO Win
PAUSE >NUL
CLS

::TURN 2
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO.
ECHO.
ECHO.
::Battle Math
SET /A var=%random%
SET /A dam=%var%/1000+(%wepaon%-%mdefence%)

IF /I %var% LEQ 16384 ( ECHO         The Monster blocked %dam% Damage! )

IF /I %var% GEQ 16384 (

IF /I %dam% LEQ 15 ( ECHO           You Attack for %dam% Damage! )

IF /I %dam% GEQ 16 ( IF /I %enegry% GEQ 7 ( 
SET /A enegry=%enegry%-7
ECHO    You land a masterful strike for %dam% Damage! ) Else ( 
SET /A dam=%dam%-%dam% && Echo                    You Miss! ) ) )

SET /A mhp=%mhp%-%dam% 
IF %mhp% LEQ 0 (set /a Kill=%Kill%+1) else IF %hp% LEQ 0 (set /a Death=%Death%+1)

::Displays
TITLE Hitpoints:%hp% Enegry:%enegry% Kill/Death:%Kill%/%Death%
ECHO.
ECHO.
ECHO  %Weapon%                        Hand Washed Clothing
ECHO ===============================================
ECHO  Your Life:%hp%             Enegry:%Enegry%
ECHO ===============================================
ECHO  Monster Life:%mhp%         %Kill%/%Death%
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
ECHO     After a long strenus battle the Monster 
ECHO       picks you up and eats you, You Lose!
ECHO.
ECHO ===============================================
ping localhost -n 2 >nul
PAUSE >NUL
GOTO RESTART

:Win
ECHO.
ECHO ===============================================
ECHO.
ECHO    You disentigrate the Monster with a giant 
ECHO         Space Laser, Victory is yours! 
ECHO.
ECHO ===============================================
ping localhost -n 2 >nul
PAUSE >NUL
GOTO RESTART

::TODO

::Add Enegry/Miss

::Incorperate wepons/armor and displays
::WEAPONS
SET /a Fists =1
SET /a Stick =2
SET /a Knife =4

::ARMORS
SET /A "Hand Washed clothing"=%Mdam%-1
SET /A "Kevlar clothing"=%Mdam%-4

::Add Items