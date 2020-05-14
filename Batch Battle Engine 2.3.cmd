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
SET D=100 && SET RH=16383 && SET R=%Random% 

SET /A energy=100
SET /A weapon=1
SET /A armor=1

SET /A menergy=300
SET /A mweapon=1
SET /A marmor=1

SET /A death=0
SET /A kill=0
SET /A SBecost=10
:Debug
SET /A wd=%weapon%+%dam%

:RESTART
::SET AND RESET HP AND MHP 
SET /A weapon=%weapon%
SET /A armor=%armor%
SET /A energy=%energy%

SET /A mweapon=%mweapon%
SET /A marmor=%marmor%
SET /A menergy=%menergy%

::PLAYER
SET /A php=100
::MONSTER
SET /A mhp=300


:BattleCalculator
::TURN 1 PLAYER
(SET /A H=%R%/2) && (SET /A RV=%R%/%D%)
IF /I %R% LSS %RH% (SET B=0) ELSE (SET B=1)

SET /A dam=1 + %R% / 100 + ( %weapon% - %marmor% )

::ECHO %H% : %R%/%D% - %B%

::TURN 1 PLAYER
(SET /A H2=%R2%/2) && (SET /A RV2=%R2%/%D2%)
IF /I %R2% LSS %RH2% (SET B2=0) ELSE (SET B2=1)

SET /A dam2=1 + %R2% / 100 + ( %mweapon% - %armor% )

::ECHO %H2% : %R2%/%D2% - %B2%


::BATTLEMATH

SET /A hp=%hp%-%mdam%
IF %MHP% LEQ 0 (SET /A Kill=%Kill%+1) else IF %PHP% LEQ 0 (SET /A Death=%Death%+1)


