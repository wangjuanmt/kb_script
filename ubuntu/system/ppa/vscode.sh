#!/usr/bin/env bash

# https://code.visualstudio.com/docs/setup/linux#_installation
# Installing the .deb package will automatically install the apt repository and signing key to enable auto-updating using the regular system mechanism.

# Install key
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

# Install repo
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
