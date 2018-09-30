#!/usr/bin/env bash

[ -d $HOME/.solarized ] && rm -rf $HOME/.solarized
git clone https://github.com/karlin/mintty-colors-solarized.git $HOME/.solarized
