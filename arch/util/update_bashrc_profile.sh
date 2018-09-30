#!/usr/bin/env bash

echo "This script is deprecated!"
exit 1

# NOTE: sed on Linux is different from that on OSX!

# Insert custom contents to the beginning of $HOME/.profile,
# to set environment variables
old="^.*env_vars.sh.*"
printf -v new ". \$HOME/bedroom/kb/script/arch/util/env_vars.sh"
# Inserting into $HOME/.bashrc is redundant
#grep -q '^.*env_vars.sh' $HOME/.bashrc && sed -i "s~$old~$new~" $HOME/.bashrc || echo -e ". \$HOME/bedroom/kb/script/arch/util/env_vars.sh\n$(cat $HOME/.bashrc)" > $HOME/.bashrc
grep -q '^.*env_vars.sh' $USER_HOME/.profile && sed -i "s~$old~$new~" $USER_HOME/.profile || echo -e ". \$HOME/bedroom/kb/script/arch/util/env_vars.sh\n$(cat $USER_HOME/.profile)" > $USER_HOME/.profile

# Source custom bashrc in $HOME/.bashrc
grep -q '^.*custom_bashrc' $USER_HOME/.bashrc && sed -i "s/^.*custom_bashrc.*/\. \$SCRIPT_UTIL_ROOT\/custom_bashrc\.sh/" $USER_HOME/.bashrc || printf "\n\n. \$SCRIPT_UTIL_ROOT/custom_bashrc.sh" | tee -a $USER_HOME/.bashrc

# Source custom profile in $HOME/.profile
grep -q '^.*custom_profile' $USER_HOME/.profile && sed -i "s/^.*custom_profile.*/\. \$SCRIPT_UTIL_ROOT\/custom_profile\.sh/" $USER_HOME/.profile || printf "\n\n. \$SCRIPT_UTIL_ROOT/custom_profile.sh" | tee -a $USER_HOME/.profile

# Source custom_zshrc.sh in .zshrc
old="^.*custom_zshrc\.sh.*"
printf -v new ". \$SCRIPT_UTIL_ROOT/custom_zshrc.sh"
grep -q '^.*custom_zshrc\.sh' $USER_HOME/.zshrc && sed -i "s~$old~$new~" $USER_HOME/.zshrc || printf "\n\n. \$SCRIPT_UTIL_ROOT/custom_zshrc.sh" | tee -a $USER_HOME/.zshrc
