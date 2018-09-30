#!/usr/bin/env bash

#gdebi -n $SOFT_SETUP_ROOT/office/atom/atom_latest_x64.deb
ATOM_VERSION='1.3.2'
cd $USER_DOWNLOADS
wget "http://npm.taobao.org/mirrors/atom/$ATOM_VERSION/atom-amd64.deb"
chown $TARGET_USER:$TARGET_USER_GROUP atom-amd64.deb
sudo gdebi -n atom-amd64.deb
rm -f atom-amd64.deb
