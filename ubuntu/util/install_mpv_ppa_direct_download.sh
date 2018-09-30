#!/usr/bin/env bash

# Checkout latest packages here: https://launchpad.net/~mc3man/+archive/ubuntu/mpv-tests/+packages

MPV_DEB_SAVE_NAME=mpv_amd64.deb
MPV_DEB_SAVE_PATH=$USER_DOWNLOADS/$MPV_DEB_SAVE_NAME

wget "https://launchpad.net/~mc3man/+archive/ubuntu/mpv-tests/+files/mpv_0.22.0~xenial1_amd64.deb" -O $MPV_DEB_SAVE_PATH
sudo gdebi -n $MPV_DEB_SAVE_PATH
sudo rm -f $MPV_DEB_SAVE_PATH
