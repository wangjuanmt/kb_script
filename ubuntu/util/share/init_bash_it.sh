#!/usr/bin/env bash

BASH_IT_HOME_DIR=$HOME/.bash_it

if ! [[ -d "$BASH_IT_HOME_DIR" ]] ; then
    git clone https://github.com/Bash-it/bash-it.git $BASH_IT_HOME_DIR
    chown -R $TARGET_USER:$TARGET_USER_GROUP $BASH_IT_HOME_DIR
fi
