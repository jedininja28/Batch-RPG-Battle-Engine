ECHO OFF
::SETLOCAL ENABLEEXTENSIONS

:GameSetup
SET /A enegry=100
SET /A weapon=1
SET /A armor=1
SET /A Death=0
SET /A Kill=0

:RESTART
::SET AND RESET HP AND MHP 
SET /A weapon=%weapon%
SET /A armor=%armor%
SET /A enegry=%enegry%
SET /A hp=100
SET /A mhp=300
SET /A menegry=100

SET /A mdefence=1
SET /A hands=1
SET /A mweapon=%Hands%

:Start
::TURN 1
::Header
CLS
echo DEBUG: P: var:%var% dam:%dam% wep:%weapon% arm:%armor% M: var2:%var2% mdam:%mdam%
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO.
ECHO.
ECHO.
::Battle Math
SET /A var2=%random%
SET /A mdam=1 + %random% / 2500 + ( %mweapon% - %armor% )
IF /I %mdam% LEQ 0 SET /A mdam=1 

IF /I %var2% LEQ 16384 ( ECHO              You dodge %mdam% damage! )

IF /I %var2% GEQ 16384 (

IF /I %mdam% LEQ 8 ( ECHO        The Monster attacks for %mdam% Damage! )

IF /I %mdam% GEQ 9 ( IF /I %menegry% GEQ 7 ( 
SET /A menegry=%menegry%-7
ECHO  The Monster trows you at a wall for %mdam% Damage! ) ELSE ( IF /I %menegry% GEQ 7 (
SET /A %mdam%=%mdam%/2 && ECHO The Monster is tired and does %mdam% Damage! ) ) ) )

SET /A hp=%hp%-%mdam%
IF %mhp% LEQ 0 (SET /A Kill=%Kill%+1) else IF %hp% LEQ 0 (SET /A Death=%Death%+1)

::Displays
TITLE Hitpoints:%hp% Enegry:%enegry% Kill/Death:%Kill%/%Death%
ECHO.
ECHO.
ECHO  Wep:%weapon%                    Arm:%armor%
ECHO ===============================================
ECHO  Your Life:%hp%             Enegry:%enegry%
ECHO ===============================================
ECHO  Monster Life:%mhp%         %Kill%/%Death%
ECHO ===============================================
IF /I %hp% LEQ 0 GOTO Lose
IF /I %mhp% LEQ 0 GOTO Win
PAUSE>NUL
CLS

::TURN 2
::Header
echo DEBUG: Player: var:%var% dam:%dam% wep:%weapon% arm:%armor% Monster: var2:%var2% mdam:%mdam%
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO.
ECHO.
ECHO.
::Battle Math if set echo
SET /A var=%random%
SET /A dam= %var% / 1000 + %weapon% - %mdefence% 
IF /I %dam% LEQ 0 SET /A dam=1 

IF /I %var% LEQ 16384  ECHO         The Monster blocked %dam% Damage!

IF /I %var% GEQ 16384 ( IF /I %dam% LEQ 19 ( ECHO           You Attack for %dam% Damage! )

IF /I %dam% GEQ 20 ( IF /I %enegry% GEQ 7 ( SET /A enegry=%enegry%-7
ECHO    You land a masterful strike for %dam% Damage! ) Else (
SET /A dam= %dam% - %dam% && Echo                    You Miss! ) ) )

SET /A mhp= %mhp% - %dam% 
IF %mhp% LEQ 0 (SET /A Kill=%Kill%+1) else IF %hp% LEQ 0 (SET /A Death=%Death%+1)

::Displays
TITLE Hitpoints:%hp% Enegry:%enegry% Kill/Death:%Kill%/%Death%
ECHO.
ECHO.
ECHO  Wep:%weapon%                    Arm:%armor%
ECHO ===============================================
ECHO  Your Life:%hp%             Enegry:%enegry%
ECHO ===============================================
ECHO  Monster Life:%mhp%         %Kill%/%Death%
ECHO ===============================================
IF /I %hp% LEQ 0 GOTO Lose
IF /I %mhp% LEQ 0 GOTO Win
PAUSE>NUL
GOTO Selectweapon

::BATTLE OUTCOME
:Lose
SET /A hp=100
SET /A mhp=300
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
GOTO Selectweapon

:Win
SET /A hp=100
SET /A mhp=300
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
GOTO Selectweapon

:Selectweapon
SET /A weapon=0
SET /A armor=0

ECHO.
ECHO ===============================================
ECHO                  Select Weapon
ECHO ===============================================
ECHO  1 = Defensive Stance           Gain 20 Enegry
ECHO  2 = Fists                      Cost  1 Enegry
ECHO  3 = SpiritBlade                Cost 15 Enegry
ECHO  4 = SpaceLaser                 Cost 30 Enegry
ECHO ===============================================
SET INPUT=
SET /P INPUT=

IF /I '%INPUT%'=='1' GOTO  DefensiveStance
IF /I '%INPUT%'=='2' GOTO  Fists
IF /I '%INPUT%'=='3' GOTO  SpiritBlade
IF /I '%INPUT%'=='4' GOTO  SpaceLaser

:DefensiveStance
SET /A weapon=1
SET /A armor=4
SET /A enegry=%enegry%+20

IF /I %Kill% GEQ 10 (SET /A armor=5)
IF /I %Kill% GEQ 10 (SET /A weapon=2)
PAUSE>NUL
GOTO start

:Fists
IF /I %enegry% LEQ 1 goto NeedMoreEnegry
ECHO ===============================================
ECHO  Hand to hand combat is second nature to you, 
ECHO  granting some defensive ability. 
ECHO ===============================================  
ECHO  -1 Enegry         4-5 Damage          1 Armor
ECHO ===============================================
SET /A weapon=4
SET /A armor=1
SET /A enegry=%enegry%-1
IF /I %Kill% GEQ 10 (SET /A armor=2)
IF /I %Kill% GEQ 10 (SET /A weapon=5)
PAUSE>NUL
GOTO start

:SpiritBlade
IF /I %enegry% LEQ 15 goto NeedMoreEnegry
ECHO ===============================================
ECHO  The SpiritBlade is a wepaon only refered to
ECHO  in lore and myth. The harden meterials that 
ECHO  make it are said to be of magical origins.
ECHO ===============================================  
ECHO  -15 Enegry       10-14 Damage         1 Armor
ECHO ===============================================
SET /A weapon=10
SET /A armor=0
SET /A enegry=%enegry%-15
IF /I %Death% GEQ 10 (SET /A enegry=%enegry%-25)
IF /I %Kill% GEQ 10 (SET /A armor=1)
IF /I %Kill% GEQ 10 (SET /A weapon=14)
PAUSE>NUL
GOTO start

:SpaceLaser
IF /I %enegry% LEQ 30 goto NeedMoreEnegry
ECHO ===============================================
ECHO  They say good things come to those who win 
ECHO  alot of epic battles. In this case the good 
ECHO  thing is a giant space laser!
ECHO ===============================================  
ECHO  -30 Enegry         ?? Damage          0 Armor
ECHO ===============================================
SET /A weapon=40+%var%/1000
SET /A armor=0
SET /A enegry=%enegry%-30
PAUSE>NUL
GOTO start

:NeedMoreEnegry
ECHO.
ECHO ===============================================
ECHO            You require more Enegry!
ECHO ===============================================
PAUSE>NUL
cls
GOTO Selectweapon
::TODO
::Add enegry/Miss
::Incorperate wepons/armor and displays
::Add Items