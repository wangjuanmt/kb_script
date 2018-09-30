#!/usr/bin/env bash

# https://wiki.archlinux.org/index.php/Systemd_FAQ#How_can_I_make_a_script_start_during_the_boot_process.3F
# To make this script auto executed when startup:
# Copy $SCRIPT_UTIL_ROOT/init_ramdisk_browser_cache_dir.service into $HOME/.config/systemd/user/:
#mkdir -p $HOME/.config/systemd/user
#cd $HOME/.config/systemd/user
#cp $HOME/bedroom/kb/script/arch/util/init_ramdisk_browser_cache_dir.service init_ramdisk_browser_cache_dir.service
# And then:
#systemctl --user enable init_ramdisk_browser_cache_dir.service

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
