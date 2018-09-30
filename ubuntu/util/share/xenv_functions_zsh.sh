#!/usr/bin/env zsh

function load_pyenv() {
    # Load pyenv only when command "pyenv" exists
    # http://stackoverflow.com/questions/592620/
    if command -v pyenv 1>/dev/null 2>&1; then
        eval "$(pyenv init - zsh)"
        eval "$(pyenv virtualenv-init - zsh)"
    else
        echo "Command 'pyenv' NOT found."
    fi
}

function load_rbenv() {
    if command -v rbenv 1>/dev/null 2>&1; then
        eval "$(rbenv init - zsh)"
    else
        echo "Command 'rbenv' NOT found."
    fi
}

function load_nodenv() {
    if command -v nodenv 1>/dev/null 2>&1; then
        eval "$(nodenv init - zsh)"
    else
        echo "Command 'nodenv' NOT found."
    fi
}

function load_goenv() {
    if command -v goenv 1>/dev/null 2>&1; then
        eval "$(goenv init - zsh)"
    else
        echo "Command 'goenv' NOT found."
    fi
}

function load_jenv() {
    if command -v jenv 1>/dev/null 2>&1; then
        eval "$(jenv init - zsh)"
    else
        echo "Command 'jenv' NOT found."
    fi
}
