#!/usr/bin/env bash

# Get and load antigen
# Save antigen.zsh to ubuntu util folder and other places will link to that file.
ANTIGEN_FILE=$SCRIPT_ROOT/../ubuntu/util/share/antigen.zsh
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > $ANTIGEN_FILE
