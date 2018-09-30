#!/usr/bin/env bash

# From "brew info curl":
# This formula is keg-only, which means it was not symlinked into /usr/local.
# macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.
#brew fetch --retry --force-bottle curl
brew install curl
