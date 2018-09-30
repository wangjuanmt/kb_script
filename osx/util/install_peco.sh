#!/usr/bin/env bash

# https://github.com/peco/peco
brew install peco
#go get github.com/peco/peco/cmd/peco

PECO_CONFIG_SOURCE_DIR=$APP_SCRIPT_ROOT/peco_config
PECO_CONFIG_TARGET_DIR=$HOME/.config/peco

if [ -L "$HOME/.config/peco" ]; then
    rm $HOME/.config/peco
fi

ln -s $PECO_CONFIG_SOURCE_DIR $PECO_CONFIG_TARGET_DIR