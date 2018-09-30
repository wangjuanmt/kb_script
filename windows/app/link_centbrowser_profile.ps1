$CentBrowserProfileLinkPath = "$ENV:LOCALAPPDATA\CentBrowser\User Data"
$CentBrowserProfileLinkFolder = Split-Path $CentBrowserProfileLinkPath

# Remove existing symbol link
if (Test-ReparsePoint $CentBrowserProfileLinkPath) {
    [System.IO.Directory]::Delete($CentBrowserProfileLinkPath, $true)
}

# Create parent folder if not exists
if (-Not (Test-Path -Path $CentBrowserProfileLinkFolder)) {
    New-Item -Path $CentBrowserProfileLinkFolder -ItemType "directory"
}

# Remove existing folder
if (Test-Path $CentBrowserProfileLinkPath) {
    Get-ChildItem -Path "$CentBrowserProfileLinkPath\*" -Recurse -Force | Remove-Item -Recurse -Force
    Remove-Item -Path "$CentBrowserProfileLinkPath" -Recurse -Force
}

New-Link "$ENV:UserLocalLib\centbrowser\profile\default" $CentBrowserProfileLinkPath
