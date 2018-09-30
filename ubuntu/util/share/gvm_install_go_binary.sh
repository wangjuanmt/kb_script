#!/usr/bin/env bash

# Reference: https://github.com/moovweb/gvm/blob/master/scripts/install

GVM_ROOT=$HOME/.gvm
GVM_EXEC=$GVM_ROOT/bin/gvm

GO_VERSION=$1
SET_GLOBAL=$2
USE_DOWNLOAD_MIRROR=$3

# Step #1: download binary to cache location
GO_DOWNLOAD_ORIGIN="https://storage.googleapis.com/golang"
GO_DOWNLOAD_MIRROR="https://mirrors.ustc.edu.cn/golang"

if [[ $SYSTEM_ID = "osx" ]]; then
    GO_BINARY_TARBALL_FILE_NAME="go${GO_VERSION}.darwin-amd64.tar.gz"
else
    GO_BINARY_TARBALL_FILE_NAME="go${GO_VERSION}.linux-amd64.tar.gz"
fi

if [[ $USE_DOWNLOAD_MIRROR == "true" ]]; then
    GO_BINARY_TARBALL_DOWNLOAD_URL="${GO_DOWNLOAD_MIRROR}/${GO_BINARY_TARBALL_FILE_NAME}"
else
    GO_BINARY_TARBALL_DOWNLOAD_URL="${GO_DOWNLOAD_ORIGIN}/${GO_BINARY_TARBALL_FILE_NAME}"
fi

GO_BINARY_TARBALL_SAEV_PATH=$GVM_ROOT/archive/$GO_BINARY_TARBALL_FILE_NAME
#GO_TARGET_DIR=$GVM_ROOT/gos/go${GO_VERSION}

echo "GO_BINARY_TARBALL_DOWNLOAD_URL:$GO_BINARY_TARBALL_DOWNLOAD_URL"
echo "GO_BINARY_TARBALL_SAEV_PATH:$GO_BINARY_TARBALL_SAEV_PATH"

curl -L -o $GO_BINARY_TARBALL_SAEV_PATH $GO_BINARY_TARBALL_DOWNLOAD_URL

# Load gvm, after this step, "gvm" will be available as a function
source "$GVM_ROOT/scripts/gvm"

# Step #2: install from binary
gvm install go${GO_VERSION} --binary

# Step #3: set version globally
if [[ $SET_GLOBAL = "true" ]]; then
    gvm use $GO_VERSION --default
fi
