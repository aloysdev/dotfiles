#!/bin/bash

target="$1"
link="$2"

if [ -z "$target" ]; then
    echo "Missing target argument for symlink." >&2
    exit 1
elif [ -z "$link" ]; then
    echo "Missing link argument for symlink." >&2
    exit 1
fi


mkdir -p "$(dirname "$link")"
ln -fs "$target" "$link"
