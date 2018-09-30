#!/usr/bin/env bash

# This is still not the right/complete way to install ppapi flash for chrome & chromium.
# As for chrome, need to take care of file latest-component-updated-flash.

echo "This script is not ready!"
exit 1

FLASH_VERSION=26.0.0.131
TARBALL_SAVE_NAME=flash_player_ppapi_linux.$FLASH_VERSION.x86_64.tar.gz
TARGET_FOLDER_CHROME=$HOME/.config/google-chrome/PepperFlash/$FLASH_VERSION

curl -L -o $USER_DOWNLOADS/$TARBALL_SAVE_NAME https://fpdownload.adobe.com/pub/flashplayer/pdc/$FLASH_VERSION/flash_player_ppapi_linux.x86_64.tar.gz

mkdir -p $TARGET_FOLDER_CHROME
tar xzf $USER_DOWNLOADS/$TARBALL_SAVE_NAME -C $TARGET_FOLDER_CHROME
