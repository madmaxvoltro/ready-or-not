@echo off
:: Get receiver's IP address
set RECEIVER_IP=192.168.1.100

:: Set shared folder on receiver's PC (replace with receiver's shared folder name)
set SHARED_FOLDER=SharedFolder

:: Set source folder on sender's PC (replace with sender's source folder path)
set SOURCE_FOLDER=C:\path\to\source\folder

:: Build the destination path (receiver's shared folder)
set DESTINATION=\\%RECEIVER_IP%\%SHARED_FOLDER%

:: Transfer .txt files quietly without echo
xcopy "%SOURCE_FOLDER%\*.txt" "%DESTINATION%" /Y /S /I >nul 2>&1
