#!/usr/bin/env bash

echo "*****************Start $HOME/bedroom/kb/script/msys/util/env_vars.sh*****************"
. $HOME/bedroom/kb/script/msys/util/env_vars.sh
echo "-----------------Done $HOME/bedroom/kb/script/msys/util/env_vars.sh-----------------"


echo "*****************Start $SHARE_ROOT/init_etc_passwd.sh*****************"
. $SHARE_ROOT/init_etc_passwd.sh
echo "-----------------Done $SHARE_ROOT/init_etc_passwd.sh-----------------"


echo "*****************Start $SCRIPT_UTIL_SHARE/install_mintty_colors_solarized.sh*****************"
. $SCRIPT_UTIL_SHARE/install_mintty_colors_solarized.sh
echo "-----------------Done $SCRIPT_UTIL_SHARE/install_mintty_colors_solarized.sh-----------------"


echo "*****************Start $SYSTEM_SCRIPT_ROOT/update_software_source_mirror.sh*****************"
. $SYSTEM_SCRIPT_ROOT/update_software_source_mirror.sh
echo "-----------------Done $SYSTEM_SCRIPT_ROOT/update_software_source_mirror.sh-----------------"


echo "*****************Start pacman -Sy*****************"
pacman -Sy
echo "-----------------Done pacman -Sy-----------------"


echo "*****************Start $SCRIPT_UTIL_ROOT/install_common_soft.sh*****************"
. $SCRIPT_UTIL_ROOT/install_common_soft.sh
echo "-----------------Done $SCRIPT_UTIL_ROOT/install_common_soft.sh-----------------"


echo "*****************Start $SCRIPT_UTIL_SHARE/init_shells.sh*****************"
. $SCRIPT_UTIL_SHARE/init_shells.sh
echo "-----------------Done $SCRIPT_UTIL_SHARE/init_shells.sh-----------------"

