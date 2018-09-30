REM Turn off UAC
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f

REM Turn off hibernate
powercfg -h off

REM Turn off system restore and disable system protection for C drive
SC stop VSS
SC config VSS start= demand
wmic /namespace:\\root\default path SystemRestore call Disable C:\

REM Turn off defender
SC stop WinDefend
SC config WinDefend start= disabled

REM Turn off firewall
netsh advfirewall set allprofiles state off
SC stop MpsSvc
SC config MpsSvc start= disabled

REM Disable Windows Media Player Network Sharing Service
SC stop WMPNetworkSvc
SC config WMPNetworkSvc start= disabled

REM Change memory dump to none
wmic recoveros set DebugInfoType = 0

REM Setting up the page file with Initial size of 150% physical memory and double for maximum size.
REM CHANGE PAGE FILE TO MANUAL
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
REM Change pagefile on C drive to None and create a new one on D drive
wmic pagefileset where name="C:\\pagefile.sys" delete
wmic pagefileset create name="D:\\pagefile.sys"
REM GET THE PHYSICAL MEM SIZE AS DIGITS
FOR /F "eol=; tokens=1,2,3,4,5 delims=:, " %%i IN ('"systeminfo |find /i "Total Phy""') DO @Set /a  m=%%l%%m
REM SET INITIAL MEMORY SIZE 150%of PHYSICAL MEMORY
SET /a x=%m%*3/2
REM SET MAXIMUM MEMORY 200% OF PHYSICAL MEMORY
SET /a y=%m%*2
REM SET PAGEFILE SIZE
wmic pagefileset where name="D:\\pagefile.sys" set InitialSize=%x%,MaximumSize=%y%

REM Other things we have to do manually
REM 1.Power management

REM Restart computer
REM shutdown -r -t 0 -f