#!/usr/bin/env bash

LINUXBREW_HOME_PREFIX=/home/linuxbrew

if ! [[ -d "$LINUXBREW_HOME_PREFIX" ]]; then
    sudo mkdir -p $LINUXBREW_HOME_PREFIX
fi

sudo chown -R $TARGET_USER:$TARGET_USER_GROUP $LINUXBREW_HOME_PREFIX
