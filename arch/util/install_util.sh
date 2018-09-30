#!/usr/bin/env bash

# Run "sudo updatedb" to update searching database
sudo pacman -S --noconfirm --needed mlocate

. $SCRIPT_UTIL_ROOT/install_stow.sh
