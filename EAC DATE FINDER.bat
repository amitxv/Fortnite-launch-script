@echo off
TITLE EAC DATE FINDER by @amitxv
setlocal enabledelayedexpansion

set gamepath="C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe"

sc config w32time start= demand
net start w32time
w32tm /resync /force
net stop w32time
sc config w32time start= disabled
sc query BEService && call:LOOP || exit /b
exit /b

:LOOP
start "" %gamepath%
timeout /t 20
for /f "tokens=2delims=," %%a in ('tasklist /v /fo csv /fi "imagename eq EasyAntiCheat.exe" ^| findstr /ic:"EasyAntiCheat.exe"') do goto EACDATE
sc query BEService && rem || exit /b
sc stop BEService
taskkill /IM EpicGamesLauncher.exe /F
for /f "tokens=2delims==" %%a in ('wmic os get LocalDateTime /value') do for %%b in (%%a) do set "DateTime=%%b"
set /a "days=1!DateTime:~-19,2! - 101"
set "DateTime=!days!/!DateTime:~-21,2!/!DateTime:~0,-21!"
date !DateTime!
sc query BEService && goto LOOP

:EACDATE
echo @echo off >> "C:\EAC LAUNCH FN.txt"
echo date %date% >> "C:\EAC LAUNCH FN.txt"
echo time %time% >> "C:\EAC LAUNCH FN.txt"
echo %gamepath% >> "C:\EAC LAUNCH FN.txt"
echo timeout /t 30 >> "C:\EAC LAUNCH FN.txt"
echo sc config w32time start= demand >> "C:\EAC LAUNCH FN.txt"
echo net start w32time >> "C:\EAC LAUNCH FN.txt"
echo w32tm /resync /force >> "C:\EAC LAUNCH FN.txt"
echo net stop w32time >> "C:\EAC LAUNCH FN.txt"
echo sc config w32time start= disabled >> "C:\EAC LAUNCH FN.txt"
echo taskkill /IM EpicGamesLauncher.exe /F >> "C:\EAC LAUNCH FN.txt"
echo taskkill /IM CrashReportClient.exe /F >> "C:\EAC LAUNCH FN.txt"

ren "C:\EAC LAUNCH FN.txt" "EAC LAUNCH FN.bat"
taskkill /IM FortniteClient-Win64-Shipping.exe /F
taskkill /IM EpicGamesLauncher.exe /F
sc config w32time start= demand
net start w32time
w32tm /resync /force
net stop w32time
sc config w32time start= disabled
cls
echo You must launch Fortnite with the bat file in C:\ from now on.
pause
exit