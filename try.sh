#!/bin/sh
if nix-build output 2> stderr.out; then
    echo "Success"
else
    {
        tail -n100 stderr.out > tail.out
        read
        while test "" != "$REPLY"; do
            if grep -q "$REPLY" tail.out; then
                read
                printf '%s %s\n' "$1" "$REPLY" >> extradeps.txt
                printf '%s added to deps of %s\n' "$REPLY" "$1" >&2
                exit 1
            fi
            read # Consume unused line
            read # prep for next entry
        done
    } < fixupdb.txt
    exit 2
fi
