Import-Module posh-git
#Import-Module oh-my-posh
#Set-Theme Honukai

# Change charset to unicode
chcp.com 65001

Set-PSReadlineOption -ResetTokenColors

# Set the default encoding for all cmdlets that support an -Encoding parameter (which in PSv5.1+ includes > and >>)
$PSDefaultParameterValues['*:Encoding'] = 'utf8'

. "D:\bedroom\kb\script\windows\util\env_vars.ps1"

function New-Link($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

function Remove-Dir($path) {
    Get-ChildItem -Path "$path\*" -Recurse -Force | Remove-Item
    Remove-Item -Path $path -Force
}

function Test-ReparsePoint([string]$path) {
    $file = Get-Item $path -Force -ea SilentlyContinue
    return [bool]($file.Attributes -band [IO.FileAttributes]::ReparsePoint)
}

# https://stackoverflow.com/questions/7052765/powershell-changing-the-culture-of-current-session
function Set-Culture([System.Globalization.CultureInfo] $culture) {
    [System.Threading.Thread]::CurrentThread.CurrentUICulture = $culture
    [System.Threading.Thread]::CurrentThread.CurrentCulture = $culture
}

Set-Culture en-US

#Set-Alias vim nvim

#$EverythingProgramRoot = "$ENV:ProgramFiles\Everything"
#$VSCodeProgramRoot = "$ENV:ProgramFiles\Microsoft VS Code"
#$SublimeText3ProgramRoot = "$ENV:ProgramFiles\Sublime Text 3"
#$IrfanViewProgramRoot = "$ENV:ProgramFiles\IrfanView"
#$NeovimProgramRoot = "$ENV:ChocolateyToolsRoot\neovim\Neovim"
#$NodeJsProgramRoot = "$ENV:ProgramFiles\nodejs"

#if (Test-Path "${ENV:ProgramFiles(x86)}\Yarn") {
#  $YarnProgramRoot = "${ENV:ProgramFiles(x86)}\Yarn"
#} else {
#  $YarnProgramRoot = "$ENV:ProgramFiles\Yarn"
#}

$ENV:SCOOP = "$ENV:UserLocalApp\scoop"

$DotFilesPath = "$ENV:AppScriptRoot\dotfiles"

#$ENV:PATH = "$EverythingProgramRoot;" + $ENV:PATH
#$ENV:PATH = "$VSCodeProgramRoot\bin;" + $ENV:PATH
#$ENV:PATH = "$SublimeText3ProgramRoot;" + $ENV:PATH
#$ENV:PATH = "$IrfanViewProgramRoot;" + $ENV:PATH
#$ENV:PATH = "$NeovimProgramRoot\bin;" + $ENV:PATH
#$ENV:PATH = "$NodeJsProgramRoot;" + $ENV:PATH
#$ENV:PATH = "$YarnProgramRoot\bin;" + $ENV:PATH
$ENV:PATH = "$ENV:PrivateWorkspaceScriptShare;" + $ENV:PATH
$ENV:PATH = "$ENV:PrivateWorkspaceScriptRoot;" + $ENV:PATH
$ENV:PATH = "$ENV:PrivateAppScriptShare;" + $ENV:PATH
$ENV:PATH = "$ENV:PrivateAppScriptRoot;" + $ENV:PATH
$ENV:PATH = "$ENV:WorkspaceScriptShare;" + $ENV:PATH
$ENV:PATH = "$ENV:WorkspaceScriptRoot;" + $ENV:PATH
$ENV:PATH = "$ENV:AppScriptShare;" + $ENV:PATH
$ENV:PATH = "$ENV:AppScriptRoot;" + $ENV:PATH
$ENV:PATH = "$ENV:SCOOP\shims;" + $ENV:PATH
