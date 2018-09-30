$ChromeProfileLinkPath = "$ENV:LOCALAPPDATA\Google\Chrome\User Data"
$ChromeProfileLinkFolder = Split-Path $ChromeProfileLinkPath

# Remove existing symbol link
if (Test-ReparsePoint $ChromeProfileLinkPath) {
    [System.IO.Directory]::Delete($ChromeProfileLinkPath, $true)
}

# Create parent folder if not exists
if (-Not (Test-Path -Path $ChromeProfileLinkFolder)) {
    New-Item -Path $ChromeProfileLinkFolder -ItemType "directory"
}

# Remove existing folder
if (Test-Path $ChromeProfileLinkPath) {
    Get-ChildItem -Path "$ChromeProfileLinkPath\*" -Recurse -Force | Remove-Item -Recurse -Force
    Remove-Item -Path "$ChromeProfileLinkPath" -Recurse -Force
}

New-Link "$ENV:UserLocalLib\chrome\profile\default" $ChromeProfileLinkPath
