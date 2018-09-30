#!/usr/bin/env bash

MY_HOMEBREW_TAPS_HOME=$USER_ROOM/gitrepo/homebrew_repos
TAP_LINUXBINARY=$MY_HOMEBREW_TAPS_HOME/homebrew-linuxbinary
TAP_APPIMAGE=$MY_HOMEBREW_TAPS_HOME/homebrew-appimage
TAP_GENERICBINARY=$MY_HOMEBREW_TAPS_HOME/homebrew-genericbinary
TAP_OSXBINARY=$MY_HOMEBREW_TAPS_HOME/homebrew-osxbinary
TAP_ATHRUNCASK=$MY_HOMEBREW_TAPS_HOME/homebrew-athruncask

CWD=$(pwd)

echo "----------Pulling $TAP_LINUXBINARY"
cd $TAP_LINUXBINARY
git pull origin master

echo "----------Pulling $TAP_APPIMAGE"
cd $TAP_APPIMAGE
git pull origin master

echo "----------Pulling $TAP_GENERICBINARY"
cd $TAP_GENERICBINARY
git pull origin master

echo "----------Pulling $TAP_OSXBINARY"
cd $TAP_OSXBINARY
git pull origin master

echo "----------Pulling $TAP_ATHRUNCASK"
cd $TAP_ATHRUNCASK
git pull origin master

cd $CWD
