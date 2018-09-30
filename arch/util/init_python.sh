#!/usr/bin/env bash

# python3
sudo pacman -S --noconfirm --needed python python-pip

# python2
sudo pacman -S --noconfirm --needed python2 python2-pip

# ipython
sudo pip2 install --upgrade ipython
sudo pip3 install --upgrade ipython

# ipdb
sudo pip2 install --upgrade ipdb
sudo pip3 install --upgrade ipdb

# requests lib
sudo pip2 install --upgrade requests
sudo pip3 install --upgrade requests
