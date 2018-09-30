#!/usr/bin/env bash

#brew fetch --retry --force-bottle --deps vim

# vim package installation error - configure: error: cannot run C compiled programs.
# https://github.com/Homebrew/homebrew-core/issues/12323
#brew install vim --with-lua
brew install vim

