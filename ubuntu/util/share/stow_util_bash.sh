function stow_util() {
    STOW_TARGET=$1
    STOW_FOLDER_PREFIX=$2
    STOW_FOLDER=$3

    shopt -s nullglob

    # Delete all existing link/file/folder
    for file in $STOW_FOLDER_PREFIX/$STOW_FOLDER/{.,}*
    do
        filename=${file##*/}
        echo $filename
        # Test link before file b/c links will be treated as files as well.
        if [[ -L "$STOW_TARGET/$filename" ]]; then
            echo "Found link '$STOW_TARGET/$filename', will DELETE it."
            rm $STOW_TARGET/$filename
        elif [[ -f "$STOW_TARGET/$filename" ]]; then
            echo "Found file '$STOW_TARGET/$filename', will DELETE it."
            rm $STOW_TARGET/$filename
        else
            echo "Didn't find file/link '$STOW_TARGET/$filename'."
        fi
    done

    shopt -u nullglob

    if ! [[ -d "$STOW_TARGET" ]]; then
        mkdir -p $STOW_TARGET
    fi

    echo "Going to stow '${STOW_FOLDER}' to '${STOW_TARGET}'..."
    stow -d $STOW_FOLDER_PREFIX -t $STOW_TARGET -S $STOW_FOLDER
}

function stow_util_preserve_original() {
    STOW_TARGET=$1
    STOW_FOLDER_PREFIX=$2
    STOW_FOLDER=$3

    # Loop through all dot files
    # http://www.cyberciti.biz/faq/bash-loop-over-file/
    # http://unix.stackexchange.com/questions/162586/proper-way-to-iterate-through-contents-in-a-directory
    # http://superuser.com/questions/1004488/restore-shopt-s-nocaseglob-setting-to-default-in-os-x
    # http://unix.stackexchange.com/questions/204803/why-is-nullglob-not-default
    shopt -s nullglob

    for file in $STOW_FOLDER_PREFIX/$STOW_FOLDER/{.,}*
    do
        filename=${file##*/}
        echo $filename
        # Test link before file b/c links will be treated as files as well.
        if [[ -L "$STOW_TARGET/$filename" ]]; then
            echo "Found link '$STOW_TARGET/$filename', will RENAME it."
            mv $STOW_TARGET/$filename $STOW_TARGET/${filename}.backup_$(date +%F-%T)
        elif [[ -f "$STOW_TARGET/$filename" ]]; then
            echo "Found file '$STOW_TARGET/$filename', will RENAME it."
            mv $STOW_TARGET/$filename $STOW_TARGET/${filename}.backup_$(date +%F-%T)
        else
            echo "Didn't find file/link '$STOW_TARGET/$filename'."
        fi
    done

    shopt -u nullglob

    if ! [[ -d "$STOW_TARGET" ]]; then
        mkdir -p $STOW_TARGET
    fi

    echo "Going to stow '${STOW_FOLDER}' to '${STOW_TARGET}'..."
    stow -d $STOW_FOLDER_PREFIX -t $STOW_TARGET -S $STOW_FOLDER
}
