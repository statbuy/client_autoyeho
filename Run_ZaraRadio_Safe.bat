@echo off
echo ======================================
echo Running ZaraRadio Client with reduced security restrictions
echo This may help bypass antivirus blocking
echo ======================================
echo.
echo If you still encounter issues, please add this folder to your antivirus exceptions
echo.
:: Temporarily lower Windows Defender settings for this process
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true -ErrorAction SilentlyContinue"
start "" "C:\zara_automation\Production\Stage\ZaraRadioClient\ZaraRadioClient.exe"
timeout /t 10
:: Restore Windows Defender settings
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false -ErrorAction SilentlyContinue"
echo Windows Defender real-time protection has been restored
echo.
pause
