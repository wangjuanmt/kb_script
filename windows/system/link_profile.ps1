& "D:\bedroom\kb\script\windows\util\env_vars.ps1"

$ProfileAllHostsFolder = Split-Path "$ENV:ProfileAllHosts"

if (-Not (Test-Path -Path $ProfileAllHostsFolder)) {
    New-Item -Path $ProfileAllHostsFolder -ItemType "directory"
}

if (Test-Path -Path "$ENV:ProfileAllHosts") {
    Rename-Item -Path "$ENV:ProfileAllHosts" -NewName "$ENV:ProfileAllHosts.origin"
}

New-Item -Path "$ENV:ProfileAllHosts" -ItemType SymbolicLink -Value "$ENV:ScriptUtilRoot\custom_profile.ps1"
