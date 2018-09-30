#!/usr/bin/env zsh

OH_MY_ZSH_HOME=$HOME/.oh-my-zsh

if [[ -d "$OH_MY_ZSH_HOME" ]] ; then
    . $SCRIPT_UTIL_SHARE/custom_oh_my_zsh.sh
else
    echo "oh-my-zsh home '$OH_MY_ZSH_HOME' NOT found, will fallback to custom PS1."

    # Reference of customizing zsh prompt
    # https://wiki.archlinux.org/index.php/zsh#Customized_prompt
    # https://jlk.fjfi.cvut.cz/arch/manpages/man/zshmisc.1
    export PROMPT='%{#%} %F{red}%n %f@ %F{blue}%m%f in %F{yellow}%~%f %{[%}%D{%Y-%m-%d} %D{%H:%M:%S}%{]%}
%# '
fi
