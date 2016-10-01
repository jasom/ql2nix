#!/bin/sh
set -e
NAME="$(./ql2nix.lisp "$1" "output/pkgs/")"
if test -z "$NAME"; then exit 1; fi
echo "$NAME" >&2
head -n 10 output/default.nix >newoutput
printf '    %s = callPackage ./pkgs/%s.nix { };\n\n' "$NAME" "$NAME" >>newoutput
tail -n +11 output/default.nix >>newoutput
cp newoutput output/default.nix
