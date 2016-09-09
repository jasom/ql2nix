
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, lisp-alexandria, lisp-babel, lisp-bordeaux-threads, lisp-cffi, lisp-idna, lisp-split-sequence, lisp-swap-bytes, lisp-trivial-features, lisp-uiop, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf lisp-alexandria lisp-babel lisp-bordeaux-threads lisp-cffi lisp-idna lisp-split-sequence lisp-swap-bytes lisp-trivial-features lisp-uiop  ];
      inherit stdenv;
      lisp_name = "sbcl-iolib";
      LD_LIBRARY_PATH = "";
      systemName = "iolib";
      lisp_dependencies = "${lisp-alexandria} ${lisp-babel} ${lisp-bordeaux-threads} ${lisp-cffi} ${lisp-idna} ${lisp-split-sequence} ${lisp-swap-bytes} ${lisp-trivial-features} ${lisp-uiop}";
      name = "iolib-v0.8.1";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/iolib/2016-03-18/iolib-v0.8.1.tgz";
        md5 = "cd34c4f7db4af7391757ebc3f4f61422";
      };
    }
