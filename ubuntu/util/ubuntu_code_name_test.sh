#!/usr/bin/env bash

. $SCRIPT_UTIL_ROOT/ubuntu_code_name.sh

echo $UBUNTU_CODE_NAME
echo $DISTRO_ID

if [[ $DISTRO_ID = "linuxmint" ]]; then
    echo "You're running linuxmint!"
else
    echo "You're not running linuxmint!"
fi

export DISTRO_ID="archlinux"

ubuntu_code_name
