ECHO OFF

:Start
CLS

SET /A Count=%Count%+1
IF /I %Count% EQU 1 (ECHO 1) ELSE IF /I %Count% EQU 2 (ECHO 2) ELSE IF /I %Count% EQU 3 (ECHO 3) ELSE IF /I %Count% EQU 4 (ECHO 4) ELSE IF /I %Count% GTR 4 set Count=0 && GOTO START

PAUSE>NUL
GOTO start
