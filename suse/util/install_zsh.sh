#!/usr/bin/env bash

sudo zypper -n install zsh

# Change default shell to zsh
sudo chsh -s $(which zsh) $TARGET_USER
