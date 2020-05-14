@ECHO OFF
::NOTES
::Monster display stats
::Import Monster, Attacks and Battle Messages from seperate file
::MAKE ITEMS / ARMOR
::MAKE STORE / INVINTORY

:RESTART
SET STR=8
SET DEX=8
SET INT=8
SET /A HitPoints=100+(%STR%/4)
SET /A Energy=100+(%INT%/3)
SET /A Stamina=100+(%DEX%/2)
SET Defence=1
SET Attack=1

SET mSTR=12
SET mDEX=10
SET mINT=10
SET /A mHitPoints=100+(%mSTR%/4)
SET /A mEnergy=100+(%mINT%/3)
SET /A mStamina=100+(%mDEX%/2)
SET mDefence=1
SET mAttack=1

SET HitChance=1
SET DefenceChance=1
SET mHitChance=1
SET mDefenceChance=1


SET Kill=0
SET Death=0
SET KDR=0
SET SBecost=10
SET Level=1
SET Experience=0

SET /A LevelModifyer=(%STR%+%DEX%+%INT%)*4+(%level%*1000)

:START
SET /A Dice=(%Random%/5461)
SET /A Dice2=(%Random%/5461)
SET /A HitChance=%DEX%*%Dice%+%Stamina%
SET /A DefenceChance=%DEX%*%Dice2%+%Stamina%

SET /A mDice=(%Random%/5461)
SET /A mDice2=(%Random%/5461)
SET /A mHitChance=%DEX%*%mDice%+%mStamina%
SET /A mDefenceChance=%DEX%*%mDice2%+%mStamina%

SET /A Attack=%Attack%
SET /A Defence=%Defence%
SET /A Energy=%Energy%

SET /A mAttack=%mAttack%
SET /A mDefence=%mDefence%
SET /A mEnergy=%mEnergy%

SET /A Experience=%Experience%
SET /A LevelModifyer=%LevelModifyer%
SET /A Level=%Level%

:TURN 1

:mRoll
SET mD=100
SET mRH=163
SET mR=%Random%
SET /A mH=%mR%/2
SET /A mRH=%mR%/%mD%
SET /A mDice=%Random%/5461
SET /A mHitChance=%mDEX%*%mDice%+%mStamina%-10
SET /A mDefenceChance=%mDEX%*%mDice%+%mStamina%-10

SET /A mAttack=%mAttack%+(%mR%/4500)
SET /A mdamage=1 + (%mSTR%/4) + (%mAttack%-%Defence%)
IF /I %mHitChance% GTR %DefenceChance% SET /A HitPoints=%HitPoints%-%mDamage%

TITLE STR:%STR% DEX:%DEX% INT:%INT% HitPoints:%HitPoints% Stamina:%Stamina% Energy:%Energy% Kill/Death:%Kill%/%Death%
CLS
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO  Monster Life:%mHitPoints%           Monster Energy:%mEnergy%
ECHO ===============================================
ECHO                  MONSTER TURN!
REM If /I %mDamage% LEQ 20 ( ECHO The Moneter attacks for %mDamage%! ) Else ( ECHO      The Monster hits hard for %mDamage%!)
ECHO ===============================================  
ECHO  STR:%STR%       Life:%HitPoints%    Level:%Level%          
ECHO  DEX:%DEX%     Energy:%Energy%    Experience:%Experience%       
ECHO  INT:%INT%    Stamina:%Stamina%    Next Level:%LevelModifyer%
ECHO =============================================== 
ECHO      HitChance:%HitChance%   Attack:%Attack%   Kills:%Kill%/%Death% %KDR%    
ECHO  DefenceChance:%DefenceChance%   Defence:%Defence% 
ECHO ===============================================   
IF /I %mHitPoints% LEQ 0 GOTO Win
IF /I %HitPoints% LEQ 0 GOTO Lose                 
PAUSE>NUL
GOTO TURN2

:TURN2
::Load Monster

:Roll
SET D=100
SET RH=163
SET R=%Random% 
SET /A H=%R%/2
SET /A RH=%R%/%D%

