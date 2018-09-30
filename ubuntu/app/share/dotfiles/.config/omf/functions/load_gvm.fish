#!/usr/bin/env fish

# Reference: https://github.com/maman/plugin-gvm/blob/master/gvm.fish
# The original script has a problem - it will insert gvm paths at the beginning of PATH every time we call "gvm".

function load_gvm --description 'Load Go Version Manager'
    if not type -q bass
        echo 'Bass is not installed please install it running fisher edc/bass'
        return
    end
    set -q GVM_DIR; or set -gx GVM_DIR ~/.gvm
    set -g gvm_prefix $GVM_DIR

    bass source $gvm_prefix/scripts/gvm
end
