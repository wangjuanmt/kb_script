@echo off
REM Shortcuts not starting bash as login shell: https://github.com/mintty/wsltty/issues/37
%LOCALAPPDATA%\wsltty\bin\mintty.exe -i "%LOCALAPPDATA%/wsltty/wsl.ico" --WSL= -h err --configdir="%APPDATA%\wsltty" -~ /bin/zsh -l
