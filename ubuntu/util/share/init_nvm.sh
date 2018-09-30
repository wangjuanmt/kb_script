#!/usr/bin/env bash

NVM_DIR=$HOME/.nvm

NODE_LATEST_STABLE_VERSION=7.3.0

# Clone nvm repo and checkout the latest tag version
git clone https://github.com/creationix/nvm.git $NVM_DIR
cd $NVM_DIR

# https://git-scm.com/docs/git-describe
# git-describe - Describe a commit using the most recent tag reachable from it
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`

# Source nvm script
. "$NVM_DIR/nvm.sh"

# To download, compile, and install the latest release of node
#nvm install node

# Install latest node from precompiled binaries
. $SCRIPT_UTIL_SHARE/nvm_install_node_binary.sh $NODE_LATEST_STABLE_VERSION
