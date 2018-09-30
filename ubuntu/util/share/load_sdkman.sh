#!/usr/bin/env bash

SDKMAN_INIT_SCRIPT_PATH=$SDKMAN_HOME/bin/sdkman-init.sh

if [[ -s "$SDKMAN_INIT_SCRIPT_PATH" ]]; then
    source "$SDKMAN_INIT_SCRIPT_PATH"
else
    echo "sdkman init script '$SDKMAN_INIT_SCRIPT_PATH' does NOT exist."
fi
