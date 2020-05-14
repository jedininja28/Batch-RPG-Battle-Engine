@ECHO OFF
::SETLOCAL ENABLEEXTENSIONS
::SETLOCAL ENABLEDELAYEDEXPANSION
:OPEN
CLS
ECHO ==============================================
ECHO. 
ECHO.
ECHO. 
ECHO ==============================================
Echo Your Life:100             
ECHO ==============================================
PAUSE >NUL

:restart
set /a hp=100
set /a mhp=100

:Start
CLS
ECHO ==============================================
ECHO. 
set /a var2=%random%
set /a mdam=%random%/2500

if /i %var2% LEQ 16384 ( 
if /i %mdam% LEQ 15 echo        The Monster attacks for %mdam% Damage!
if /i %mdam% GEQ 16 ECHO The Monster lands a critical blow for %mdam% Damage!
set /a hp=%hp%-%mdam% )

if /i %var2% GEQ 16384 (
ECHO             You Dodge %mdam% Damage! )
ECHO. 
ECHO ==============================================
Echo Your Life: %hp%                Player Wins:%Win%  
ECHO ==============================================
Echo Monster Life: %mhp%           Monster Wins:%mWin%
ECHO ==============================================
if /i %hp% LEQ 0 goto :Lose
if /i %mhp% LEQ 0 goto :Win
pause >nul
CLS

ECHO ==============================================
ECHO. 
set /a var=%random%
set /a dam=%random%/2500+1


if /i %var% GEQ 16384 (
if /i %dam% LEQ 15 ECHO          You attack for %dam% Damage!
if /i %dam% GEQ 16 ECHO  You land a masterful strike for %dam% Damage!
set /a mhp=%mhp%-%dam% )

if /i %var% LEQ 16384 (
ECHO         The Monster blocked %dam% Damage! )
ECHO. 
ECHO ==============================================
Echo Your Life: %hp%                Player Wins:%Win%  
ECHO ==============================================
Echo Monster Life: %mhp%           Monster Wins:%mWin%
ECHO ==============================================
if /i %hp% LEQ 0 goto :Lose
if /i %mhp% LEQ 0 goto :Win
pause >nul
GOTO start

:Lose
ECHO ==============================================
ECHO.
Echo  After a long bloody battle the monster gets 
ECHO    the upper hand and eats you. Game Over!
set /a mWin=0+%mWin%+1
ECHO.
ECHO ==============================================
PAUSE >NUL
goto :restart 

:Win
ECHO ==============================================
ECHO.
Echo  You are tired and worn out, but the monster
Echo          is dead, Victory is Yours!
set /a Win=0+%Win%+1
ECHO.
ECHO ==============================================
PAUSE >NUL
goto :restart
