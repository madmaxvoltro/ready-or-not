Set objShell = CreateObject("WScript.Shell")

' Get the current folder path
Set objFSO = CreateObject("Scripting.FileSystemObject")
strFolder = objFSO.GetParentFolderName(WScript.ScriptFullName)

' Path to the batch file in the same folder
batFilePath = strFolder & "\heal.bat"

' Execute the batch file silently
objShell.Run """" & batFilePath & """", 0, False
