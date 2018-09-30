# Unfortunately Windows won't recognize linked shortcuts...

& "D:\bedroom\kb\script\windows\util\env_vars.ps1"

$ScoopShortcutPath = "$ENV:APPDATA\Microsoft\Windows\Start Menu\Programs\Scoop Apps"
$ScoopShortcutParentPath = Split-Path "$ScoopShortcutPath"

if (-Not (Test-Path -Path $ScoopShortcutParentPath)) {
    New-Item -Path $ScoopShortcutParentPath -ItemType "directory"
}

New-Link "$ENV:UserLocalApp\scoop_shortcut" $ScoopShortcutPath
