#!/usr/bin/env zsh

ZSH_POWERLINE_INIT_SCRIPT=$HOME/.zsh-powerline.sh

if [[ -f "$ZSH_POWERLINE_INIT_SCRIPT" ]]; then
    source "$ZSH_POWERLINE_INIT_SCRIPT"
else
    echo "zsh-powerline init script '$ZSH_POWERLINE_INIT_SCRIPT' does NOT exist."
fi
