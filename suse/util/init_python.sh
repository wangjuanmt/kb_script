#!/usr/bin/env bash

# python2
sudo zypper -n install python python-devel

# python2-pip
sudo zypper -n install python-pip

# python3
sudo zypper -n install python3 python3-devel

# python3-pip
sudo zypper -n install python3-pip

# ipython
sudo pip2 install --upgrade ipython
sudo pip3 install --upgrade ipython

# requests lib
sudo pip2 install --upgrade requests
sudo pip3 install --upgrade requests

# ipdb
sudo pip2 install --upgrade ipdb
sudo pip3 install --upgrade ipdb

# To find the location of python site-packages directory
#import site; site.getsitepackages()
