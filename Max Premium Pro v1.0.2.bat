@echo off
title Max Premium Pro - Updater

:: Set the version you want to download (should be updated manually or dynamically)
set NEW_VERSION=v1.0.2

echo Closing current application...
taskkill /IM "Max Premium Pro.exe" /F >nul 2>&1
timeout /t 2 /nobreak >nul

:: Download new version using dynamic versioning
echo Downloading new version v%NEW_VERSION%...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/VannyLD/MAXPREMIUMPRO/releases/download/v1.0.1/Max.Premium.Pro.exe', 'Max Premium Pro.exe')"

if exist "Max Premium Pro.exe" (
    echo Starting new version...
    start "" "Max Premium Pro.exe"
) else (
    echo ERROR: Failed to download the new version!
    pause
    exit /b
)

echo Cleaning up updater script...
del "%~f0"
