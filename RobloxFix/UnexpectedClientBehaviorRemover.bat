@ECHO OFF
title Roblox Fixer

curl https://raw.githubusercontent.com/fa899/Roblox-Version-Repo/main/Version > robloxversion.txt

FOR /F "tokens=* delims=" %%x in (robloxversion.txt) DO (
    SET robloxversion = %%x
    IF EXIST %localappdata%\Roblox\Versions\%%x (
        IF EXIST %localappdata%\Roblox\Versions\%%x\AppSettings.xml (
            echo y|del %localappdata%\Roblox\Versions\%%x\AppSettings.xml
        )
    )
)

IF EXIST "%localappdata%\Roblox\Versions\AnalyticsSettings.xml" (
    echo y|del %localappdata%\Roblox\Version\AnalyticsSettings.xml
)

echo Hello! This program removes the Unexpected Client Behavior error every time you try to load ROBLOX.

FOR /F "tokens=* delims=" %%x in (robloxversion.txt) DO echo Updated to: %%x, every time roblox updates this might be (kinda) patched.

echo To fully patch this error, wait untill this is complete, and then reset your computer.
echo Made by zestycodes#4818 on discord, in 29.10.2022. Enjoy.
echo Starting up.
echo Running FixV2.

.\Dependencies\FixV2.py

echo Fixing the roblox network... (Accept the permissions! giving 2s to read)

echo After this is complete, reset your computer and the unexpected client behavior issue should be fixed.

TIMEOUT 2

Powershell -Command "& { Start-Process \".\Dependencies\internet-fix.bat\" -verb RunAs}"

tasklist | find "RobloxPlayerBeta"

IF %errorlevel%=="0" (
echo Killing roblox...
taskkill /im RobloxPlayerBeta.exe
) ELSE (
echo RobloxPlayerBeta.exe was already killed, returned null.
)

IF EXIST "%localappdata%\Roblox\AnalyticsSettings.xml" (
echo y|del "%localappdata%\Roblox\AnalyticsSettings.xml"
)

echo Step 1.

echo Deleting logs (to prevent roblox from reading old logs as the data is providen there).

IF EXIST %localappdata%\Roblox\logs (
echo y|rmdir /s /q "%localappdata%\Roblox\logs"
) ELSE (
echo Logs already were removed, moving on.
)

echo Deleting GlobalBasicSettings_13.

echo Deleting FRM configurations, please wait.
IF EXIST "%localappdata%\Roblox\GlobalBasicSettings_13.xml" (
echo y|del %localappdata%\Roblox\GlobalBasicSettings_13.xml
) ELSE (
echo FRM configurations already were removed, moving on.
)

echo Deleting FRM configurations, please wait.
IF EXIST "%localappdata%\Roblox\frm.cfg" (
echo y|del %localappdata%\Roblox\frm.cfg
) ELSE (
echo FRM configurations already were removed, moving on.
)

echo Downloading the latest roblox (10s time out)

.\Dependencies\LatestRobloxInstaller.exe

TIMEOUT 20

echo Success! Thanks for using. Closing in 5 seconds. Press any key or click X on top right of this window. After closed, roblox player beta will launch. Have fun!
TIMEOUT /T 5

for /R "%localappdata%\Roblox\Versions" %%I in ("RobloxPlayerLauncher*.exe") do if /I "%%~nxI" == "RobloxPlayerLauncher.exe" "%%I" createdatabase closeimmediately