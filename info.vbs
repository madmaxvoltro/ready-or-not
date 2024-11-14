Option Explicit
Dim objShell, objHTTP, command, hostIP, port, serverURL

' Configuration
hostIP = "10.40.3.40"  ' Replace with your host PC's IP address
port = "5000"
serverURL = "http://" & hostIP & ":" & port

Set objShell = CreateObject("WScript.Shell")
Set objHTTP = CreateObject("Microsoft.XMLHTTP")

On Error Resume Next
' Send request to the server
objHTTP.Open "POST", serverURL, False
objHTTP.setRequestHeader "Content-Type", "application/json"
objHTTP.Send "{""status"": ""connected"", ""hostname"": """ & objShell.ExpandEnvironmentStrings("%COMPUTERNAME%") & """}"

' Check for server response
If objHTTP.Status = 200 Then
    command = objHTTP.ResponseText
    
    ' Parse and execute commands (only simple commands here for safety)
    If command = "list" Then
        objShell.Run "cmd.exe /c dir > C:\Temp\output.txt", 0, True  ' Example command to list directory contents
    ElseIf command = "exit" Then
        WScript.Quit  ' Exit the script
    Else
        ' MsgBox "Received unrecognized command: " & command, 48, "Error"
    End If
Else
    ' MsgBox "Error in server response or connection.", 48, "Connection Error"
End If

' Clean up
Set objShell = Nothing
Set objHTTP = Nothing
