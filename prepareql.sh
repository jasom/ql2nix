#!/bin/sh
set -xe
runSbcl() {
    sbcl --noinform --disable-ldb --lose-on-corruption --disable-debugger \
        --no-sysinit --no-userinit --noprint \
        "$@" --eval '(uiop:quit 0)'
}

if ! test -f localql/setup.lisp; then
    runSbcl --load quicklisp.lisp \
        --eval '(quicklisp-quickstart:install  :path "./localql/")'
    awk -f releases2sha.awk localql/dists/quicklisp/releases.txt > releases.txt
    mv releases.txt localql/dists/quicklisp/releases.txt
    runSbcl --load "localql/setup.lisp" \
        --eval '(ql-cdb:convert-index-file "localql/dists/quicklisp/releases.txt")'
fi
