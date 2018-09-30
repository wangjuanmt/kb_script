#!/usr/bin/env bash

# NOTE: if you're using LinuxMint, it is highly recommended to install fcitx support from UI!
sudo apt-get install -y fcitx fcitx-config-gtk fcitx-googlepinyin fcitx-module-cloudpinyin #libopencc1 fcitx-libs fcitx-libs-qt fcitx-ui-classic #fcitx-ui-light #fcitx-ui-qimpanel #fcitx-ui-kimpanel

# NOTE: im-switch cannot coexist with language-selector-gnome
#sudo im-switch -s fcitx -z all_ALL
#sudo gdebi -n $SOFT_SETUP_ROOT/ime/sogou/sogoupinyin_latest_x64.deb
