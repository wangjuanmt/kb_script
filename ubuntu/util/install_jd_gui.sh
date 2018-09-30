#!/usr/bin/env bash

# https://github.com/java-decompiler/jd-gui

cd $USER_DOWNLOADS
wget "https://github.com/java-decompiler/jd-gui/releases/download/v1.4.0/jd-gui_1.4.0-0_all.deb"
sudo gdebi -n ./jd-gui_1.4.0-0_all.deb
