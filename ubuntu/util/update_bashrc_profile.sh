#!/usr/bin/env bash

echo "This script is deprecated!"
exit 1

# NOTE: sed on Linux is different from that on OSX!

# Insert custom contents to the beginning of $HOME/.profile,
# to set environment variables
old="^.*env_vars.sh.*"
printf -v new ". \$HOME/bedroom/kb/script/ubuntu/util/env_vars.sh"
# Inserting into $HOME/.bashrc is redundant
#grep -q '^.*env_vars.sh' $HOME/.bashrc && sed -i "s~$old~$new~" $HOME/.bashrc || echo -e ". \$HOME/bedroom/kb/script/ubuntu/util/env_vars.sh\n$(cat $HOME/.bashrc)" > $HOME/.bashrc
grep -q '^.*env_vars.sh' $HOME/.profile && sed -i "s~$old~$new~" $HOME/.profile || echo -e ". \$HOME/bedroom/kb/script/ubuntu/util/env_vars.sh\n$(cat $HOME/.profile)" > $HOME/.profile

# Source custom bashrc in $HOME/.bashrc
grep -q '^.*custom_bashrc' $HOME/.bashrc && sed -i "s/^.*custom_bashrc.*/\. \$SCRIPT_UTIL_ROOT\/custom_bashrc\.sh/" $HOME/.bashrc || printf "\n\n. \$SCRIPT_UTIL_ROOT/custom_bashrc.sh" | tee -a $HOME/.bashrc

# Source custom profile in $HOME/.profile
grep -q '^.*custom_profile' $HOME/.profile && sed -i "s/^.*custom_profile.*/\. \$SCRIPT_UTIL_ROOT\/custom_profile\.sh/" $HOME/.profile || printf "\n\n. \$SCRIPT_UTIL_ROOT/custom_profile.sh" | tee -a $HOME/.profile

# Source custom_zshrc.sh in .zshrc
old="^.*custom_zshrc\.sh.*"
printf -v new ". \$SCRIPT_UTIL_ROOT/custom_zshrc.sh"
grep -q '^.*custom_zshrc\.sh' $HOME/.zshrc && sed -i "s~$old~$new~" $HOME/.zshrc || printf "\n\n. \$SCRIPT_UTIL_ROOT/custom_zshrc.sh" | tee -a $HOME/.zshrc

# Source oh-my-git prompt in .bashrc to make it effective for bash
#old="^.*oh-my-git\/prompt\.sh.*"
#printf -v new ". \$HOME/.oh-my-git/prompt.sh"
#grep -q '^.*oh-my-git\/prompt\.sh' $HOME/.bashrc && sed -i "s~$old~$new~" $HOME/.bashrc || printf "\n\n. \$HOME/.oh-my-git/prompt.sh" | tee -a $HOME/.bashrc
