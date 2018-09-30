<#
    If we're not formatting D drive, we don't have to install the following items.
#>

Write-Output "*****************Start $ENV:ScriptUtilRoot\init_scoop.ps1*****************"
. $ENV:ScriptUtilRoot\init_scoop.ps1
Write-Output "-----------------Done $ENV:ScriptUtilRoot\init_scoop.ps1-----------------"


Write-Output "*****************Start $ENV:ScriptUtilRoot\init_chocolatey.ps1*****************"
. $ENV:ScriptUtilRoot\init_chocolatey.ps1
Write-Output "-----------------Done $ENV:ScriptUtilRoot\init_chocolatey.ps1-----------------"


Write-Output "*****************Start $ENV:ScriptUtilRoot\install_git.ps1*****************"
. $ENV:ScriptUtilRoot\install_git.ps1
Write-Output "-----------------Done $ENV:ScriptUtilRoot\install_git.ps1-----------------"


Write-Output "*****************Start $ENV:ScriptUtilRoot\install_web_browsers.ps1*****************"
. $ENV:ScriptUtilRoot\install_web_browsers.ps1
Write-Output "-----------------Done $ENV:ScriptUtilRoot\install_web_browsers.ps1-----------------"


Write-Output "*****************Start $ENV:ScriptUtilRoot\install_editors.ps1*****************"
. $ENV:ScriptUtilRoot\install_editors.ps1
Write-Output "-----------------Done $ENV:ScriptUtilRoot\install_editors.ps1-----------------"


Write-Output "*****************Start $ENV:ScriptUtilRoot\install_multi_media.ps1*****************"
. $ENV:ScriptUtilRoot\install_multi_media.ps1
Write-Output "-----------------Done $ENV:ScriptUtilRoot\install_multi_media.ps1-----------------"


Write-Output "*****************Start $ENV:ScriptUtilRoot\install_utils.ps1*****************"
. $ENV:ScriptUtilRoot\install_utils.ps1
Write-Output "-----------------Done $ENV:ScriptUtilRoot\install_utils.ps1-----------------"
