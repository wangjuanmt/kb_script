#!/usr/bin/env bash

# Macvim also come with a binary Vim bundled.
brew cask install macvim

# Link vim of macvim to take precedence over any other vim
ln -s /Applications/MacVim.app/Contents/MacOS/Vim $HOME/local/bin/vim
