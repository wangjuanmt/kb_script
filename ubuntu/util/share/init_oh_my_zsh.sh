#!/usr/bin/env bash

OH_MY_ZSH_HOME_DIR=$HOME/.oh-my-zsh

# Do a fresh install if no current installation is found,
# otherwise do an upgrade.
if ! [[ -d "$OH_MY_ZSH_HOME_DIR" ]] ; then
    # Fresh install via script provided by oh-my-zsh (not preferred)
    #sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # Fresh install manually
    #git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $OH_MY_ZSH_HOME_DIR
    git clone https://github.com/robbyrussell/oh-my-zsh.git $OH_MY_ZSH_HOME_DIR
    chown -R $TARGET_USER:$TARGET_USER_GROUP $OH_MY_ZSH_HOME_DIR

    # "stow_home" will handle these files
    # Backup existing zshrc if exists
    #[ -f "$HOME/.zshrc" ] && mv $HOME/.zshrc $HOME/.zshrc.backup_$(date +%F-%T)
    # Create a new zsh configuration file
    #cp $OH_MY_ZSH_HOME_DIR/templates/zshrc.zsh-template $HOME/.zshrc
    # Rename existing .zprofile if it is a file
    #[ -f "$HOME/.zprofile" ] && mv $HOME/.zprofile $HOME/.zprofile.backup_$(date +%F-%T)
    # Remove existing .zprofile if it is a link
    #[ -L "$HOME/.zprofile" ] && rm $HOME/.zprofile
    # Link .profile to .zprofile
    #ln -s $HOME/.profile $HOME/.zprofile

    chown $TARGET_USER:$TARGET_USER_GROUP $HOME/.zprofile

    chown $TARGET_USER:$TARGET_USER_GROUP $HOME/.zshrc
#else
#    upgrade_oh_my_zsh
fi

# Change your default shell (password required)
#chsh -s $(which zsh)

# May need to manually configure .zshrc afterward
# Preferred theme: agnoster, ys
# Don't forget to disable auto update
