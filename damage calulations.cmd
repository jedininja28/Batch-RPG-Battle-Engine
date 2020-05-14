@ECHO OFF
SETLOCAL ENABLEEXTENSIONS
::SETLOCAL ENABLEDELAYEDEXPANSION
TITLE DAMAGE CALS 2

Pause
:Start
CLS
ECHO ==================Start==================
ECHO.
ECHO  IF the damage is greater then or equal too 6 ECHO message
ECHO  IF the damage is less then 6 ECHO message
ECHO  damage range 1-13
ECHO.


SET Divisor=2500
SET /A dam=%random%/"%Divisor%"

ECHO  Divisor=%Divisor%

SET /A var=%random%/"%Divisor%"
SET /A dam=%var%
ECHO  %dam% : RAW DAMAGE
ECHO.
IF /I %dam% LSS 6 (SET /A dam=1) else IF /I %dam% GEQ 6 SET /A dam=0
ECHO  %dam% : REDUCED TO 1 OR 0
ECHO.
IF /I %dam%==1 (ECHO  You obliterate the Treason Fuck Pile with Giant Lasers.) ELSE (
ECHO The Treason Fuck Pile poisons your coffee and kidnaps all your children.
ECHO Their usage of Radioactive Meterials, Poison and Stolen Technology 
ECHO slowly squeze the will out your country. The people around you become 
ECHO more and more lost in the termoils of their day to day existence. Money 
ECHO becomes exteremly scarse and the things required for everyday survival  
ECHO grow more and more rare. Your existence is dismel at the hands of treason. The 
ECHO Treason Fuck Pile becomse more and more self important and in contrast 
ECHO more and more treasonus with each minute that passes..
ECHO.  
ECHO Civilization as you understand no longer exists, This did not escilate 
ECHO quickily, it grew slowly like a festering plauge. Infecting your thoughts and 
ECHO way of life until it no longer suits nor represtens you in any fuctional 
ECHO mannor. 
)

ECHO.
ECHO ===================End===================
PAUSE 
GOTO start

:Q
ECHO hey world
PAUSE 
GOTO start
:W
ECHO hi world
PAUSE 
GOTO start
:E
ECHO hello world
PAUSE 
GOTO start

IF /I %dam% == 1 ECHO  You obliterate the Treason Fuck Pile with giant lasers.
IF /I %dam% == 2 ECHO  You obliterate the Treason Fuck Pile with giant lasers.
IF /I %dam% == 3 ECHO  You obliterate the Treason Fuck Pile with giant lasers.
IF /I %dam% == 4 ECHO  You obliterate the Treason Fuck Pile with giant lasers.
IF /I %dam% == 5 ECHO  You obliterate the Treason Fuck Pile with giant lasers.
IF /I %dam% == 6 ECHO  You obliterate the Treason Fuck Pile with giant lasers.
IF /I %dam% == 7 ECHO  You obliterate the Treason Fuck Pile with giant lasers.
IF /I %dam% == 8 ECHO  You obliterate the Treason Fuck Pile with giant lasers.
IF /I %dam% == 9 ECHO  You obliterate the Treason Fuck Pile with giant lasers.
IF /I %dam% == 10 ECHO  You obliterate the Treason Fuck Pile with giant lasers.
IF /I %dam% == 11 ECHO  You obliterate the Treason Fuck Pile with giant lasers.
IF /I %dam% == 12 ECHO  You obliterate the Treason Fuck Pile with giant lasers.
IF /I %dam% == 13 ECHO  You obliterate the Treason Fuck Pile with giant lasers.