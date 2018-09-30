#!/usr/bin/env bash

# https://github.com/tj/n
# https://github.com/mklement0/n-install

N_INSTALL_BIN_SAVE_PATH="$USER_LOCAL_BIN/n-install"

curl -o $N_INSTALL_BIN_SAVE_PATH -L "https://git.io/n-install"
chmod +x $N_INSTALL_BIN_SAVE_PATH

$N_INSTALL_BIN_SAVE_PATH -n -y -
