#!/usr/bin/env bash

SQLTABS_TARGET_DIR=$USER_LOCAL_APP/sqltabs

sudo apt-get install -y libpq-dev

cd $USER_DOWNLOADS
wget "http://www.sqltabs.com/download/sqltabs.tar.gz"
tar -xf sqltabs.tar.gz
chown $TARGET_USER:$TARGET_USER_GROUP -R sqltabs-linux-x64

if [ -d "$SQLTABS_TARGET_DIR" ]; then
    rm -rf $SQLTABS_TARGET_DIR
fi

mv sqltabs-linux-x64 $SQLTABS_TARGET_DIR

cd $USER_LOCAL_BIN

if [ ! -L "sqltabs" ]; then
    ln -s ../app/sqltabs/sqltabs
fi
