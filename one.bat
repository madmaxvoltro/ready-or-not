@echo off
setlocal

:: Get the current directory of the batch file
set "current_dir=%~dp0"

:: Set the path to the image file
set "image_path=%current_dir%r.jpeg"

:: Set the wallpaper using the image path
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%image_path%" /f

:: Refresh the wallpaper settings
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True


@REM @echo off
@REM :: Set the IP address of the receiver PC
@REM set receiver_ip=YOUR_RECEIVER_PC_IP
@REM set port=9999

@REM :: Send a signal to the receiver PC
@REM echo The PC is ON | powershell -Command "(New-Object System.Net.Sockets.TcpClient).Connect('%receiver_ip%', %port%); $stream = $client.GetStream(); $writer = New-Object System.IO.StreamWriter($stream); $writer.WriteLine('The PC is ON'); $writer.Flush(); $stream.Close(); $client.Close()"

@REM echo Signal sent to your PC. Press any key to exit...
@REM pause
