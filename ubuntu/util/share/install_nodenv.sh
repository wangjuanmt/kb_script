#!/usr/bin/env bash

git clone https://github.com/nodenv/nodenv.git $NODENV_ROOT

# Install node-build plugin
git clone https://github.com/nodenv/node-build.git $NODENV_ROOT/plugins/node-build

# To upgrade (NOTE you also have to do this to see updated list of available versions for installation)
#cd $(nodenv root)
#git pull
