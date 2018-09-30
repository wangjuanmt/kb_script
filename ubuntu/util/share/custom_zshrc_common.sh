#!/usr/bin/env zsh

. $SCRIPT_UTIL_SHARE/stow_util_zsh.sh
. $SCRIPT_UTIL_SHARE/custom_shrc_common.sh

. $SCRIPT_UTIL_SHARE/load_oh_my_zsh.sh

. $SCRIPT_UTIL_SHARE/load_fzf_zsh.sh

#. $SCRIPT_UTIL_SHARE/load_zsh_powerline.sh

# This will provide functions for us to call when necessary,
# instead of loading xenv (pyenv, rbenv, etc.) immediately.
. $SCRIPT_UTIL_SHARE/xenv_functions_zsh.sh

# Load pyenv
load_pyenv

# Load rbenv
load_rbenv

# Load nodenv
#load_nodenv

# Load goenv
#load_goenv

# Load jenv
#load_jenv
