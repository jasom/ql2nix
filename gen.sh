if ! ./ql2nix.lisp "$1" > "output/$1.nix"; then
    rm "output/$1.nix"
    exit 1
fi
head -n 10 output/default.nix >newoutput
printf '%s = callPackage ./%s.nix { };\n\n' "$1" "$1" >>newoutput
tail -n +11 output/default.nix >>newoutput
cp newoutput output/default.nix
