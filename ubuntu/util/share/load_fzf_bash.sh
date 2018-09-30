#!/usr/bin/env bash

FZF_INIT_SCRIPT=$HOME/.fzf.bash

if [[ -f "$FZF_INIT_SCRIPT" ]]; then
    source "$FZF_INIT_SCRIPT"
else
    echo "fzf init script '$FZF_INIT_SCRIPT' does NOT exist."
fi
