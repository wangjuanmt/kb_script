#!/usr/bin/env bash

# https://riot.im/desktop.html

curl -L https://riot.im/packages/debian/repo-key.asc | sudo apt-key add -
sudo sh -c "echo 'deb https://riot.im/packages/debian/ bionic main' > /etc/apt/sources.list.d/matrix-riot-im.list"
