# Load initial environment variables for MacOS
. $HOME/bedroom/kb/script/osx/util/env_vars.sh

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
       . "$HOME/.bashrc"
    fi
fi

if [ -n "$ZSH_VERSION" ]; then
    if [ -f "$HOME/.zshrc" ]; then
       . "$HOME/.zshrc"
    fi
fi

. $SCRIPT_UTIL_ROOT/custom_profile.sh
