@ECHO OFF
::SETLOCAL ENABLEEXTENSIONS
::SETLOCAL ENABLEDELAYEDEXPANSION
::SETLOCAL DISABLEEXTENSIONS
::SETLOCAL DISABLEDELAYEDEXPANSION

::NOTES
::Monster display stats
::LEVEL and EXPERIENCE
::Import Monster, Weapons and Battle Messages from seperate file
::MAKE ITEMS / ARMOR
::MAKE STORE / INVINTORY

:RESTART

SET STR=8
SET DEX=8
SET INT=8

SET /A HitPoints=100+(%STR%/4)
SET /A Energy=100+(%INT%/3)
SET /A Stamina=100+(%DEX%/2)

SET Armor=1
SET Weapon=1

SET mSTR=12
SET mDEX=8
SET mINT=10

SET /A mHitPoints=100+(%mSTR%/4)
SET /A mEnergy=100+(%mINT%/3)
SET /A mStamina=100+(%mDEX%/2)

SET mArmor=1
SET mWeapon=1

SET Kill=0
SET Death=0
SET KDR=0

SET SBecost=10

SET Level=1
SET Experience=0

REM SET /I AttackHigh=0

REM SET /I AttackLow=0
REM SET /I BlockHigh=0
REM SET /I BlockLow=0
REM SET /I MissHigh=0
REM SET /I MissLow=0
REM SET /I SpcialHigh=0
REM SET /I SpcialLow=0

REM SET /I mAttackHigh=0
REM SET /I mAttackLow=0
REM SET /I mBlockHigh=0
REM SET /I mBlockLow=0
REM SET /I mMissHigh=0
REM SET /I mMissLow=0
REM SET /I mSpcialHigh=0
REM SET /I mSpcialLow=0

GOTO Blank

:START
@ECHO OFF
SET /A Weapon=%Weapon%
SET /A Armor=%Armor%
SET /A Energy=%Energy%

SET /A mWeapon=%mWeapon%
SET /A mArmor=%mArmor%
SET /A mEnergy=%mEnergy%

SET /A Energy=%mEnergy%

:TURN 1

:Roll
SET D=100
SET RH=163
SET R=%Random% 
SET /A H=%R%/2
SET /A RH=%R%/%D%

SET /A damage=1 + (%STR%/4) + (%Weapon%-%mArmor%)
SET /A mHitPoints=%mHitPoints%-%damage%

TITLE STR:%STR% DEX:%DEX% INT:%INT% HitPoints:%HitPoints% Stamina:%Stamina% Energy:%Energy% Kill/Death:%Kill%/%Death% KDR:%KDR%
CLS
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO  Monster Life:%mHitPoints%           Monster Energy:%mEnergy%
ECHO ===============================================
echo  turn 1
ECHO ===============================================
ECHO  Kills:%Kill%/%Death% %KDR% Armor:%Armor% Weapon:%Weapon%
ECHO ===============================================
ECHO  STR:%STR%     Life:%HitPoints%   Level:%Level%    
ECHO  DEX:%DEX%   Energy:%Energy%    Experience:%Experience%
ECHO  INT:%INT%  Stamina:%Stamina%     
ECHO ===============================================    
IF /I %mHitPoints% LEQ 0 GOTO Win && IF /I %HitPoints% LEQ 0 GOTO Lose
IF /I %mHitPoints% LEQ 0 GOTO Win && IF /I %HitPoints% LEQ 0 GOTO Lose
PAUSE>NUL
GOTO TURN2

:TURN2
::Load Monster

:mRoll
SET mD=100
SET mRH=163
SET mR=%Random%
SET /A mH=%mR%/2
SET /A mRH=%mR%/%mD%

SET mArmor=1

SET /A mWeapon=%mWeapon%+(%mR%/3500)
SET /A mdamage=1 + (%mSTR%/4) + (%mWeapon%-%Armor%)
SET /A HitPoints=%HitPoints%-%mdamage%

TITLE STR:%STR% DEX:%DEX% INT:%INT% HitPoints:%HitPoints% Stamina:%Stamina% Energy:%Energy% Kill/Death:%Kill%/%Death%
CLS
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO  Monster Life:%mHitPoints%           Monster Energy:%mEnergy%
ECHO ===============================================
ECHO TURN 2
ECHO ===============================================
ECHO  Kills:%Kill%/%Death% %KDR% Armor:%Armor% Weapon:%Weapon%
ECHO ===============================================
ECHO  STR:%STR%     Life:%HitPoints%   Level:%Level%    
ECHO  DEX:%DEX%   Energy:%Energy%    Experience:%Experience%
ECHO  INT:%INT%  Stamina:%Stamina%     
ECHO ===============================================     
IF /I %mHitPoints% LEQ 0 GOTO Win && IF /I %HitPoints% LEQ 0 GOTO Lose                     
IF /I %HitPoints% LEQ 0 GOTO Lose && IF /I %mHitPoints% LEQ 0 GOTO Win

PAUSE>NUL
GOTO SelectWeapon

:Lose
ECHO ===============================================
ECHO                  Battle Ending
ECHO ===============================================
ECHO     After a long strenus battle the Monster 
ECHO       picks you up and eats you, You Lose!
ECHO ===============================================
PAUSE>NUL
CLS
GOTO BattleEnd

