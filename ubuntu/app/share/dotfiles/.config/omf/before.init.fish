#!/usr/bin/env fish

# Remove greeting message
set fish_greeting

eval (dircolors -c $SCRIPT_UTIL_SHARE/dircolors.256dark)

# Use neovim whenever possible, and set it as default EDITOR
# if type -q nvim
#     set -gx EDITOR nvim
# else
#     echo "Neovim command 'nvim' NOT found, will falback to use 'vim' as EDITOR."
#     set -gx EDITOR vim
# end
set -gx EDITOR vim

set -gx PYTHON_3_LATEST_STABLE_VERSION 3.6.6
set -gx PYTHON_2_LATEST_STABLE_VERSION 2.7.15
set -gx RUBY_2_LATEST_STABLE_VERSION 2.5.1
set -gx GOLANG_LATEST_STABLE_VERSION 1.10.3

set -gx PATH "$HOME/.fzf/bin" $PATH
