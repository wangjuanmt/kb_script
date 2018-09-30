#!/usr/bin/env bash

source $SCRIPT_UTIL_SHARE/stow_util_bash.sh

stow_util $HOME $APP_SCRIPT_ROOT/dotfiles home
stow_util $HOME $APP_SCRIPT_SHARE/dotfiles home

stow_util $HOME/.pip $APP_SCRIPT_SHARE/dotfiles pip

stow_util $HOME/.config/nvim $APP_SCRIPT_SHARE/dotfiles/.config nvim
stow_util $HOME/.config/kitty $APP_SCRIPT_SHARE/dotfiles/.config kitty
stow_util $HOME/.config/BaiduPCS-Go $APP_SCRIPT_SHARE/dotfiles/.config BaiduPCS-Go

stow_util $HOME/.gradle $PRIVATE_APP_SCRIPT_SHARE/dotfiles gradle

stow_util $HOME/.dbdeployer $APP_SCRIPT_SHARE/dotfiles dbdeployer

# By default $OMF_CONFIG is $HOME/.config/omf
stow_util $HOME/.config/omf $APP_SCRIPT_SHARE/dotfiles/.config omf
