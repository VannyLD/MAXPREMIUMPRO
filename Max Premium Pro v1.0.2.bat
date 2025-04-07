@echo off
title Max Premium Pro - Updater

echo Closing current application...
taskkill /IM "Max Premium Pro.exe" /F >nul 2>&1
timeout /t 2 /nobreak >nul

echo Downloading new version...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/VannyLD/MAXPREMIUMPRO/releases/download/v1.0.2/Max%20Premium%20Pro%20v1.0.2.exe', 'Max Premium Pro.exe')"

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
