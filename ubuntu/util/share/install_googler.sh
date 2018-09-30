#!/usr/bin/env bash

# https://github.com/jarun/googler

VERSION=v2.9
GOOGLER_HOME=$USER_LOCAL_BIN
GOOGLER_SAVE_PATH=$GOOGLER_HOME/googler

mkdir $GOOGLER_HOME

curl -o $GOOGLER_SAVE_PATH https://raw.githubusercontent.com/jarun/googler/$VERSION/googler && chmod +x $GOOGLER_SAVE_PATH
