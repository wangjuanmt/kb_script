MKDIR "%LOCALAPPDATA%\Google"

REM NOTE: you can't specify drive or path for target file!
RENAME "%LOCALAPPDATA%\Google\Chrome\User Data" "UserDataBackup"

MKLINK /J "%LOCALAPPDATA%\Google\Chrome\User Data" "D:\GreenApp\Browser\Chrome\Profile\Default"
