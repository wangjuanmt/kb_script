#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


. $SCRIPT_UTIL_ROOT/custom_bashrc.sh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
