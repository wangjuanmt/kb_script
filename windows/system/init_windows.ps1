<#
    Mainly install softwares for now.
    
    Things we have to do after initialization:
    1. 关闭休眠
    2. 调整电源选项，关闭网卡的节能选项
    3. 调整虚拟内存
    4. 安装7zip和WinRAR
#>

Write-Output "*****************Start D:\bedroom\kb\script\windows\util\env_vars.ps1*****************"
& "D:\bedroom\kb\script\windows\util\env_vars.ps1"
Write-Output "-----------------Done D:\bedroom\kb\script\windows\util\env_vars.ps1-----------------"


Write-Output "*****************Start $ENV:SystemScriptRoot\link_profile.ps1*****************"
. $ENV:SystemScriptRoot\link_profile.ps1
Write-Output "-----------------Done $ENV:SystemScriptRoot\link_profile.ps1-----------------"


Write-Output "*****************Start $ENV:AppScriptRoot\link_firefox_appdata.ps1*****************"
. $ENV:AppScriptRoot\link_firefox_appdata.ps1
Write-Output "-----------------Done $ENV:AppScriptRoot\link_firefox_appdata.ps1-----------------"


Write-Output "*****************Start $ENV:AppScriptRoot\link_chrome_profile.ps1*****************"
. $ENV:AppScriptRoot\link_chrome_profile.ps1
Write-Output "-----------------Done $ENV:AppScriptRoot\link_chrome_profile.ps1-----------------"


Write-Output "*****************Start $ENV:AppScriptRoot\link_centbrowser_profile.ps1*****************"
. $ENV:AppScriptRoot\link_centbrowser_profile.ps1
Write-Output "-----------------Done $ENV:AppScriptRoot\link_centbrowser_profile.ps1-----------------"


Write-Output "*****************Start $ENV:ScriptUtilRoot\install_console_tools.ps1*****************"
. $ENV:ScriptUtilRoot\install_console_tools.ps1
Write-Output "-----------------Done $ENV:ScriptUtilRoot\install_console_tools.ps1-----------------"
