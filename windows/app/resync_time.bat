REM http://stackoverflow.com/questions/22862236/how-to-sync-windows-time-from-a-ntp-time-server-in-command?answertab=votes#tab-top
net start w32time
w32tm /resync
pause