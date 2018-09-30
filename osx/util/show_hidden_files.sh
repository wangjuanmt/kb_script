#!/usr/bin/env bash

# Mac stores preferences either in /Library/Preferences/ or $HOME/Library/Preferences/
# We can use "defaults read <domain>" to read those preferences
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES
