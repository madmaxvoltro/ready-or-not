strFolder = objFSO.GetParentFolderName(WScript.ScriptFullName)

 Set UAC = CreateObject("Shell.Application")

 ' Path to your batch file
 batFilePath = strFolder & "\one.bat"

 ' Run the batch file with elevated permissions (UAC) but hide the window
 UAC.ShellExecute "cmd.exe", "/c """"" & batFilePath & """"", "", "runas", 0


