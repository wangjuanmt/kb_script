#!/usr/bin/env bash

# Reference: Cygwin + Oh-my-zsh + Solarized Theme + apt-cyg on Windows 10
# http://www.adhikary.net/post/cygwin-zsh-solarized-apt-cyg/

# Initially cygwin is setting $HOME to wrong location, so use "/home/$USER" here.
echo "*****************Start /home/$USER/bedroom/script/cygwin/util/env_vars.sh*****************"
. /home/$USER/bedroom/script/cygwin/util/env_vars.sh
echo "-----------------Done /home/$USER/bedroom/script/cygwin/util/env_vars.sh-----------------"


echo "*****************Start $SHARE_ROOT/init_etc_passwd.sh*****************"
. $SHARE_ROOT/init_etc_passwd.sh
echo "-----------------Done $SHARE_ROOT/init_etc_passwd.sh-----------------"


echo "*****************Start $SCRIPT_UTIL_SHARE/install_mintty_colors_solarized.sh*****************"
. $SCRIPT_UTIL_SHARE/install_mintty_colors_solarized.sh
echo "-----------------Done $SCRIPT_UTIL_SHARE/install_mintty_colors_solarized.sh-----------------"


echo "*****************Start $SCRIPT_UTIL_ROOT/install_apt_cyg.sh*****************"
. $SCRIPT_UTIL_ROOT/install_apt_cyg.sh
echo "-----------------Done $SCRIPT_UTIL_ROOT/install_apt_cyg.sh-----------------"


echo "*****************Start $SCRIPT_UTIL_SHARE/init_shells.sh*****************"
. $SCRIPT_UTIL_SHARE/init_shells.sh
echo "-----------------Done $SCRIPT_UTIL_SHARE/init_shells.sh-----------------"
