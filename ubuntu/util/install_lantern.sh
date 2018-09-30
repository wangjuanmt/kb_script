#!/usr/bin/env bash

# https://github.com/getlantern/forum
# https://github.com/getlantern/forum/issues/833
# https://github.com/getlantern/lantern-binaries

cd $USER_DOWNLOADS
wget "https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-beta-64-bit.deb"
sudo gdebi -n ./lantern-installer-beta-64-bit.deb
