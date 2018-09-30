#!/usr/bin/env bash

#sudo gdebi -n $SOFT_SETUP_ROOT/office/sublimetext/sublimetext_latest_x64.deb
#sudo gdebi -n $SOFT_SETUP_ROOT/office/sublimetext/sublime-text_build-3083_amd64.deb

SUBLIME_TEXT_DEB_DOWNLOAD_ADDR='https://download.sublimetext.com/sublime-text_build-3103_amd64.deb'
SUBLIME_TEXT_DEB_SAVE_NAME=sublime-text_amd64.deb

# Download .deb and install
cd $USER_DOWNLOADS
wget "$SUBLIME_TEXT_DEB_DOWNLOAD_ADDR" -O $SUBLIME_TEXT_DEB_SAVE_NAME
sudo gdebi -n $SUBLIME_TEXT_DEB_SAVE_NAME

# Cleanup
rm -f $SUBLIME_TEXT_DEB_SAVE_NAME
