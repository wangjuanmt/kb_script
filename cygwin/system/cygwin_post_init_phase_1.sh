#!/usr/bin/env bash

echo "*****************Start /home/$USER/bedroom/kb/script/cygwin/util/env_vars.sh*****************"
. /home/$USER/bedroom/kb/script/cygwin/util/env_vars.sh
echo "-----------------Done /home/$USER/bedroom/kb/script/cygwin/util/env_vars.sh-----------------"


echo "*****************Start $SHARE_ROOT/custom_profile.sh*****************"
. $SHARE_ROOT/custom_profile.sh
echo "-----------------Done $SHARE_ROOT/custom_profile.sh-----------------"


echo "*****************Start $SHARE_ROOT/custom_bashrc.sh*****************"
. $SHARE_ROOT/custom_bashrc.sh
echo "-----------------Done $SHARE_ROOT/custom_bashrc.sh-----------------"


echo "*****************Start $SCRIPT_UTIL_SHARE/stow_util_bash.sh*****************"
. $SCRIPT_UTIL_SHARE/stow_util_bash.sh
echo "-----------------Done $SCRIPT_UTIL_SHARE/stow_util_bash.sh-----------------"


echo "*****************Start stow shared home*****************"
stow_util $HOME $APP_SCRIPT_SHARE/dotfiles home
echo "-----------------Done stow shared home-----------------"


# Put home dotfiles in $APP_SCRIPT_ROOT/dotfiles behind to override those in $APP_SCRIPT_SHARE/dotfiles
echo "*****************Start stow home*****************"
stow_util $HOME $APP_SCRIPT_ROOT/dotfiles home
echo "-----------------Done stow home-----------------"


echo "*****************Start stow .pip*****************"
stow_util $HOME/.pip $APP_SCRIPT_SHARE/dotfiles pip
echo "-----------------Done stow .pip-----------------"


echo "Done! Now logout and login again."
