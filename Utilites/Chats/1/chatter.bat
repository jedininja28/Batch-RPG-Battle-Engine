@echo off
title Chat
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