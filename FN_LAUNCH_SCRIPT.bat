@echo off
TITLE FORTNITE LAUNCH SCRIPT by @amitxv
echo https://github.com/amitxvv/Fortnite-launch-script
setlocal enabledelayedexpansion

set EGLPATH="C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe"

set FORTNITEPATH="C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe"

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v "NtpServer" /t REG_SZ /d "time.windows.com,0x9" /f > NUL 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v "Type" /t REG_SZ /d "NTP" /f > NUL 2>&1
Reg.exe add "HKCU\Control Panel\International" /v "iDate" /t REG_SZ /d "1" /f > NUL 2>&1
Reg.exe add "HKCU\Control Panel\International" /v "sDate" /t REG_SZ /d "-" /f > NUL 2>&1
Reg.exe add "HKCU\Control Panel\International" /v "sShortDate" /t REG_SZ /d "dd/MM/yy" /f > NUL 2>&1
del /f /q "C:\Fortnite.bat" > NUL 2>&1
taskkill /F /IM explorer.exe > NUL 2>&1
start explorer
cls
echo syncing time...
sc config w32time start= demand > NUL 2>&1
net start w32time > NUL 2>&1
w32tm /resync /force > NUL 2>&1
net stop w32time > NUL 2>&1
sc config w32time start= disabled > NUL 2>&1
echo @echo off >> "C:\Fortnite.bat"

:BEOREAC
cls
echo Do you want to force Battleye or EasyAntiCheat?
echo.
echo [1] Battleye
echo. 
echo [2] EasyAntiCheat
echo.
choice /c:12 /n > NUL 2>&1
if errorlevel 2 goto EasyAntiCheat
if errorlevel 1 goto Battleye

:Battleye
cls
start "" %FORTNITEPATH%
timeout /t 20
for /f "tokens=2delims=," %%a in ('tasklist /v /fo csv /fi "imagename eq BEService.exe" ^| findstr /ic:"BEService.exe"') do goto BEDATE
sc query EasyAntiCheat && rem || exit /b
taskkill /IM FortniteClient-Win64-Shipping.exe /F
taskkill /IM EpicGamesLauncher.exe /F
taskkill /IM FortniteClient-Win64-Shipping_EAC.exe /F
taskkill /IM FortniteClient-Win64-Shipping_BE.exe /F
for /f "tokens=2delims==" %%a in ('wmic os get LocalDateTime /value') do for %%b in (%%a) do set "DateTime=%%b"
set /a "days=1!DateTime:~-19,2! - 101"
set "DateTime=!days!/!DateTime:~-21,2!/!DateTime:~0,-21!"
date !DateTime!
sc query EasyAntiCheat && goto Battleye

:BEDATE
echo date %date% >> "C:\Fortnite.bat"
echo time %time% >> "C:\Fortnite.bat"

goto AFFINITY

:EasyAntiCheat
cls
start "" %FORTNITEPATH%
timeout /t 20
for /f "tokens=2delims=," %%a in ('tasklist /v /fo csv /fi "imagename eq EasyAntiCheat.exe" ^| findstr /ic:"EasyAntiCheat.exe"') do goto EACDATE
sc query BEService && rem || exit /b
taskkill /IM FortniteClient-Win64-Shipping.exe /F
taskkill /IM EpicGamesLauncher.exe /F
taskkill /IM FortniteClient-Win64-Shipping_EAC.exe /F
taskkill /IM FortniteClient-Win64-Shipping_BE.exe /F
for /f "tokens=2delims==" %%a in ('wmic os get LocalDateTime /value') do for %%b in (%%a) do set "DateTime=%%b"
set /a "days=1!DateTime:~-19,2! - 101"
set "DateTime=!days!/!DateTime:~-21,2!/!DateTime:~0,-21!"
date !DateTime!
sc query BEService && goto EasyAntiCheat

:EACDATE
echo date %date% >> "C:\Fortnite.bat"
echo time %time% >> "C:\Fortnite.bat"

:AFFINITY
cls
taskkill /IM FortniteClient-Win64-Shipping.exe /F
taskkill /IM EpicGamesLauncher.exe /F
taskkill /IM FortniteClient-Win64-Shipping_EAC.exe /F
taskkill /IM FortniteClient-Win64-Shipping_BE.exe /F
cls
echo.
echo success! a date has been found to launch with your chosen anticheat.
echo.
echo would you like Fortnite to launch with a specified Affinity?
echo.
echo [1] Yes
echo. 
echo [2] No
echo.
choice /c:12 /n > NUL 2>&1
if errorlevel 2 goto NOAFFINITY
if errorlevel 1 goto YESAFFINITY

:YESAFFINITY
cls
set /p binaryaffinity="Type the binary affinity in which you want your game to run on: "

:START
IF     "binaryaffinity"=="" GOTO START
IF NOT "%~2"=="" GOTO START

ECHO "%binaryaffinity%"| FINDSTR /R /B /C:"\"[01][01]*\"$" >NUL || GOTO START

SET Binary=%binaryaffinity%
SET Decimal=0
SET DigVal=1

:LOOP
IF %Binary% GTR 1 (
	SET Digit=%Binary:~-1%
	SET Binary=%Binary:~0,-1%
) ELSE (
	SET /A Digit = %Binary%
	SET Binary=0
)

IF %Digit% EQU 1 SET /A Decimal = %Decimal% + %DigVal%

SET /A DigVal *= 2

IF %Binary% GTR 0 GOTO LOOP

SET Binary=
SET Digit=
SET DigVal=

cls
echo %EGLPATH% >> "C:\Fortnite.bat"
echo timeout /t 3 >> "C:\Fortnite.bat"
echo PowerShell "get-process EpicGamesLauncher | %% { $_.ProcessorAffinity=%Decimal% }" >> "C:\Fortnite.bat"
echo PowerShell "get-process EpicGamesLauncher | foreach { $_.ProcessorAffinity=%Decimal% }" >> "C:\Fortnite.bat"

gogo NOAFFINITY

:NOAFFINITY
cls
echo %FORTNITEPATH% >> "C:\Fortnite.bat"
echo timeout /t 30 >> "C:\Fortnite.bat"
echo sc config w32time start= demand >> "C:\Fortnite.bat"
echo net start w32time >> "C:\Fortnite.bat"
echo w32tm /resync /force >> "C:\Fortnite.bat"
echo net stop w32time >> "C:\Fortnite.bat"
echo sc config w32time start= disabled >> "C:\Fortnite.bat"
echo taskkill /IM EpicGamesLauncher.exe /F >> "C:\Fortnite.bat"
echo taskkill /IM CrashReportClient.exe /F >> "C:\Fortnite.bat"

sc config w32time start= demand
net start w32time
w32tm /resync /force
net stop w32time
sc config w32time start= disabled
cls
echo You must launch Fortnite with "C:\Fortnite.bat" from now on.
echo Feel free to place that batch file on your desktop.
pause
exit /b






