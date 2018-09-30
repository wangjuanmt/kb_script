#!/usr/bin/env bash

# As for chromium, the correct way is here: https://askubuntu.com/a/799845/95700

echo "Use pepper flash from linuxbrew instead."
exit 1

FLASH_VERSION=26.0.0.137
TARBALL_SAVE_NAME=flash_player_ppapi_linux.$FLASH_VERSION.x86_64.tar.gz
TARGET_FOLDER_CHROMIUM=$HOME/.config/chromium/PepperFlash/$FLASH_VERSION

curl -L -o $USER_DOWNLOADS/$TARBALL_SAVE_NAME https://fpdownload.adobe.com/pub/flashplayer/pdc/$FLASH_VERSION/flash_player_ppapi_linux.x86_64.tar.gz

mkdir -p $TARGET_FOLDER_CHROMIUM
tar xzf $USER_DOWNLOADS/$TARBALL_SAVE_NAME -C $TARGET_FOLDER_CHROMIUM
