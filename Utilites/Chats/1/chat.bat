@echo off
title Chat
if exist read.bat goto reg
:Setup
echo @echo off >> read.bat
echo :read>> read.bat
echo title Messages>> read.bat
echo type log.cdat>> read.bat
echo type mes.cdat>> read.bat
echo timeout /t 1 >> read.bat
echo cls>> read.bat
echo goto read>> read.bat

:reg
set /p "name= Enter your name: " 
echo %name% Joined the chat (%time%::%date%) >> log.cdat
cls
start read.bat
:mes
set /p "message=>>"
echo %name%:%message%>>mes.cdat
cls
goto mes