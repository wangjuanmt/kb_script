#!/usr/bin/env bash

echo "*****************Start $HOME/bedroom/kb/script/msys/util/env_vars.sh*****************"
. $HOME/bedroom/kb/script/msys/util/env_vars.sh
echo "-----------------Done $HOME/bedroom/kb/script/msys/util/env_vars.sh-----------------"


echo "*****************Start $SCRIPT_UTIL_ROOT/fix_sym_link.sh*****************"
. $SCRIPT_UTIL_ROOT/fix_sym_link.sh
echo "-----------------Done $SCRIPT_UTIL_ROOT/fix_sym_link.sh-----------------"


echo "Done! Now logout and login again."
