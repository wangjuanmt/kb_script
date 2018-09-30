#!/usr/bin/env bash

echo -e "Server=https://mirrors.ustc.edu.cn/msys2/msys/\$arch\n$(cat /etc/pacman.d/mirrorlist.msys)" > /etc/pacman.d/mirrorlist.msys
