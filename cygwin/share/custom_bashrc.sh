. $SCRIPT_UTIL_SHARE/stow_util_bash.sh
. $SCRIPT_UTIL_SHARE/custom_shrc_common.sh

# Customize prompt colors
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [[ -d "$HOME/.bash_it" ]] ; then
    . $SCRIPT_UTIL_SHARE/custom_bash_it.sh
else
    export PS1="\[\033[01;35m\]\u@\h:\[\033[01;34m\]\$(parse_git_branch) \[\033[01;32m\]\w \[\033[01;34m\]\n\$ \[\e[0m\]"
fi

[ -f ~/.bash-powerline.sh ] && source ~/.bash-powerline.sh

alias ll="ls -alFh"

eval $( dircolors -b $SCRIPT_UTIL_SHARE/dircolors.256dark )

# For light theme, replace dark with light
[[ -s $HOME/.solarized/mintty-solarized-dark.sh ]] && source $HOME/.solarized/mintty-solarized-dark.sh
