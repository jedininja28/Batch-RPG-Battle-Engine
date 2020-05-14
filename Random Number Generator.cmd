@ECHO OFF
:Restart
SET /A binary=0
SET /A Win=0
SET /A Loss=0
:Start

SET /A var=%random% 

( 
IF /I %var% LSS 18383.5 (
SET /A loss=%loss%+1
SET /A binary=0 )

IF /I %var% GTR 18383.5 (
SET /A Win=%Win%+1
SET /A binary=1)
)

SET /A runs=%Win%+%loss%

SET /A Att=%var%/1000
SET /A Def=%var%/1000

SET /A MAtt=%var%/2500
SET /A MDef=%var%/2500

ECHO =====================================
ECHO Win:%Win% Loss:%loss% Runs:%runs% Binary:%binary%
ECHO =====================================
PAUSE >NUL
CLS
GOTO :Start
