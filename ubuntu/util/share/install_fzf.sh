#!/usr/bin/env bash

# https://github.com/junegunn/fzf

#brew install fzf

FZF_INSTALL_DIR=$HOME/.fzf

if ! [[ -d "$FZF_INSTALL_DIR" ]]; then
    git clone https://github.com/junegunn/fzf.git $FZF_INSTALL_DIR
    $FZF_INSTALL_DIR/install
else
    . $SCRIPT_UTIL_SHARE/upgrade_fzf.sh
fi
