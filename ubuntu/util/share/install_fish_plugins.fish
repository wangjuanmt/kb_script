#!/usr/bin/env fish

# https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#plain
omf install plain

# https://github.com/fisherman/z
fisher z
# z plugin for fish shell prior to version 2.7
#fisher z@pre27

# https://github.com/fisherman/pyenv
# After installation, there will be a function 'pyenv' available
#fisher pyenv

# https://github.com/fisherman/rbenv
# After installation, there will be a function 'rbenv' available
#fisher rbenv

# https://github.com/fisherman/nodenv
# After installation, there will be a function 'nodenv' available
#fisher nodenv

# https://github.com/maman/plugin-gvm
# After installation, there will be a function 'gvm' available
# As of 2018-8-9, this script has a problem - it will insert gvm paths at the beginning of PATH every time we call "gvm".
#fisher maman/plugin-gvm

# https://github.com/scorphus/plugin-go-gvm
# After installation, there will be a function 'gvm' available
#omf install go-gvm

# https://github.com/edc/bass - Make Bash utilities usable in Fish shell
fisher edc/bass

# https://github.com/fishgretel/pkg-fzf
#omf install fzf
# Usage
# Fuzzily change directory:
# $ fcd
# Fuzzily browse command history and return selection:
# $ fh
# Fuzzily browse file listings and return selection"
# $ fls

# https://github.com/fisherman/fzf
fisher fzf
