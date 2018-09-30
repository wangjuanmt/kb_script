#!/usr/bin/env bash

echo "*****************Start $SCRIPT_UTIL_ROOT/install_osxfuse.sh*****************"
. $SCRIPT_UTIL_ROOT/install_osxfuse.sh
echo "-----------------Done $SCRIPT_UTIL_ROOT/install_osxfuse.sh-----------------"


echo "*****************Start $SCRIPT_UTIL_ROOT/install_sshfs.sh*****************"
. $SCRIPT_UTIL_ROOT/install_sshfs.sh
echo "-----------------Done $SCRIPT_UTIL_ROOT/install_sshfs.sh-----------------"


echo "*****************Start $SCRIPT_UTIL_ROOT/install_ntfs_support.sh*****************"
. $SCRIPT_UTIL_ROOT/install_ntfs_support.sh
echo "-----------------Done $SCRIPT_UTIL_ROOT/install_ntfs_support.sh-----------------"


echo "*****************Start $SCRIPT_UTIL_ROOT/install_ext_support.sh*****************"
. $SCRIPT_UTIL_ROOT/install_ext_support.sh
echo "-----------------Done $SCRIPT_UTIL_ROOT/install_ext_support.sh-----------------"
