#!/usr/bin/env bash

GVM_INIT_SCRIPT_PATH=$GVM_ROOT/scripts/gvm

if [[ -s "$GVM_INIT_SCRIPT_PATH" ]]; then
    source "$GVM_INIT_SCRIPT_PATH"
else
    echo "gvm init script '$GVM_INIT_SCRIPT_PATH' does NOT exist."
fi
