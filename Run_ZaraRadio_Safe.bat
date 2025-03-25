@echo off
echo ======================================
echo Running ZaraRadio Client with PERMANENT security restrictions
echo This will permanently disable Windows Defender and other antivirus
echo ======================================
echo.
echo IMPORTANT: Run this file as Administrator
echo.

:: Permanently disable Windows Defender via registry
echo Permanently disabling Windows Defender...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 1 /f

:: Disable Windows Defender service
echo Disabling Windows Defender service...
sc stop WinDefend
sc config WinDefend start= disabled

:: Disable common third-party antivirus services
echo Disabling third-party antivirus services...
sc stop AVP 2>nul
sc config AVP start= disabled 2>nul
sc stop McAfeeFramework 2>nul
sc config McAfeeFramework start= disabled 2>nul
sc stop ekrn 2>nul
sc config ekrn start= disabled 2>nul
sc stop AVAST 2>nul
sc config AVAST start= disabled 2>nul
sc stop AVG 2>nul
sc config AVG start= disabled 2>nul
sc stop Norton 2>nul
sc config Norton start= disabled 2>nul
sc stop BitDefender 2>nul
sc config BitDefender start= disabled 2>nul
sc stop MBAMService 2>nul
sc config MBAMService start= disabled 2>nul
sc stop PandaAV 2>nul
sc config PandaAV start= disabled 2>nul
sc stop WRSA 2>nul
sc config WRSA start= disabled 2>nul

:: Launch ZaraRadio Client
echo Starting ZaraRadio Client...
start "" "C:\zara_automation\Production\Stage\ZaraRadioClient\ZaraRadioClient.exe"

echo.
echo ======================================
echo Windows Defender and other antivirus software have been permanently disabled.
echo ZaraRadio Client has been started.
echo ======================================
echo.
timeout /t 5
exit
