#!/usr/bin/env bash

# https://lug.ustc.edu.cn/wiki/mirrors/help/archlinuxcn

# Append 3 lines to /etc/pacman.conf
#[archlinuxcn]
#SigLevel = Optional TrustedOnly
#Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
printf "\n[archlinuxcn]" | sudo tee -a /etc/pacman.conf
printf "\nSigLevel=Optional TrustedOnly" | sudo tee -a /etc/pacman.conf
printf "\nServer=https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" | sudo tee -a /etc/pacman.conf

# Import GPG key
sudo pacman -S --noconfirm --needed archlinuxcn/archlinuxcn-keyring
