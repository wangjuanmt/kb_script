#!/usr/bin/env bash

sudo zypper -n install adobe-release-x86_64
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
sudo zypper -n install flash-plugin
