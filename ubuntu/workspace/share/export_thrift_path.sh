#!/usr/bin/env bash

# https://askubuntu.com/questions/53177/bash-script-to-set-environment-variables-not-working
echo "NOTE to make this effective for current shell, use 'source export_thrift_path.sh'."

# NOTE "thrift@0.90" is keg-only
export PATH="/usr/local/opt/thrift@0.90/bin:$PATH"

# Another option is to do "brew link thrift@0.90 --force".
# Without "--force", you'll see "Warning: thrift@0.90 is keg-only and must be linked with --force. Note that doing so can interfere with building software."
