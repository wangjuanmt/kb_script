. $HOME/bedroom/kb/script/cygwin/util/env_vars.sh

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

. $SHARE_ROOT/custom_profile.sh