SET /A damage=1 + (%Attack%-%mDefence%)
IF /I %HitChance% GTR %mDefenceChance% SET /A mHitPoints=%mHitPoints%-%damage% 
REM IF /I %mDefenceChance% GTR %HitChance% ( SET /A 

TITLE STR:%STR% DEX:%DEX% INT:%INT% HitPoints:%HitPoints% Stamina:%Stamina% Energy:%Energy% Kill/Death:%Kill%/%Death% KDR:%KDR%
CLS
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO  Monster Life:%mHitPoints%           Monster Energy:%mEnergy%
ECHO ===============================================
ECHO                   PLAYER TURN!
REM IF /I %mDamage% LEQ 20 ( ECHO The Moneter attacks for %mDamage%! ) Else ( ECHO      The Monster hits hard for %mDamage%!)
ECHO ===============================================  
ECHO  STR:%STR%       Life:%HitPoints%    Level:%Level%          
ECHO  DEX:%DEX%     Energy:%Energy%    Experience:%Experience%       
ECHO  INT:%INT%    Stamina:%Stamina%    Next Level:%LevelModifyer%
ECHO =============================================== 
ECHO      HitChance:%HitChance%   Attack:%Attack%   Kills:%Kill%/%Death% %KDR%    
ECHO  DefenceChance:%DefenceChance%   Defence:%Defence% 
ECHO ===============================================   
IF /I %mHitPoints% LEQ 0 GOTO Win
IF /I %HitPoints% LEQ 0 GOTO Lose
PAUSE>NUL
GOTO SelectAttack

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
SET /A Experience=%Experience%+(%random%/1000)+100
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
IF /I %mHitPoints% LEQ 0 (SET /A Kill=%Kill%+1) else IF /I %HitPoints% LEQ 0 (SET /A Death=%Death%+1)

SET /A HitPoints=100+(%STR%/4)
SET /A Energy=100+(%INT%/3)
SET /A Stamina=100+(%DEX%/2)
SET /A mHitPoints=100+(%mSTR%/4)
SET /A mEnergy=100+(%mINT%/3)
SET /A mStamina=100+(%mDEX%/2)
SET SBecost=10

SET /A LevelModifyer=(%STR%+%DEX%+%INT%)*4+(%level%*1000)
IF /I %Experience% GEQ %LevelModifyer% GOTO LevelUp 

GOTO LevelUpEnd
:LevelUp
cls
SET /A Level=%Level%+1
SET /A STR=%STR%+(%Random%/14000)
SET /A DEX=%DEX%+(%Random%/14000)
SET /A INT=%INT%+(%Random%/14000)
SET /A HitPoints=%HitPoints%+(%Random%/16384)
SET /A Energy=%Energy%+(%Random%/16384)
SET /A Stamina=%Stamina%+(%Random%/16384)
ECHO ===============================================
ECHO      Level Up!   You are now Level %Level%!
ECHO ===============================================
PAUSE>NUL
:LevelUpEnd
GOTO SelectAttack

:SelectAttack
SET /A Attack=1+(%STR%/4)
SET /A Defence=1+(%DEX%/4)
TITLE STR:%STR% DEX:%DEX% INT:%INT% HitPoints:%HitPoints% Stamina:%Stamina% Energy:%Energy% Kill/Death:%Kill%/%Death% KDR:%KDR%
CLS
ECHO ===============================================
ECHO               Batch Battle Engine
ECHO ==================="Monster"===================
ECHO  Monster Life:%mHitPoints%           Monster Energy:%mEnergy%
ECHO ===============================================
ECHO                  SELECT WEAPON!
ECHO ===============================================  
ECHO  STR:%STR%       Life:%HitPoints%    Level:%Level%          
ECHO  DEX:%DEX%     Energy:%Energy%    Experience:%Experience%       
ECHO  INT:%INT%    Stamina:%Stamina%    Next Level:%LevelModifyer%
ECHO =============================================== 
ECHO      HitChance:%HitChance%   Attack:%Attack%   Kills:%Kill%/%Death% %KDR%    
ECHO  DefenceChance:%DefenceChance%   Defence:%Defence% 
ECHO ===============================================  

ECHO                  Select Attack
ECHO ===============================================
ECHO  1 = Defensive Stance           Gain 20 Energy
ECHO  2 = Fists                      Cost  1 Energy
ECHO  3 = SpiritBlade                Cost %SBecost% Energy
ECHO  4 = SpaceLaser                 Cost 60 Energy
ECHO ===============================================
SET INPUT=
SET /P INPUT= 
IF /I '%INPUT%'=='1' GOTO DefensiveStance
IF /I '%INPUT%'=='2' GOTO Fists
IF /I '%INPUT%'=='3' GOTO SpiritBlade
IF /I '%INPUT%'=='4' GOTO SpaceLaser
PAUSE>NUL
GOTO start

:DefensiveStance
SET /A Attack=%Attack%+2
SET /A Defence=%Defence%+5
ECHO ===============================================
ECHO  Positioning your Stance and Montions more 
ECHO  defensivly allows you to build up some energy.
ECHO ===============================================  
ECHO  +20 Energy  +5 Stamina  %Attack% Damage  %Defence% Defence
ECHO ===============================================
SET INPUT=
SET /P INPUT= Press B To Go Back...
IF /I '%INPUT%'=='B' GOTO SelectAttack
PAUSE>NUL
SET /A Energy=%Energy%+20
SET /A Stamina=%Stamina%+5
GOTO start

:Fists
IF /I %Energy% LSS 1 GOTO NeedMoreEnergy
IF /I %Stamina% LSS 4 GOTO NeedMoreStamina
SET /A Attack=%Attack%+(%R%/2900)
SET /A Defence=%Defence%+2
ECHO ===============================================
ECHO  Hand to hand combat is second nature to you, 
ECHO  granting some defensive ability. 
ECHO ===============================================  
ECHO  -1 Energy  -4 Stamina  %Attack% Damage  %Defence% Defence
ECHO ===============================================
SET INPUT=
SET /P INPUT=Press B To Go Back...
IF /I '%INPUT%'=='B' GOTO SelectAttack
PAUSE>NUL
SET /A Energy=%Energy%-1
SET /A Stamina=%Stamina%-4
GOTO start

:SpiritBlade
IF /I %Energy% LSS %SBecost% GOTO NeedMoreEnergy
IF /I %Stamina% LSS 4 GOTO NeedMoreStamina
SET /A Attack=%Attack%+(%R%/2000)+(%SBecost%/3)
ECHO ===============================================
ECHO  The SpiritBlade is a wepaon only refered to
ECHO  in lore and myth. The harden meterials that 
ECHO  make it are said to be of magical origins.
ECHO ===============================================  
ECHO  -%SBecost% Energy  -4 Stamina  %Attack% Damage  %Defence% Defence
ECHO ===============================================
SET INPUT=
SET /P INPUT=Press B To Go Back...
IF /I '%INPUT%'=='B' GOTO SelectAttack
PAUSE>NUL
SET /A SBecost=%SBecost%+2
SET /A Energy=%Energy%-%SBecost%
IF /I %mEnergy% GTR 60 SET /A mEnergy=%mEnergy%-2
IF /I %Kill% GEQ 10 SET /A Attack=%Attack%+4
IF /I %Kill% GEQ 10 SET Defence=1
IF /I %Death% GEQ 10 SET /A SBecost=%SBecost%+1
SET /A Stamina=%Stamina%-4
GOTO start

:SpaceLaser
IF /I %Energy% LSS 60 GOTO NeedMoreEnergy
IF /I %Stamina% LSS 10 GOTO NeedMoreStamina
SET /A Defence=%Defence%
SET /A Attack=%Attack%+30+(%R%/90)
ECHO ===============================================
ECHO  They say good things come to those who win
ECHO  alot of epic battles. In this case the good
ECHO  thing is a giant space laser!
ECHO ===============================================  
ECHO  -60 Energy  -10 Stamina  %Attack% Damage  %Defence% Defence
ECHO ===============================================
SET INPUT=
SET /P INPUT=Press B To Go Back...
IF /I '%INPUT%'=='B' GOTO SelectAttack
PAUSE>NUL
SET /A Energy=%Energy%-60
SET /A Stamina=%Stamina%-10
GOTO start

:NeedMoreEnergy
CLS
ECHO ===============================================
ECHO            You require more Energy!
ECHO ===============================================
PAUSE>NUL
GOTO SelectAttack

:NeedMoreStamina
CLS
ECHO ===============================================
ECHO           You require more Stamina!
ECHO ===============================================
PAUSE>NUL
GOTO SelectAttack

::SET /A R03=%Random%/8191 0-6