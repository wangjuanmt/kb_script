$AppdataLinkPath = "$ENV:APPDATA\Mozilla"
$LocalAppdataLinkPath = "$ENV:LOCALAPPDATA\Mozilla"

if (Test-ReparsePoint $AppdataLinkPath) {
    [System.IO.Directory]::Delete($AppdataLinkPath, $true)
}

if (Test-Path $AppdataLinkPath) {
    Remove-Dir $AppdataLinkPath
}

# This is where firefox stores cache.
# Find the location of the cache on the about:cache page.
# Reference: https://support.mozilla.org/en-US/questions/982861
if (Test-ReparsePoint $LocalAppdataLinkPath) {
    [System.IO.Directory]::Delete($LocalAppdataLinkPath, $true)
}

if (Test-Path $LocalAppdataLinkPath) {
    Remove-Dir $LocalAppdataLinkPath
}

New-Link "$ENV:UserLocalLib\firefox\roaming" $AppdataLinkPath
New-Link "$ENV:UserLocalLib\firefox\localappdata" $LocalAppdataLinkPath
