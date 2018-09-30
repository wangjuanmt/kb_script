#!/usr/bin/env bash

NVM_DIR=$HOME/.nvm

NODE_VERSION=$1

#NODE_DOWNLOAD_MIRROR="https://nodejs.org/dist"
NODE_DOWNLOAD_MIRROR="https://npm.taobao.org/mirrors/node"

if [[ $SYSTEM_ID = "osx" ]]; then
    export NODE_TARBALL_EXTRACT_FOLDER_NAME="node-v${NODE_VERSION}-darwin-x64"
else
    export NODE_TARBALL_EXTRACT_FOLDER_NAME="node-v${NODE_VERSION}-linux-x64"
fi

NODE_TARBALL_FILE_NAME="${NODE_TARBALL_EXTRACT_FOLDER_NAME}.tar.xz"
NODE_TARBALL_DOWNLOAD_URL="${NODE_DOWNLOAD_MIRROR}/v${NODE_VERSION}/${NODE_TARBALL_FILE_NAME}"
NODE_TARBALL_SAEV_PATH=$USER_DOWNLOADS/$NODE_TARBALL_FILE_NAME

CURRENT_DIR=$(pwd)
cd $USER_DOWNLOADS
#wget -nc $NODE_TARBALL_DOWNLOAD_URL -O $NODE_TARBALL_SAEV_PATH
curl -L -o $NODE_TARBALL_SAEV_PATH $NODE_TARBALL_DOWNLOAD_URL
tar -xf $NODE_TARBALL_FILE_NAME
mv ./$NODE_TARBALL_EXTRACT_FOLDER_NAME $NVM_DIR/versions/node/v${NODE_VERSION}
rm -f $NODE_TARBALL_FILE_NAME
cd $CURRENT_DIR