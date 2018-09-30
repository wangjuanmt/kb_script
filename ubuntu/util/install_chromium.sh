#!/usr/bin/env bash

# chromium & pepper-flash
# https://wiki.ubuntu.com/Chromium/Getting-Flash
# As of 2015-05, the old "pepperflashplugin-nonfree" is deprecated in favor of an 
# official, maintained, one-step package called adobe-flashplugin, 
# which works for Firefox and Chromium and derivatives.
# Add the Canonical Partners software source, and install "adobe-flashplugin".
sudo apt-get install -y chromium-browser chromium-browser-l10n #pepperflashplugin-nonfree

# To purge chromium properly
#sudo apt-get purge -y chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg chromium-codecs-ffmpeg-extra
