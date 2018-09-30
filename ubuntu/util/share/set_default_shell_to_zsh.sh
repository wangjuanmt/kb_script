#!/usr/bin/env bash

# Change default shell to zsh
#sudo chsh -s $(which zsh) $TARGET_USER
sudo usermod -s $(which zsh) $TARGET_USER
