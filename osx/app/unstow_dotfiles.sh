#!/usr/bin/env bash

stow -d $APP_SCRIPT_ROOT/dotfiles -t $HOME -D home
stow -d $APP_SCRIPT_SHARE/dotfiles -t $HOME -D home

stow -d $APP_SCRIPT_SHARE/dotfiles -t $HOME/.pip -D pip

stow -d $APP_SCRIPT_SHARE/dotfiles/.config -t $HOME/.config/autostart -D autostart
stow -d $APP_SCRIPT_SHARE/dotfiles/.config -t $HOME/.config/nvim -D nvim
stow -d $APP_SCRIPT_SHARE/dotfiles/.config -t $HOME/.config/terminator -D terminator

stow -d $PRIVATE_APP_SCRIPT_SHARE/dotfiles -t $HOME/.gradle -D gradle

stow -d $APP_SCRIPT_ROOT/dotfiles/.local/share -t $HOME/.local/share/appimagekit -D appimagekit
