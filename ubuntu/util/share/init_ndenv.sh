#!/usr/bin/env bash

NDENV_HOME=$HOME/.ndenv
NDENV_EXEC=$NDENV_HOME/bin/ndenv

NODE_LATEST_STABLE_VERSION=7.3.0

git clone https://github.com/riywo/ndenv.git $NDENV_HOME

# Install node-build plugin
git clone https://github.com/riywo/node-build.git $NDENV_HOME/plugins/node-build

#eval "$($NDENV_EXEC init -)"
#$NDENV_EXEC install v$NODE_LATEST_STABLE_VERSION
#$NDENV_EXEC rehash

. $SCRIPT_UTIL_SHARE/ndenv_install_node_binary.sh $NODE_LATEST_STABLE_VERSION true
