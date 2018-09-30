#!/usr/bin/env bash

# https://wiki.archlinux.org/index.php/Multilib

printf "\n[multilib]" | sudo tee -a /etc/pacman.conf
printf "\nInclude=/etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf

# Then update the package list and upgrade with pacman -Syu
