#!/usr/bin/env bash

function upgrade_pyenv() {
    cd $(pyenv root)
    git pull
}

function upgrade_rbenv() {
    cd $(rbenv root)
    git pull

    cd $(rbenv root)/plugins/ruby-build
    git pull
}

function upgrade_nodenv() {
    cd $(nodenv root)
    git pull
}

function load_n() {
    export N_PREFIX="$HOME/n"
    export PATH=$N_PREFIX/bin:$PATH
}

function load_gvm() {
    . $SCRIPT_UTIL_SHARE/load_gvm.sh
}
