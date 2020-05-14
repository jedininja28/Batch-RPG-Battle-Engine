ECHO OFF
SETLOCAL ENABLEEXTENSIONS

:RESTART
::SET AND RESET HP AND MHP 
set /a weapon=weapon
SET /A hp=100
SET /A mhp=300
SET /A enegry=100
SET /A menegry=100

SET /a defence=1
SET /a mdefence=1

SET /a Fists=5 
SET /a Hands=5

SET /a Weapon=%Fists%
SET /a mweapon=%Hands%

:Start
::TURN 1
::Header
CLS
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO.
ECHO.
ECHO.
::Battle Math
SET /A var2=%random%
SET /A mdam=1+%random%/2500+%mwepaon%-%defence%
IF /I %mdam% LEQ 0 set /a mdam=1 
IF /I %var2% LEQ 16384 ( ECHO              You dodge %mdam% damage! )

IF /I %var2% GEQ 16384 (

IF /I %mdam% LEQ 8 ( ECHO        The Monster attacks for %mdam% Damage! )

IF /I %mdam% GEQ 9 ( IF /I %menegry% GEQ 7 ( 
SET /A menegry=%menegry%-7
ECHO  The Monster trows you at a wall for %mdam% Damage! ) ELSE ( IF /I %menegry% GEQ 7 ( 
SET /A %mdam%=%mdam%/2
ECHO The Monster is tired and does %mdam% Damage! ) ) ) )

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
::Header
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO.
ECHO.
ECHO.
::Battle Math if set echo
SET /A var=%random%
SET /A dam= 1 + %var% / 1000 + ( %wepaon% - %mdefence% ) 
IF /I %dam% LEQ 0 set /a dam=1 

IF /I %var% LEQ 16384  ECHO         The Monster blocked %dam% Damage!

IF /I %var% GEQ 16384 (

IF /I %dam% LEQ 15 ( ECHO           You Attack for %dam% Damage! )

IF /I %dam% GEQ 16 ( IF /I %enegry% GEQ 7 ( 
SET /A enegry=%enegry%-7
ECHO    You land a masterful strike for %dam% Damage! ) Else ( 
SET /A dam= %dam% - %dam% && Echo                    You Miss! ) ) )

SET /A mhp= %mhp% - %dam% 
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
ECHO                  Battle Ending
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
ECHO                  Battle Ending
ECHO ===============================================
ECHO.
ECHO    You disentigrate the Monster with a giant 
ECHO         Space Laser, Victory is yours! 
ECHO.
ECHO ===============================================
ping localhost -n 2 >nul
PAUSE >NUL
GOTO RESTART

:Selectweapon
Set /a Weapon=weapon
echo.
ECHO ===============================================
ECHO                  Select Weapon
ECHO ===============================================
ECHO  1 = Block                           +4 Enegry
ECHO  1 = Fists                           -1 Enegry
ECHO  2 = SpiritBlade                    -12 Enegry
ECHO  3 = SpaceLaser                     -20 Enegry
ECHO ===============================================
SET INPUT=
SET /P INPUT= 

IF /I '%INPUT%'=='1' GOTO  Block
IF /I '%INPUT%'=='2' GOTO  Fists
IF /I '%INPUT%'=='3' GOTO  SpiritBlade
IF /I '%INPUT%'=='4' GOTO  SpaceLaser

PAUSE >NUL

:Block
SET /a Weapon=0
set enegry=%enegry%+4
Set defence=%denefce%+4
goto restar

:Fists
SET /a Weapon=%Fists%
SET /a Fists=2
set enegry=%enegry%-1
goto restart

:SpiritBlade
SET /a Weapon=%SpiritBlade%
SET /a SpiritBlade=12
set enegry=%enegry%-15
goto restart

:SpaceLaser
SET /a Weapon="%SpaceLaser%"
SET /a SpaceLaser=%dam% * 2 + 10
set enegry=%enegry%-31
goto restart

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