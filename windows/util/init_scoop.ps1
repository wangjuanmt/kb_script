# https://github.com/lukesampson/scoop

# Use the enviroment variable %SCOOP% to change the install path.
[Environment]::SetEnvironmentVariable("SCOOP", "D:\bedroom\local\app\scoop", "Machine")
$ENV:SCOOP = "$ENV:UserLocalApp\scoop"

New-Item -ItemType directory -Path "$ENV:UserLocalApp"
Invoke-Expression (New-Object net.webclient).downloadstring('https://get.scoop.sh')

scoop bucket add extras
scoop bucket add athrunbinary https://github.com/athrunsun/scoop-binary.git
