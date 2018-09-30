#!/usr/bin/env bash

. $SCRIPT_UTIL_SHARE/install_rbenv.sh

# . $SCRIPT_UTIL_ROOT/determine_system_version.sh

# RUBY_DOWNLOAD_MIRROR="https://rvm.io/binaries"
# RUBY_BINARY_TARBALL_NAME="ruby-${RUBY_2_LATEST_STABLE_VERSION}.tar.bz2"
# RUBY_BINARY_DOWNLOAD_URL=$RUBY_DOWNLOAD_MIRROR/$SYSTEM_ID/$SYSTEM_VERSION/x86_64/$RUBY_BINARY_TARBALL_NAME

# RESPONSE_STATUS_CODE=$(curl -I -L "https://rvm.io/binaries/ubuntu/18.04/x86_64/ruby-2.5.1.tar.bz2" 2>/dev/null | head -n 1 | cut -d$' ' -f2)

# RVM binaries don't include binary of all Ruby versions
# if [[ $SYSTEM_ID == "ubuntu" ]] && [[ $RESPONSE_STATUS_CODE == "200" ]]; then
#     echo "Installing Ruby with binary from rvm..."
#     . $SCRIPT_UTIL_SHARE/rbenv_install_ruby_binary_from_rvm.sh $RUBY_2_LATEST_STABLE_VERSION true
# else
    echo "Installing Ruby with source code..."
    . $SCRIPT_UTIL_SHARE/rbenv_install_latest_ruby_versions.sh
# fi
