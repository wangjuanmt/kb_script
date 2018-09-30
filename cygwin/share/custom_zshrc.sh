. $SCRIPT_UTIL_SHARE/stow_util_zsh.sh
. $SCRIPT_UTIL_SHARE/custom_shrc_common.sh

alias ll="ls -alFh"

eval $( dircolors -b $SCRIPT_UTIL_SHARE/dircolors.256dark )

if [[ -d "$HOME/.oh-my-zsh" ]] ; then
    . $SCRIPT_UTIL_SHARE/custom_oh_my_zsh.sh
fi

# For light theme, replace dark with light
[[ -s $HOME/.solarized/mintty-solarized-dark.sh ]] && source $HOME/.solarized/mintty-solarized-dark.sh
