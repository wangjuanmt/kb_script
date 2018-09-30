#!/usr/bin/env bash

. $SCRIPT_UTIL_ROOT/install_term_tools.sh

. $SCRIPT_UTIL_ROOT/install_zip_tools.sh

. $SCRIPT_UTIL_ROOT/install_convmv.sh

. $SCRIPT_UTIL_ROOT/install_disk_tools.sh

. $SCRIPT_UTIL_ROOT/install_ncdu.sh

. $SCRIPT_UTIL_ROOT/install_stow.sh

# This is moved to "install_util_before_hand.sh"
#. $SCRIPT_UTIL_ROOT/install_ack.sh

. $SCRIPT_UTIL_ROOT/install_ag.sh

#. $SCRIPT_UTIL_ROOT/install_mosh.sh

. $SCRIPT_UTIL_SHARE/install_icdiff.sh

. $SCRIPT_UTIL_ROOT/install_tig.sh

#. $SCRIPT_UTIL_ROOT/install_cloc.sh

. $SCRIPT_UTIL_ROOT/install_htop.sh

# Used by neovim
. $SCRIPT_UTIL_ROOT/install_xclip.sh
