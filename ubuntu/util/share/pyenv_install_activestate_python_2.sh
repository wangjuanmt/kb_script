#!/usr/bin/env bash

PYENV_ROOT=$HOME/.pyenv
PYTHON_VERSION=2.7.13
UNCOMPRESS_TARGET_DIR=$PYENV_ROOT/versions/$PYTHON_VERSION
CURRENT_DIR=$(pwd)

if [[ "$SYSTEM_CATEGORY" = "" ]]; then
    echo "Cannot determine system category! Define a 'SYSTEM_CATEGORY' variable first!"
    exit 1
elif [[ "$SYSTEM_CATEGORY" = "linux" ]]; then
    ACTIVE_PYTHON_EXTRACTED_FOLDER_NAME="ActivePython-2.7.13.2715-linux-x86_64-glibc-2.12-402695"
elif [[ "$SYSTEM_CATEGORY" = "mac" ]]; then
    ACTIVE_PYTHON_EXTRACTED_FOLDER_NAME="ActivePython-2.7.13.2715-macosx10.9-i386-x86_64-402861"
else
    echo "Not implemented yet for system categorized as '$SYSTEM_CATEGORY'!"
    exit 1
fi

if [[ "$SYSTEM_CATEGORY" = "linux" ]]; then
    ACTIVE_PYTHON_DOWNLOAD_SAVE_NAME=$ACTIVE_PYTHON_EXTRACTED_FOLDER_NAME.tar.gz
elif [[ "$SYSTEM_CATEGORY" = "mac" ]]; then
    ACTIVE_PYTHON_DOWNLOAD_SAVE_NAME=$ACTIVE_PYTHON_EXTRACTED_FOLDER_NAME.pkg
fi

ACTIVE_PYTHON_DOWNLOAD_URL=http://downloads.activestate.com/ActivePython/releases/2.7.13.2715/$ACTIVE_PYTHON_DOWNLOAD_SAVE_NAME
curl -L -o $USER_DOWNLOADS/$ACTIVE_PYTHON_DOWNLOAD_SAVE_NAME $ACTIVE_PYTHON_DOWNLOAD_URL

cd $USER_DOWNLOADS

if [[ "$SYSTEM_CATEGORY" = "linux" ]]; then
    tar xzf $ACTIVE_PYTHON_DOWNLOAD_SAVE_NAME
    mv ./$ACTIVE_PYTHON_EXTRACTED_FOLDER_NAME/INSTALLDIR $UNCOMPRESS_TARGET_DIR
elif [[ "$SYSTEM_CATEGORY" = "mac" ]]; then
    pkgutil --expand $ACTIVE_PYTHON_DOWNLOAD_SAVE_NAME $ACTIVE_PYTHON_EXTRACTED_FOLDER_NAME
    cd $ACTIVE_PYTHON_EXTRACTED_FOLDER_NAME
    cpio -iv < ./ActivePython-2.7.13.2715.pkg/Payload
    mv ./Library/Frameworks/Python.framework/Versions/2.7 $UNCOMPRESS_TARGET_DIR
fi

cd $UNCOMPRESS_TARGET_DIR

if [[ $SYSTEM_CATEGORY == "mac" ]]; then
    ack -l "/Library/Frameworks/Python.framework/Versions/2.7" | xargs perl -pi -E "s/\/Library\/Frameworks\/Python.framework\/Versions\/2.7/\/Users\/$TARGET_USER\/\.pyenv\/versions\/$PYTHON_VERSION/g"
else
    ack -l "/home/python/APy-2.7.13.2715-linux-x86_64-glibc-2.12-402695/local-lib" | xargs perl -pi -E "s/\/home\/python\/APy-2.7.13.2715-linux-x86_64-glibc-2.12-402695\/local-lib/\/home\/$TARGET_USER\/\.pyenv\/versions\/$PYTHON_VERSION/g"
fi

cd $CURRENT_DIR
