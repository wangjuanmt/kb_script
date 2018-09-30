#!/usr/bin/env bash

NVM_INIT_SCRIPT_PATH=$NVM_DIR/nvm.sh

if [[ -s "$NVM_INIT_SCRIPT_PATH" ]]; then
    source "$NVM_INIT_SCRIPT_PATH"
else
    echo "nvm init script '$NVM_INIT_SCRIPT_PATH' does NOT exist."
fi
