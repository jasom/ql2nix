source $stdenv/setup

buildPhase() {
    mkdir -p "$out/common-lisp/source"
}

installPhase() {
    cp -a ./* "$out/common-lisp/source/"
}

genericBuild
