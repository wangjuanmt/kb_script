#!/usr/bin/env bash

BASH_IT_HOME=$HOME/.bash_it

# Customize prompt colors
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [[ -d "$BASH_IT_HOME" ]] ; then
    . $SCRIPT_UTIL_SHARE/custom_bash_it.sh
else
    echo "bashit home '$BASH_IT_HOME' NOT found, will fallback to custom PS1."
    # We can also put emoji in prompt
    # http://getemoji.com
    # http://www.iemoji.com

    # Easy Bash PS1 Generator
    # https://github.com/jmatth/ezprompt
    # http://ezprompt.net/
    export PS1="\[\033[01;35m\]\u@\h:\[\033[01;34m\]\$(parse_git_branch) \[\033[01;32m\]\w \[\033[01;34m\]\n\$ \[\e[0m\]"
fi
