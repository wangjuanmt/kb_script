#!/usr/bin/env bash

RBENV_HOME=$HOME/.rbenv
RBENV_EXEC=$RBENV_HOME/bin/rbenv

git clone https://github.com/rbenv/rbenv.git $RBENV_HOME

# https://github.com/fesplugas/rbenv-installer
#curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash

# Install plugin ruby-build
git clone https://github.com/rbenv/ruby-build.git $RBENV_HOME/plugins/ruby-build

# Install plugin rbenv-gemset
git clone https://github.com/jf/rbenv-gemset.git $RBENV_HOME/plugins/rbenv-gemset

# https://github.com/carsomyr/rbenv-bundler
#git clone https://github.com/carsomyr/rbenv-bundler.git $RBENV_HOME/plugins/bundler

# To upgrade (NOTE you also have to do this to see updated list of available versions for installation)
#cd $(rbenv root)
#git pull
# rbenv-installer is NOT included when cloning pyenv so we have to do a git pull for it specifically
# to get the latest list of available ruby versions to install.
#cd $(rbenv root)/plugins/ruby-build
#git pull
