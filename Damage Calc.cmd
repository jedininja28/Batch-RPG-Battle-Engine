@ECHO OFF
:Restart
SET /A Runs=0
SET /A Win=0
SET /A Loss=0 
:Start

SET /A Var=%Random%

IF /I %Var% LEQ 16384 (SET /A Loss=%Loss%+1) ELSE (SET /A Win=%Win%+1)
IF /I %Var% GTR 16384 (SET /A Binary=1) ELSE (SET /A Binary=0)

SET /A Runs=(%Win%+%Loss%)

echo =====================================
ECHO Win:%Win% Loss:%Loss% Runs:%Runs% Binary:%Binary%
echo =====================================
PAUSE >NUL
CLS
GOTO start
