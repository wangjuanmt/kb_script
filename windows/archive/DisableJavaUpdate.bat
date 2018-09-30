taskkill /F /IM jucheck.exe /T
taskkill /F /IM jusched.exe /T
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v SunJavaUpdateSched /f
reg add "HKLM\Software\JavaSoft\Java Update\Policy" /v EnableJavaUpdate /t REG_DWORD /d 0 /f
reg add "HKLM\Software\JavaSoft\Java Update\Policy" /v EnableAutoUpdateCheck /t REG_DWORD /d 0 /f
reg add "HKLM\Software\JavaSoft\Java Update\Policy" /v NotifyDownload /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Wow6432Node\JavaSoft\Java Update\Policy" /v EnableJavaUpdate /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Wow6432Node\JavaSoft\Java Update\Policy" /v EnableAutoUpdateCheck /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Wow6432Node\JavaSoft\Java Update\Policy" /v NotifyDownload /t REG_DWORD /d 0 /f