#!/usr/bin/env bash

PYENV_ROOT=$HOME/.pyenv
PYENV_REPO="https://github.com/yyuu/pyenv.git"

git clone $PYENV_REPO $PYENV_ROOT

# https://github.com/yyuu/pyenv-installer
#curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# Install pyenv-virtualenv plugin
git clone https://github.com/yyuu/pyenv-virtualenv.git $PYENV_ROOT/plugins/pyenv-virtualenv

# To upgrade (NOTE you also have to do this to see updated list of available versions for installation)
# pyenv-installer is already included when cloning pyenv so we don't have to do a git pull for it specifically
# to get the latest list of available python versions to install.
#cd $(pyenv root)
#git pull
