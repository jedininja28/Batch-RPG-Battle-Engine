ECHO OFF
::SETLOCAL ENABLEEXTENSION

::NOTES
::damage is being lost someplace
::damage on SpaeLaser hits on blocks and misses
::renewing and aranging menus without cls command
::split battle calculations into Monster and player to reduce menu line use.
::Import/export from file
::type messages from file
::invintory

::TODO
::Add energy/Miss
::Incorperate wepons/armor and displays
::Add Items
::draw lines out of = signs
::method of graphics that requires less loading and lines space

:GameSetup
SET /A energy=100
SET /A weapon=1
SET /A armor=1
SET /A Death=0
SET /A Kill=0
SET /A SBecost=10
:Debug
SET /A wd=%weapon%+%dam%

:RESTART
::SET AND RESET HP AND MHP 
SET /A weapon=%weapon%
SET /A armor=%armor%
SET /A energy=%energy%

SET /A hp=100
SET /A mhp=300
SET /A menergy=100

SET /A mdefence=1
SET /A hands=1
SET /A mweapon=%Hands%
Goto Blank

:Start
::TURN 1
::Header
CLS
SET /A wd=%weapon%+%dam%
ECHO DEBUG Player: var:%var% dam:%dam% wep:%weapon% Dam+Wep:%wd% arm:%armor% 
ECHO DEBUG Monster: var2:%var2% mdam:%mdam%
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

IF /I %mdam% GEQ 9 ( IF /I %menergy% GEQ 7 ( 
SET /A menergy=%menergy%-7
ECHO  The Monster trows you at a wall for %mdam% Damage! ) ELSE ( IF /I %menergy% GEQ 7 (
SET /A %mdam%=%mdam%/2 && ECHO The Monster is tired and does %mdam% Damage! ) ) ) )

SET /A hp=%hp%-%mdam%
IF %mhp% LEQ 0 (SET /A Kill=%Kill%+1) else IF %hp% LEQ 0 (SET /A Death=%Death%+1)

::Displays
TITLE Hitpoints:%hp% Energy:%energy% Kill/Death:%Kill%/%Death%
ECHO.
ECHO.
ECHO  Wep:%weapon%                    Arm:%armor%
ECHO ===============================================
ECHO  Your Life:%hp%             energy:%energy%
ECHO ===============================================
ECHO  Monster Life:%mhp%         %Kill%/%Death%
ECHO ===============================================
IF /I %hp% LEQ 0 GOTO Lose
IF /I %mhp% LEQ 0 GOTO Win
PAUSE>NUL
CLS

::TURN 2
::Header
SET /A wd=%weapon%+%dam%
ECHO DEBUG Player: var:%var% dam:%dam% wep:%weapon% Dam+Wep:%wd% arm:%armor% 
ECHO DEBUG Monster: var2:%var2% mdam:%mdam%
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO.
ECHO.
ECHO.
::Battle Math if set echo
SET /A var=%random%
SET /A dam=%var%/1000+%weapon%-%mdefence% 
IF /I %dam% LEQ 0 SET /A dam=1 

IF /I %var% LEQ 16384  ECHO         The Monster blocked %dam% Damage!

IF /I %var% GEQ 16384 ( IF /I %dam% LEQ 19 ( ECHO           You Attack for %dam% Damage! )

IF /I %dam% GEQ 20 ( IF /I %energy% GEQ 7 ( SET /A energy=%energy%-7
ECHO    You land a masterful strike for %dam% Damage! ) Else (
SET /A dam=%dam%/2 && Echo                    You Miss! ) ) )

SET /A mhp= %mhp% - %dam% 
IF %mhp% LEQ 0 (SET /A Kill=%Kill%+1) else IF %hp% LEQ 0 (SET /A Death=%Death%+1)

