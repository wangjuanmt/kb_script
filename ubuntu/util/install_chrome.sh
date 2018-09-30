#!/usr/bin/env bash

# Install by downloading a deb package (deprecated)
#cd $USER_DOWNLOADS
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#chown $TARGET_USER:$TARGET_USER_GROUP google-chrome-stable_current_amd64.deb
#sudo gdebi -n google-chrome-stable_current_amd64.deb
#rm -f google-chrome-stable_current_amd64.deb

# Install from PPA
sudo apt-get install -y google-chrome-stable
