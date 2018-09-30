#!/usr/bin/env bash

# https://github.com/facebook/pathpicker/

#brew install fpp

FPP_INSTALL_DIR=$HOME/.fpp

if ! [[ -d "$FPP_INSTALL_DIR" ]]; then
    git clone https://github.com/facebook/PathPicker.git $FPP_INSTALL_DIR
fi
