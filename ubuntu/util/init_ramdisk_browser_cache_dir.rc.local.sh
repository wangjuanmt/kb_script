#!/usr/bin/env bash

# To make this script auto executed when startup,
# add the following line to /etc/rc.local
#sudo bash /home/athrun/bedroom/script/ubuntu/util/init_ramdisk_browser_cache_dir.rc.local.sh

TARGET_USER=athrun
USER_HOME=/home/$TARGET_USER
CHROME_CACHE_DIR=$USER_HOME/.cache/google-chrome
CHROMIUM_CACHE_DIR=$USER_HOME/.cache/chromium
BROWSER_CACHE_RAMDISK_MNT_DIR=/media/BrowserCache
CHROME_CACHE_RAMDISK_MNT_DIR=$BROWSER_CACHE_RAMDISK_MNT_DIR/chrome
CHROMIUM_CACHE_RAMDISK_MNT_DIR=$BROWSER_CACHE_RAMDISK_MNT_DIR/chromium

# Remove existing cache folder
rm -rf $CHROME_CACHE_DIR
rm -rf $CHROMIUM_CACHE_DIR

# Create a folder for chrome cache and create link
mkdir $CHROME_CACHE_RAMDISK_MNT_DIR
ln -s $CHROME_CACHE_RAMDISK_MNT_DIR $CHROME_CACHE_DIR
chown -R $TARGET_USER:$TARGET_USER $CHROME_CACHE_RAMDISK_MNT_DIR
chown $TARGET_USER:$TARGET_USER $CHROME_CACHE_DIR

# Create a folder for chromium cache and create link
mkdir $CHROMIUM_CACHE_RAMDISK_MNT_DIR
ln -s $CHROMIUM_CACHE_RAMDISK_MNT_DIR $CHROMIUM_CACHE_DIR
chown -R $TARGET_USER:$TARGET_USER $CHROMIUM_CACHE_RAMDISK_MNT_DIR
chown $TARGET_USER:$TARGET_USER $CHROMIUM_CACHE_DIR
