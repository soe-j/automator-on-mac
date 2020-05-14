#!/bin/zsh

set -eu

for INPUT in "$@"
do
    SHARE="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Share/${INPUT##$HOME/}"

    if [ -e "$SHARE" ]
    then
        echo "already exists : $SHARE" >&2
    else
        mkdir -p "$(dirname "$SHARE")"
        cp -r "$INPUT" "$SHARE"
        rm -rf "$INPUT"
        ln -s "$SHARE" "$INPUT"
        echo "sync : $SHARE"
    fi
done
