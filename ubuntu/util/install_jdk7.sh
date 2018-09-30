#!/usr/bin/env bash

JDK_DOWNLOAD_URL="http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz"
SAVE_NAME=jdk7-linux.tar.gz
JDK_TARGET=$JVM_DIR/jdk7

cd $USER_DOWNLOADS
curl --cookie "oraclelicense=accept-securebackup-cookie" -o $SAVE_NAME -L $JDK_DOWNLOAD_URL

tar xf $SAVE_NAME
mkdir -p $JVM_DIR
mv jdk1.7.0_80 $JDK_TARGET
