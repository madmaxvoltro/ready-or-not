@echo off
:: Disable Windows Defender using PowerShell commands

:: Run PowerShell command to disable real-time protection
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

:: Disable other Defender features
powershell -Command "Set-MpPreference -DisableBehaviorMonitoring $true"
powershell -Command "Set-MpPreference -DisableOnAccessProtection $true"
powershell -Command "Set-MpPreference -DisableScanOnRealtimeEnable $true"

:: Optional: Disable the Defender service (not recommended)
:: sc stop WinDefend
:: sc config WinDefend start=disabled

echo Windows Defender has been disabled.
pause
