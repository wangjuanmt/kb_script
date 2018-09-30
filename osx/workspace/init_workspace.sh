#!/usr/bin/env bash

. $SCRIPT_UTIL_ROOT/init_jdk.sh

. $WORKSPACE_SCRIPT_ROOT/install/install_jetbrains_toolbox.sh

. $WORKSPACE_SCRIPT_SHARE/install/install_maven.sh

. $WORKSPACE_SCRIPT_SHARE/install/install_jd_gui.sh

. $WORKSPACE_SCRIPT_SHARE/install/install_yarn_binary.sh

. $WORKSPACE_SCRIPT_SHARE/install/install_initial_python_packages.sh

. $WORKSPACE_SCRIPT_SHARE/install/install_initial_ruby_packages.sh

. $WORKSPACE_SCRIPT_SHARE/install/install_initial_nodejs_packages.sh

. $WORKSPACE_SCRIPT_SHARE/install/install_initial_go_packages.sh
