#!/usr/bin/env bash

# This file is used in .plist file

USER_HOME=$1

CHROME_CACHE_DIR=$USER_HOME/Library/Caches/Google/Chrome
BROWSER_CACHE_RAMDISK_MNT_DIR=/Volumes/BrowserCache
CHROME_CACHE_RAMDISK_MNT_DIR=$BROWSER_CACHE_RAMDISK_MNT_DIR/chrome

# org.okampfer.ramdisk.plist won't recognize '$SYSTEM_SCRIPT_ROOT'!
$USER_HOME/bedroom/kb/script/osx/system/ramdisk create "BrowserCache" 512

# Remove existing cache folder
rm -rf $CHROME_CACHE_DIR

# Link Chrome cache dir to ramdisk and set correct user & group for it
mkdir $CHROME_CACHE_RAMDISK_MNT_DIR
ln -s $CHROME_CACHE_RAMDISK_MNT_DIR $CHROME_CACHE_DIR
chown -h $TARGET_USER:$TARGET_USER_GROUP $CHROME_CACHE_DIR
