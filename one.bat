@echo off
:: Set the IP address of the receiver PC
set receiver_ip=YOUR_RECEIVER_PC_IP
set port=9999

:: Send a signal to the receiver PC
echo The PC is ON | powershell -Command "(New-Object System.Net.Sockets.TcpClient).Connect('%receiver_ip%', %port%); $stream = $client.GetStream(); $writer = New-Object System.IO.StreamWriter($stream); $writer.WriteLine('The PC is ON'); $writer.Flush(); $stream.Close(); $client.Close()"

echo Signal sent to your PC. Press any key to exit...
pause
