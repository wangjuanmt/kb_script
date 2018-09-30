#!/usr/bin/env bash

JDK_DOWNLOAD_URL="http://download.oracle.com/otn-pub/java/jdk/8u74-b02/jdk-8u74-linux-x64.tar.gz"
SAVE_NAME=jdk8-linux.tar.gz
JDK_TARGET=$JVM_DIR/jdk8

cd $USER_DOWNLOADS
curl --cookie "oraclelicense=accept-securebackup-cookie" -o $SAVE_NAME -L $JDK_DOWNLOAD_URL

tar xf $SAVE_NAME
mkdir -p $JVM_DIR
mv jdk1.8.0_74 $JDK_TARGET
