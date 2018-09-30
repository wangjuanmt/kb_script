#!/usr/bin/env bash

# Compile and install libsodium from source
# https://github.com/jedisct1/libsodium/
cd $USER_DOWNLOADS
wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz -O libsodiumLATEST.tar.gz
#chown $TARGET_USER:$TARGET_USER_GROUP libsodiumLATEST.tar.gz
tar zxf libsodiumLATEST.tar.gz
#cd $SOFT_SETUP_ROOT/network/shadowsocks
cd libsodium-*
./configure
make && make install
printf "/usr/local/lib" | tee -a /etc/ld.so.conf.d/usr_local_lib.conf
ldconfig
cd $USER_DOWNLOADS
rm -rf libsodium-*
rm -f libsodiumLATEST.tar.gz
