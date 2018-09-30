#!/usr/bin/env bash

# Whether we are using bash on Ubuntu on Windows
RUN_ON_WSL=$1

if [[ $RUN_ON_WSL == "" ]]; then
    RUN_ON_WSL="false"
fi

if [[ $RUN_ON_WSL == "false" ]]; then
    . $SYSTEM_SCRIPT_ROOT/ppa/chrome.sh
fi
