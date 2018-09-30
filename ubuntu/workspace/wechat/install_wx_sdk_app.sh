#!/usr/bin/env bash

WX_MACOS_SDK_APP_SAVE_NAME=$USER_DOWNLOADS/wechat_devtools.dmg
WX_MACOS_SDK_APP_MOUNT_PATH=$USER_LOCAL/tmp/wechat_devtools

curl -L -o $WX_MACOS_SDK_APP_SAVE_NAME "https://servicewechat.com/wxa-dev-logic/download_redirect?type=darwin&from=mpwiki"
cd $USER_DOWNLOADS

# The dmg image is actually a "zlib compressed data" according to "file $WX_MACOS_SDK_APP_SAVE_NAME"
7z x $WX_MACOS_SDK_APP_SAVE_NAME -owechat_devtools/

# Rename actual image file which has Chinese characters
ACTUAL_DISK_IMAGE_SAVE_NAME="diskimage"
ls | grep '.*disk image.*' | while read x; do mv "$x" "$ACTUAL_DISK_IMAGE_SAVE_NAME"; done

# Mount the image
mkdir -p $WX_MACOS_SDK_APP_MOUNT_PATH
sudo mount -o loop -t hfsplus $ACTUAL_DISK_IMAGE_SAVE_NAME $WX_MACOS_SDK_APP_MOUNT_PATH

# Copy the actual sdk app folder to its final save location
WX_MACOS_SDK_APP_FINAL_SVAE_PATH=$USER_LOCAL_APP/wechat_devtools
cp -r $WX_MACOS_SDK_APP_MOUNT_PATH/wechatwebdevtools.app/Contents/Resources/app.nw $WX_MACOS_SDK_APP_FINAL_SVAE_PATH

sudo umount $WX_MACOS_SDK_APP_MOUNT_PATH
