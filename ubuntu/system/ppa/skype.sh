#!/usr/bin/env bash

# https://askubuntu.com/questions/921824/repo-key-of-skype
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
sh -c 'echo "deb https://repo.skype.com/deb stable main" >> /etc/apt/sources.list.d/skype-stable.list'
