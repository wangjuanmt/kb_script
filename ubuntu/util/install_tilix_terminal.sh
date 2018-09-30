#!/usr/bin/env bash

sudo apt-get install -y tilix

# On Ubuntu (16.04 or 16.10), a symlink is probably missing
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

# Other things to note:
# VTE Configuration: https://gnunn1.github.io/tilix-web/manual/vteconfig/
