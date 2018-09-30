#!/usr/bin/env bash

# https://flight-manual.atom.io/getting-started/sections/installing-atom/#debian-and-ubuntu-debapt
curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
