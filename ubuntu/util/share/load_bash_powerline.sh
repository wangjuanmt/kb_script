#!/usr/bin/env bash

BASH_POWERLINE_INIT_SCRIPT=$HOME/.bash-powerline.sh

if [[ -f "$BASH_POWERLINE_INIT_SCRIPT" ]]; then
    source "$BASH_POWERLINE_INIT_SCRIPT"
else
    echo "bash-powerline init script '$BASH_POWERLINE_INIT_SCRIPT' does NOT exist."
fi