::Displays
TITLE Hitpoints:%hp% Energy:%energy% Kill/Death:%Kill%/%Death%
ECHO.
ECHO.
ECHO  Wep:%weapon%                    Arm:%armor%
ECHO ===============================================
ECHO  Your Life:%hp%             energy:%energy%
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
GOTO blank

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
GOTO blank

:Selectweapon
SET /A weapon=1
SET /A armor=1

ECHO.
ECHO ===============================================
ECHO                  Select Weapon
ECHO ===============================================
ECHO  1 = Defensive Stance           Gain 20 energy
ECHO  2 = Fists                      Cost  1 energy
ECHO  3 = SpiritBlade                Cost %SBecost% energy
ECHO  4 = SpaceLaser                 Cost 40 energy
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
SET /A weapon=1
SET /A armor=4
SET /A energy=%energy%+25

IF /I %Kill% GEQ 10 (SET /A armor=5)
IF /I %Kill% GEQ 10 (SET /A weapon=2)
PAUSE>NUL
GOTO start

:Fists
IF /I %energy% LSS 1 goto NeedMoreenergy
SET /A weapon=%FSD%
SET /A armor=1
ECHO ===============================================
ECHO  Hand to hand combat is second nature to you, 
ECHO  granting some defensive ability. 
ECHO ===============================================  
ECHO  -%enegry% Energy       %FSD% Damage         %armor% Armor
ECHO ===============================================
:: (X=%R%/2500) = 1-13 Damage
SET /A FSD=%random% / 2500

IF /I %FSD% LSS 7 SET /A mdefence=%mdefence%-1
IF /I %FSD% GTR 6 SET /A energy=%energy%-1 

IF /I %Kill% GEQ 10 (SET /A weapon=%FSD%+2)
IF /I %Kill% GEQ 10 (SET /A armor=2)

PAUSE>NUL
GOTO start

:SpiritBlade
IF /I %energy% LSS %SBecost% goto NeedMoreenergy
SET /A weapon=10+%SBecost%/3
SET /A armor=0

ECHO ===============================================
ECHO  The SpiritBlade is a wepaon only refered to
ECHO  in lore and myth. The harden meterials that 
ECHO  make it are said to be of magical origins.
ECHO ===============================================  
ECHO  -%SBecost% Energy       %weapon% Damage         %armor% Armor
ECHO ===============================================

SET /A energy=%energy%-%SBecost%
SET /A SBecost=%SBecost%+1

IF /I %Death% GEQ 10 (SET /A energy=%energy%-25)
IF /I %Kill% GEQ 10 (SET /A armor=1)
IF /I %Kill% GEQ 10 (SET /A weapon=14)

PAUSE>NUL

GOTO start

:SpaceLaser
IF /I %energy% LSS 30 goto NeedMoreenergy
SET /A armor=0
ECHO ===============================================
ECHO  They say good things come to those who win 
ECHO  alot of epic battles. In this case the good 
ECHO  thing is a giant space laser!
ECHO ===============================================  
ECHO  -40 energy         ?? Damage          %armor% Armor
ECHO ===============================================
SET /A weapon=%dam%+%dam%+%dam%
IF /I %weapon% LSS 30 SET /A %weapon%==30


SET /A energy=%energy%-40
PAUSE>NUL
GOTO start

:NeedMoreenergy
cls
ECHO.
ECHO ===============================================
ECHO            You require more energy!
ECHO ===============================================
PAUSE>NUL
CLS
GOTO Blank

:blank
cls
TITLE Hitpoints:%hp% energy:%energy% Kill/Death:%Kill%/%Death%
ECHO DEBUG Player: var:%var% dam:%dam% wep:%weapon% Dam+Wep:%wd% arm:%armor% 
ECHO DEBUG Monster: var2:%var2% mdam:%mdam%
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO  Wep:%weapon%                    Arm:%armor%
ECHO ===============================================
ECHO  Your Life:%hp%             energy:%energy%
ECHO ===============================================
ECHO  Monster Life:%mhp%         %Kill%/%Death%
ECHO ===============================================

GOTO Selectweapon