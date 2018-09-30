#!/usr/bin/env bash

OH_MY_GIT_HOME_DIR=$HOME/.oh-my-git

if [ -d "$OH_MY_GIT_HOME_DIR" ]; then
    rm -rf $OH_MY_GIT_HOME_DIR
    mkdir $OH_MY_GIT_HOME_DIR
fi

git clone https://github.com/arialdomartini/oh-my-git.git $OH_MY_GIT_HOME_DIR

chown -R $TARGET_USER:$TARGET_USER_GROUP $OH_MY_GIT_HOME_DIR
