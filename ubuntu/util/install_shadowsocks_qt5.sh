#!/usr/bin/env bash

# shadowsocks-qt5
sudo apt-get install -y shadowsocks-qt5

# Make ss-qt5 auto startup
cp -f /usr/share/applications/shadowsocks-qt5.desktop $HOME/.config/autostart/shadowsocks-qt5.desktop