function stow_util() {
    STOW_TARGET=$1
    STOW_FOLDER_PREFIX=$2
    STOW_FOLDER=$3

    setopt null_glob

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

    setopt no_null_glob

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
    # http://unix.stackexchange.com/questions/26805/how-to-silently-get-an-empty-string-from-a-glob-pattern-with-no-matches
    # http://zsh.sourceforge.net/Doc/Release/Options.html
    setopt null_glob

    for file in $STOW_FOLDER_PREFIX/$STOW_FOLDER/{.,}*
    do
        filename=${file##*/}
        echo $filename
        # Test link before file b/c links will be treated as files as well.
        if [[ -L "$STOW_TARGET/$filename" ]]; then
            echo "Found link '$STOW_TARGET/$filename', will rename it."
            mv $STOW_TARGET/$filename $STOW_TARGET/${filename}.backup_$(date +%F-%T)
        elif [[ -f "$STOW_TARGET/$filename" ]]; then
            echo "Found file '$STOW_TARGET/$filename', will rename it."
            mv $STOW_TARGET/$filename $STOW_TARGET/${filename}.backup_$(date +%F-%T)
        else
            echo "Didn't find file/link '$STOW_TARGET/$filename'."
        fi
    done

    setopt no_null_glob

    if ! [[ -d "$STOW_TARGET" ]]; then
        mkdir -p $STOW_TARGET
    fi

    echo "Going to stow '${STOW_FOLDER}' to '${STOW_TARGET}'..."
    stow -d $STOW_FOLDER_PREFIX -t $STOW_TARGET -S $STOW_FOLDER
}
