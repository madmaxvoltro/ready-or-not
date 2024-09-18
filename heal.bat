@echo off
:: Set the path to the marker file (popup_shown.txt) in the same folder as this batch file
set "markerfile=%~dp0popup_shown.txt"

:: Check if the file exists and delete it
if exist "%markerfile%" (
    del "%markerfile%" /Q
    echo popup_shown.txt has been deleted.
) else (
    echo popup_shown.txt does not exist.
)

pause
