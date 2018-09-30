#!/usr/bin/env bash

#export JAVA_HOME=$JVM_DIR/default
export JAVA_HOME_7=$JVM_DIR/java-7-jdk
export JAVA_HOME_8=$JVM_DIR/java-8-jdk
#export ANDROID_HOME=$USER_LOCAL_APP/androidsdk

USER_PIP_HOME=$HOME/.local

export EDITOR=vim

export GOPATH=$USER_LOCAL_LIB/go

NPM_USER_BIN=$HOME/node_modules/.bin

export PATH=$USER_LOCAL_BIN:$SYSTEM_SCRIPT_ROOT:$APP_SCRIPT_ROOT:$APP_SCRIPT_SHARE:$WORKSPACE_SCRIPT_ROOT:$WORKSPACE_SCRIPT_SHARE:$USER_PIP_HOME/bin:$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$NPM_USER_BIN:$GOPATH/bin:$PATH

. $SCRIPT_UTIL_SHARE/custom_profile_common.sh
