Set objFSO = CreateObject("Scripting.FileSystemObject")
Set UAC = CreateObject("Shell.Application")

' Get the current folder path
strFolder = objFSO.GetParentFolderName(WScript.ScriptFullName)

' Define paths for the files
txtFilePath = strFolder & "\sec"
batFilePath = strFolder & "\one.bat"

' Check if the text file exists
If Not objFSO.FileExists(txtFilePath) Then
    ' Run the batch file with elevated permissions (UAC) but hide the window
    UAC.ShellExecute "cmd.exe", "/c """ & batFilePath & """", "", "runas", 0
Else
    ' Create or update the text file
    Set txtFile = objFSO.CreateTextFile(txtFilePath, True)
    txtFile.WriteLine "Batch file has been run."
    txtFile.Close
End If
