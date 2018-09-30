# https://chocolatey.org/
# To install choco to custom location, follow instructions in https://github.com/chocolatey/choco/wiki/Installation:
# create a machine level (user level will also work) environment variable named ChocolateyInstall and set it to the folder you want Chocolatey to install to prior to installation.
# And modify the PATH below to custom location, like "SET PATH=%PATH%;D:\chocolatey\bin"

$ENV:ChocolateyInstall = "D:\bedroom\local\app\chocolatey"
[Environment]::SetEnvironmentVariable("ChocolateyInstall", $ENV:ChocolateyInstall, "Machine")

# This is where chocolatey installs cygwin, msys2 and cmder
$ENV:ChocolateyToolsLocation = "D:\bedroom\local\app\chocolateytools"
[Environment]::SetEnvironmentVariable("ChocolateyToolsLocation", $ENV:ChocolateyToolsLocation, "Machine")

# https://chocolatey.org/install
Set-ExecutionPolicy Bypass
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$ENV:PATH = "$ENV:ChocolateyInstall\bin;" + $ENV:PATH

# Change temp folder
choco.exe config set cacheLocation D:\Tmp\Chocolatey

# Install required extensions
choco.exe install -y chocolatey-core.extension
choco.exe install -y chocolatey-uninstall.extension
choco.exe install -y chocolatey-windowsupdate.extension
