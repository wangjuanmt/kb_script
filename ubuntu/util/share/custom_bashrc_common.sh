#!/usr/bin/env bash

. $SCRIPT_UTIL_SHARE/stow_util_bash.sh
. $SCRIPT_UTIL_SHARE/custom_shrc_common.sh

. $SCRIPT_UTIL_SHARE/load_bash_it.sh

. $SCRIPT_UTIL_SHARE/load_fzf_bash.sh

#. $SCRIPT_UTIL_SHARE/load_bash_powerline.sh

# This will provide functions for us to call when necessary,
# instead of loading xenv (pyenv, rbenv, etc.) immediately.
. $SCRIPT_UTIL_SHARE/xenv_functions_bash.sh

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
