#!/usr/bin/env bash

# Add software source for Google Chrome browser

# NOTE IP of dl-ssl.google.com is in the US which is blocked by GFW
#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
