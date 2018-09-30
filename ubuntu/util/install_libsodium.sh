#!/usr/bin/env bash

# Install this package will install correct version of libsodium of current distro version
# As for 16.04, it is libsodium18
# As for 18.04, it is libsodium23
sudo apt-get install -y libsodium-dev
