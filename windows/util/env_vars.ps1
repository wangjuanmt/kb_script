$ENV:ProfileAllHosts = (Split-Path $PROFILE) + "\profile.ps1"

$ENV:TargetUser = $ENV:USERNAME

#$HOME = $ENV:HOME
$ENV:UserHome = $HOME

$ENV:UserRoom = 'D:\bedroom'
$ENV:KbRoot = "$ENV:UserRoom\kb"
$ENV:ScriptRepoRoot = "$ENV:KbRoot\script"
$ENV:UserDownloads = 'D:\Incoming'

$ENV:UserLocal = "$ENV:UserRoom\local"
$ENV:UserLocalBin = "$ENV:UserLocal\bin"
$ENV:UserLocalApp = "$ENV:UserLocal\app"
$ENV:UserLocalLib = "$ENV:UserLocal\lib"
$ENV:GreenAppShortcut = "$ENV:UserLocalApp\shortcut"

# Most important variables pointing to the correct OS folder!
$ENV:SystemId = 'windows'

$ENV:SystemCategory = 'windows'
$ENV:ScriptRoot = "$ENV:ScriptRepoRoot\$ENV:SystemId"
$ENV:PrivateScriptRoot = "$ENV:ScriptRepoRoot\private\$ENV:SystemId"

# Public folders
$ENV:ScriptUtilRoot = "$ENV:ScriptRoot\util"
$ENV:ScriptUtilShare = "$ENV:ScriptUtilRoot\share"
$ENV:SystemScriptRoot = "$ENV:ScriptRoot\system"
$ENV:AppScriptRoot = "$ENV:ScriptRoot\app"
$ENV:AppScriptShare = "$ENV:AppScriptRoot\share"
$ENV:WorkspaceScriptRoot = "$ENV:ScriptRoot\workspace"
$ENV:WorkspaceScriptShare = "$ENV:ScriptRoot\workspace\share"

# Private folders
$ENV:PrivateScriptUtilRoot = "$ENV:PrivateScriptRoot\util"
$ENV:PrivateScriptUtilShare = "$ENV:PrivateScriptUtilRoot\share"
$ENV:PrivateSystemScriptRoot = "$ENV:PrivateScriptRoot\system"
$ENV:PrivateAppScriptRoot = "$ENV:PrivateScriptRoot\app"
$ENV:PrivateAppScriptShare = "$ENV:PrivateAppScriptRoot\share"
$ENV:PrivateWorkspaceScriptRoot = "$ENV:PrivateScriptRoot\workspace"
$ENV:PrivateWorkspaceScriptShare = "$ENV:PrivateScriptRoot\workspace\share"

# Chocolatey folders
$ENV:ChocolateyRoot = "$ENV:UserLocalApp\chocolatey"
$ENV:ChocolateyToolsRoot = "$ENV:UserLocalApp\chocolateytools"
