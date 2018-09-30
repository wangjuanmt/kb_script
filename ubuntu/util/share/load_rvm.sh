#!/usr/bin/env bash

RVM_INIT_SCRIPT_PATH=$RVM_HOME/scripts/rvm

if [[ -s "$RVM_INIT_SCRIPT_PATH" ]]; then
    source "$RVM_INIT_SCRIPT_PATH"
else
    echo "rvm init script '$RVM_INIT_SCRIPT_PATH' does NOT exist."
fi
