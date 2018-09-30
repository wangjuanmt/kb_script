#!/usr/bin/env zsh

FZF_INIT_SCRIPT=$HOME/.fzf.zsh

if [[ -f "$FZF_INIT_SCRIPT" ]]; then
    source "$FZF_INIT_SCRIPT"
else
    echo "fzf init script '$FZF_INIT_SCRIPT' does NOT exist."
fi
