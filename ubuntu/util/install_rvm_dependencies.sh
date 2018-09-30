#!/usr/bin/env bash

# https://rvm.io/rvm/prerequisites
# A quick check of whether all dependencies are in place
# for name in {bash,awk,sed,grep,ls,cp,tar,curl,gunzip,bunzip2,git,svn} ; do which $name ; done
sudo apt-get install -y gnupg2 bzip2 git subversion libyaml-dev sqlite3 autoconf libgdbm-dev automake libtool libffi-dev
