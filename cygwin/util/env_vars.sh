#!/usr/bin/env bash

# NOTE: cygwin doesn't have sudo.
export TARGET_USER=$USER

# This statement will cause a syntax error if running as zsh
[[ $(id -u) == "0" ]] && TARGET_USER=$SUDO_USER

export TARGET_USER_GROUP=$TARGET_USER
export USER_HOME=/home/$TARGET_USER

# By default HOME=/cygdrive/c/Users/[username]
export HOME=$USER_HOME
export USER_DOWNLOADS=$HOME/Downloads
export USER_FONTS_DIR=$HOME/.fonts

export USER_ROOM=$HOME/bedroom
export APP_ROOT=$USER_ROOM/app
export SOFT_SETUP_ROOT=$USER_ROOM/softsetup
export WORKSPACE_ROOT=$USER_ROOM/workspace

export KB_ROOT=$USER_ROOM/kb
export SCRIPT_REPO_ROOT=$KB_ROOT/script

export USER_LOCAL=$USER_ROOM/local
export USER_LOCAL_BIN=$USER_LOCAL/bin
export USER_LOCAL_APP=$USER_LOCAL/app
export USER_LOCAL_LIB=$USER_LOCAL/lib
export JVM_DIR=$USER_LOCAL_APP/jvm

# Most important variables pointing to the correct OS folder!
export SYSTEM_ID=cygwin

export SYSTEM_CATEGORY=linux
export SCRIPT_ROOT=$SCRIPT_REPO_ROOT/$SYSTEM_ID
export SHARE_ROOT=$SCRIPT_ROOT/share
export PRIVATE_SCRIPT_ROOT=$SCRIPT_REPO_ROOT/private/$SYSTEM_ID

# Public folders
export SCRIPT_UTIL_ROOT=$SCRIPT_ROOT/util
export SCRIPT_UTIL_SHARE=$SCRIPT_UTIL_ROOT/share
export SYSTEM_SCRIPT_ROOT=$SCRIPT_ROOT/system
export APP_SCRIPT_ROOT=$SCRIPT_ROOT/app
export APP_SCRIPT_SHARE=$APP_SCRIPT_ROOT/share
export WORKSPACE_SCRIPT_ROOT=$SCRIPT_ROOT/workspace
export WORKSPACE_SCRIPT_SHARE=$SCRIPT_ROOT/workspace/share

# Private folders
export PRIVATE_SCRIPT_UTIL_ROOT=$PRIVATE_SCRIPT_ROOT/util
export PRIVATE_SCRIPT_UTIL_SHARE=$PRIVATE_SCRIPT_UTIL_ROOT/share
export PRIVATE_SYSTEM_SCRIPT_ROOT=$PRIVATE_SCRIPT_ROOT/system
export PRIVATE_APP_SCRIPT_ROOT=$PRIVATE_SCRIPT_ROOT/app
export PRIVATE_APP_SCRIPT_SHARE=$PRIVATE_APP_SCRIPT_ROOT/share
export PRIVATE_WORKSPACE_SCRIPT_ROOT=$PRIVATE_SCRIPT_ROOT/workspace
export PRIVATE_WORKSPACE_SCRIPT_SHARE=$PRIVATE_SCRIPT_ROOT/workspace/share
