#!/bin/sh
SYSTEM_NAME="$1"
CLEAN_QUICKLISP="$PWD/qlclean"

set -e

usage() {
    printf '%s SYSTEM_NAME:
    Computes dependencies of SYSTEM_NAME using quicklisp
' \
    "$(basename "$0")"
}

if test -z "$SYSTEM_NAME"; then
    usage
    exit 1
fi

if ! test -e "$CLEAN_QUICKLISP/setup.lisp"; then
    sbcl --no-sysinit --no-userinit --load quicklisp.lisp <<EOF >&2
    (quicklisp-quickstart:install :path "$CLEAN_QUICKLISP/")
EOF
fi

sbcl --noinform --disable-ldb --lose-on-corruption --disable-debugger --no-sysinit --no-userinit --noprint --load "$CLEAN_QUICKLISP/setup.lisp" --load compute-all-deps.lisp <<EOF
(prepare)
(format t "~{~A~%~}"(compute-all-deps "$SYSTEM_NAME"))
EOF
