#!/usr/bin/env bash

# https://github.com/Genymobile/scrcpy
# NOTE: you have to setup your android sdk (via android studio) manually!
# And run "yes | sdkmanager --licenses" to accept all SDK licences.

CWD=$(pwd)

# Runtime dependencies
sudo apt-get install -y ffmpeg libsdl2-2.0.0

# Client build dependencies
sudo apt-get install -y make gcc pkg-config meson \
                 libavcodec-dev libavformat-dev libavutil-dev \
                 libsdl2-dev

# Server build dependencies
sudo apt-get install -y openjdk-8-jdk

SCRCPY_HOME=$USER_LOCAL_APP/scrcpy
SCRCPY_REPO_URL=https://github.com/Genymobile/scrcpy/releases/download/v1.1/scrcpy-server-v1.1.jar
SCRCPY_LOCAL_REPO=$USER_LOCAL_APP/scrcpy/repo
mkdir -p $SCRCPY_HOME

# Download server binary beforehand
#curl -L -o $SCRCPY_HOME/scrcpy-server.jar $SCRCPY_REPO_URL

git clone https://github.com/Genymobile/scrcpy $SCRCPY_LOCAL_REPO
cd $SCRCPY_LOCAL_REPO

# Build
meson x --buildtype release --strip -Db_lto=true
# Or build with pre-downloaded server binary
#meson x --buildtype release --strip -Db_lto=true -Dprebuilt_server=$SCRCPY_HOME/scrcpy-server.jar
cd x
ninja

# Test it from here:
#ninja run

# Or install to the system.
# This installs two files:
#* /usr/local/bin/scrcpy
#* /usr/local/share/scrcpy/scrcpy-server.jar
# Just remove them to "uninstall" the application.
#sudo ninja install

cd $CWD
