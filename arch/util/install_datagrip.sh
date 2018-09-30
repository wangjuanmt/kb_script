#!/usr/bin/env bash

REPO=https://aur.archlinux.org/datagrip.git
TARGET_DIR=$USER_LOCAL_AUR/datagrip

if [[ ! -d "$TARGET_DIR" ]]; then
    mkdir -p $TARGET_DIR
    git clone $REPO $TARGET_DIR
fi

cd $TARGET_DIR
makepkg -sri
