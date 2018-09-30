#!/usr/bin/env fish

function load_n
    set -gx N_PREFIX "$HOME/n"
    set -gx PATH "$N_PREFIX/bin" $PATH
end
