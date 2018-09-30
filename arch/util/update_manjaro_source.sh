#!/usr/bin/env bash

# Choose best mirror
echo -e "Server=http://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch\n$(cat /etc/pacman.d/mirrorlist)" > /etc/pacman.d/mirrorlist

. $SCRIPT_UTIL_ROOT/init_archlinuxcn_repo.sh
