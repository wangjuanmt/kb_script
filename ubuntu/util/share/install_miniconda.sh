#!/usr/bin/env bash

# https://conda.io/miniconda.html
# Search package on Anaconda cloud: https://anaconda.org/

MINICONDA_VERSION=$1
DOWNLOAD_MIRROR=$2
MINICONDA_PREFIX="${USER_LOCAL_APP}/miniconda${MINICONDA_VERSION}"
MINICONDA_DOWNLOAD_URL_PREFIX="https://repo.continuum.io/miniconda/"

if [[ "$DOWNLOAD_MIRROR" = "" ]]; then
    echo "Will not use download mirror."
elif [[ "$DOWNLOAD_MIRROR" = "ustc" ]]; then
    MINICONDA_DOWNLOAD_URL_PREFIX="https://mirrors.ustc.edu.cn/anaconda/miniconda/"
elif [[ "$DOWNLOAD_MIRROR" = "tuna" ]]; then
    MINICONDA_DOWNLOAD_URL_PREFIX="https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/"
else
    echo "Unsupported mirror! Must be either 'ustc' or 'tuna'."
    exit 1
fi

if [[ "$SYSTEM_CATEGORY" = "" ]]; then
    echo "Cannot determine system category! Define a 'SYSTEM_CATEGORY' variable first!"
    exit 1
elif [[ "$SYSTEM_CATEGORY" = "linux" ]]; then
    MINICONDA_INSTALL_SCRIPT_SAVE_NAME="Miniconda${MINICONDA_VERSION}-latest-Linux-x86_64.sh"
    MINICONDA_INSTALL_SCRIPT_SAVE_PATH=$USER_DOWNLOADS/$MINICONDA_INSTALL_SCRIPT_SAVE_NAME
    curl -L -o $MINICONDA_INSTALL_SCRIPT_SAVE_PATH $MINICONDA_DOWNLOAD_URL_PREFIX$MINICONDA_INSTALL_SCRIPT_SAVE_NAME
elif [[ "$SYSTEM_CATEGORY" = "mac" ]]; then
    MINICONDA_INSTALL_SCRIPT_SAVE_NAME="Miniconda${MINICONDA_VERSION}-latest-MacOSX-x86_64.sh"
    MINICONDA_INSTALL_SCRIPT_SAVE_PATH=$USER_DOWNLOADS/$MINICONDA_INSTALL_SCRIPT_SAVE_NAME
    curl -L -o $MINICONDA_INSTALL_SCRIPT_SAVE_PATH $MINICONDA_DOWNLOAD_URL_PREFIX$MINICONDA_INSTALL_SCRIPT_SAVE_NAME
else
    echo "Not implemented yet for system categorized as '$SYSTEM_CATEGORY'!"
    exit 1
fi

bash $MINICONDA_INSTALL_SCRIPT_SAVE_PATH -b -f -p $MINICONDA_PREFIX
