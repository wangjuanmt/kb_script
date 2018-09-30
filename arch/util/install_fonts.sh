#!/usr/bin/env bash

. $SCRIPT_UTIL_ROOT/install_ubuntu_font_patch.sh

sudo pacman -S --noconfirm --needed ttf-dejavu wqy-microhei adobe-source-code-pro-fonts
