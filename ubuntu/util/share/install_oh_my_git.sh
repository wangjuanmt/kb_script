#!/usr/bin/env zsh

. $SCRIPT_UTIL_SHARE/antigen.zsh

# Install highlighting plugin
antigen bundle zsh-users/zsh-syntax-highlighting

# Install oh-my-git plugin
# https://github.com/arialdomartini/oh-my-git
antigen-use oh-my-zsh
antigen-bundle arialdomartini/oh-my-git
antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

antigen-apply
