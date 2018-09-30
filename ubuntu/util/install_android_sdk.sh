#!/usr/bin/env bash

DOWNLOAD_URL="http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz"
INSTALL_TARGET=$USER_LOCAL_APP/androidsdk

cd $USER_DOWNLOADS
wget $DOWNLOAD_URL
tar xf android-sdk_r24.4.1-linux.tgz
mv android-sdk-linux $INSTALL_TARGET
