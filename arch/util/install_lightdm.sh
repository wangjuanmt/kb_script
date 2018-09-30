#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed lightdm lightdm-gtk-greeter

# Append "greeter-session=lightdm-gtk-greeter" to /etc/lightdm/lightdm.conf
printf "\ngreeter-session=lightdm-gtk-greeter" | sudo tee -a /etc/lightdm/lightdm.conf
