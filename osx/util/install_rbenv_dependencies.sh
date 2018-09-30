#!/usr/bin/env bash

# optional, but recommended:
#brew fetch --retry --force-bottle --deps openssl libyaml libffi gmp
brew install openssl libyaml libffi gmp

# required for building Ruby <= 1.9.3-p0:
#brew tap homebrew/dupes
#brew fetch --retry --force-bottle --deps apple-gcc42
#brew install apple-gcc42
