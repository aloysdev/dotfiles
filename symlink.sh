#!/bin/bash

target_arg="$1"

if [ -z "$target_arg" ]; then
    echo "Missing target directory for symlink." >&2
    exit 1
elif [[ "$target_arg" =~ ^\/.* ]] || [[ "$target_arg" =~ ^\.\/.* ]]; then
    echo "Target directory must be a relative path without starting with \"./\"." >&2
    exit 1
elif [ ! -d "$target_arg" ]; then
    echo "Target directory \"${target_arg}\" does not exists." >&2
    exit 1
fi

dotfiles=$(pwd)
home="/home/${USER}"

function rlink {
    local target="${1}"

    if [ -d "$target" ]; then
        # If the target is a directory, apply recursively link to each file inside
        for file in $(ls -a "$target");
        do
            if [ "$file" != '.' ] && [ "$file" != '..' ]; then
                rlink "${target}/${file}"
            fi
        done
    elif [ -f "$target" ]; then
        local clean_target="${target/"${dotfiles}/${target_arg}/"/""}"
        local link="${home}/${clean_target}"

        mkdir -p "$(dirname "$link")"
        ln -f -s "$target" "$link"
    fi
}

rlink "${dotfiles}/${target_arg}"