:Win
SET /A Experience=%Experience%+(%random%/650)
ECHO ===============================================
ECHO                  Battle Ending
ECHO ===============================================
ECHO    You disentigrate the Monster with a giant 
ECHO         Space Laser, Victory is yours! 
ECHO ===============================================
PAUSE>NUL
CLS
GOTO BattleEnd

:BattleEnd

IF %mHitPoints% LEQ 0 (SET /A Kill=%Kill%+1) else IF %HitPoints% LEQ 0 (SET /A Death=%Death%+1)
SET /A KDR=%Kill%/%Death%*100

SET /A HitPoints=100+(%STR%/4)
SET /A Energy=100+(%INT%/3)
SET /A Stamina=100+(%DEX%/2)

SET /A mHitPoints=100+(%mSTR%/4)
SET /A mEnergy=100+(%mINT%/3)
SET /A mStamina=100+(%mDEX%/2)

SET SBecost=10

:LevelUp
GOTO LevelUpEnd
IF /I Experience=100
SET /A Level=%level%+1

SET /A STR=%STR%+1
SET /A DEX=%DEX%+1
SET /A INT=%INT%+1

SET /A HitPoints=%HitPoints%+2
SET /A Energy=%Energy%+2
SET /A Stamina=%Stamina%+2
:LevelUpEnd
GOTO SelectWeapon

:SelectWeapon
SET /A Weapon=1
SET /A Armor=1
TITLE STR:%STR% DEX:%DEX% INT:%INT% HitPoints:%HitPoints% Stamina:%Stamina% Energy:%Energy% Kill/Death:%Kill%/%Death% KDR:%KDR%

ECHO ===============================================
ECHO                  Select Weapon
ECHO ===============================================
ECHO  1 = Defensive Stance           Gain 20 Energy
ECHO  2 = Fists                      Cost  1 Energy
ECHO  3 = SpiritBlade                Cost %SBecost% Energy
ECHO  4 = SpaceLaser                 Cost 60 Energy
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
IF /I %Energy% LSS 85 (ECHO Too much Enegry!) && goto start 
SET /A Weapon=%Weapon%+2
SET /A Armor=%Armor%+5
	
ECHO ===============================================
ECHO  Positioning your Stance and Montions more 
ECHO  defensivly allows you to build up some energy.
ECHO ===============================================  
ECHO  +20 Energy       %Weapon% Damage         %Armor% Armor
ECHO ===============================================
SET /A Energy=%Energy%+20

PAUSE>NUL
GOTO start

:Fists
IF /I %Energy% LSS 1 GOTO NeedMoreEnergy
SET /A Weapon=%Weapon%+(%R%/3100)
SET /A Armor=%Armor%+1
ECHO ===============================================
ECHO  Hand to hand combat is second nature to you, 
ECHO  granting some defensive ability. 
ECHO ===============================================  
ECHO  -1 Energy       %Weapon% Damage         %Armor% Armor
ECHO ===============================================

SET /A Energy=%Energy%-1
PAUSE>NUL
GOTO start

:SpiritBlade
IF /I %Energy% LSS %SBecost% GOTO NeedMoreEnergy
SET /A Weapon=%Weapon%+(%R%/2000)+(%SBecost%/3)

ECHO ===============================================
ECHO  The SpiritBlade is a wepaon only refered to
ECHO  in lore and myth. The harden meterials that 
ECHO  make it are said to be of magical origins.
ECHO ===============================================  
ECHO  -%SBecost% Energy       %Weapon% Damage         %Armor% Armor
ECHO ===============================================
SET /A SBecost=%SBecost%+2
SET /A Energy=%Energy%-%SBecost%

IF /I %mEnergy% GTR 60 SET /A mEnergy=%mEnergy%-2
IF /I %Kill% GEQ 10 SET /A Weapon=%Weapon%+4
IF /I %Kill% GEQ 10 SET Armor=1
IF /I %Death% GEQ 10 SET /A SBecost=%SBecost%+1

PAUSE>NUL
CLS
GOTO start

:SpaceLaser
IF /I %Energy% LSS 60 GOTO NeedMoreEnergy
SET /A Armor=0
SET /A Weapon=30+(%R%/600)+(%R%/650)+(%R%/700)
ECHO ===============================================
ECHO  They say good things come to those who win
ECHO  alot of epic battles. In this case the good
ECHO  thing is a giant space laser!
ECHO ===============================================  
ECHO  -60 Energy         %Weapon% Damage          %Armor% Armor
ECHO ===============================================

SET /A Energy=%Energy%-60
PAUSE>NUL
GOTO start

:NeedMoreEnergy
CLS
ECHO ===============================================
ECHO            You require more Energy!
ECHO ===============================================
PAUSE>NUL
CLS
GOTO SelectWeapon

:DISPLAY
TITLE %STR% %DEX% %INT% HitPoints:%HitPoints% Stamina:%Stamina% Energy:%Energy% Kill/Death:%Kill%/%Death% KDR:%KDR%
CLS
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO  Monster Name: Monster Life:%mHitPoints%           Monster Energy:%mEnergy%
ECHO ===============================================
ECHO    pDEBUG:  %H% : %R%/%D% : %damage% - %Weapon% - %Armor%
ECHO    mDEBUG: %mH% : %mR%/%mD% : %mdamage% - %mWeapon% - %mArmor%
ECHO ===============================================
ECHO   Kills:%Kill%/%Death% %KDR%
ECHO  Energy:%Energy%    Armor:%Armor%    Experience:  
ECHO ===============================================   
PAUSE>NUL
GOTO START
