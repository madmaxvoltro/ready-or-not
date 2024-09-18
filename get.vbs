Set objFSO = CreateObject("Scripting.FileSystemObject")


' Get the current folder path
strFolder = objFSO.GetParentFolderName(WScript.ScriptFullName)

' Define paths for the files
txtFilePath = strFolder & "\sec.txt"
batFilePath = strFolder & "\one.bat"

' Check if the text file exists
If Not objFSO.FileExists(txtFilePath) Then
    ' Run the batch file with elevated permissions (UAC) but hide the window
    Set UAC = CreateObject("Shell.Application")
    UAC.ShellExecute "cmd.exe", "/c """ & batFilePath & """", "", "runas", 0
     Set txtFile = objFSO.CreateTextFile(txtFilePath, True)
    txtFile.WriteLine "Batch file has been run."
    txtFile.Close
Else
    ' Create or update the text file
    ' Set txtFile = objFSO.CreateTextFile(txtFilePath, True)
    ' txtFile.WriteLine "Batch file has been run."
    ' txtFile.Close
End If
