#!/usr/bin/env bash

GVM_ROOT=$HOME/.gvm

if [[ -d $GVM_ROOT ]]; then
    echo "gvm already installed to $GVM_ROOT, skip installation."
else
    git clone https://github.com/moovweb/gvm.git $GVM_ROOT
    cp $SCRIPT_UTIL_SHARE/gvm.sh $GVM_ROOT/scripts/gvm
    mkdir -p $GVM_ROOT/archive
    mkdir -p $GVM_ROOT/logs
    mkdir -p $GVM_ROOT/environments
fi
