#alias ll="ls -alFh --color=auto"
alias ll="ls -alFh"

alias add_ppa="sudo add-apt-repository -y"
alias remove_ppa="sudo add-apt-repository --remove"

# Customize extension:color mappings
# https://github.com/trapd00r/LS_COLORS
#eval $( dircolors -b $SCRIPT_UTIL_SHARE/LS_COLORS )

# https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark
eval $( dircolors -b $SCRIPT_UTIL_SHARE/dircolors.256dark )

. $SCRIPT_UTIL_ROOT/ubuntu_code_name.sh

# For light theme, replace dark with light.
# This is for WSL.
[[ -s $HOME/.solarized/mintty-solarized-dark.sh ]] && source $HOME/.solarized/mintty-solarized-dark.sh
