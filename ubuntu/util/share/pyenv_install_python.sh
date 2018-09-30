#!/usr/bin/env bash

PYENV_ROOT=$HOME/.pyenv

PYTHON_VERSION=$1
SET_GLOBAL=$2
USE_DOWNLOAD_MIRROR=$3

# Official download sample
#https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tgz

PYTHON_DOWNLOAD_MIRROR=https://cnpmjs.org/mirrors/python
#PYTHON_DOWNLOAD_MIRROR=http://mirrors.sohu.com/python

PYTHON_TARBALL_SAVE_NAME="Python-${PYTHON_VERSION}.tar.xz"
PYTHON_DOWNLOAD_URL="${PYTHON_DOWNLOAD_MIRROR}/${PYTHON_VERSION}/${PYTHON_TARBALL_SAVE_NAME}"

# Download source tarball from mirror to cache first
# https://segmentfault.com/a/1190000006174123
if [[ $USE_DOWNLOAD_MIRROR == "true" ]]; then
    mkdir -p $PYENV_ROOT/cache
    #wget -nc $PYTHON_DOWNLOAD_URL -P $PYENV_ROOT/cache/
    curl -L -o $PYENV_ROOT/cache/$PYTHON_TARBALL_SAVE_NAME $PYTHON_DOWNLOAD_URL
fi

# Load pyenv script
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Install latest stable version
# If installing with proxychains, add PYTHON_CONFIGURE_OPTS="--disable-ipv6" at the beginning
if [[ "$SYSTEM_CATEGORY" = "" ]]; then
    echo "Cannot determine system category! Define a 'SYSTEM_CATEGORY' variable first!"
    exit 1
elif [[ "$SYSTEM_CATEGORY" = "linux" ]]; then
    pyenv install -s -v $PYTHON_VERSION
elif [[ "$SYSTEM_CATEGORY" = "mac" ]]; then
    # ERROR: The Python ssl extension was not compiled. Missing the OpenSSL lib? https://github.com/pyenv/pyenv/wiki/Common-build-problems#error-the-python-ssl-extension-was-not-compiled-missing-the-openssl-lib
    CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv install -s -v $PYTHON_VERSION
else
    echo "Not implemented yet for system categorized as '$SYSTEM_CATEGORY'!"
    exit 1
fi

# Choose python version
if [[ $SET_GLOBAL == "true" ]]; then
    pyenv global $PYTHON_VERSION
fi
