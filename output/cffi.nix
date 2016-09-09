
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, lisp-alexandria, lisp-babel, lisp-trivial-features, lisp-uiop, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf lisp-alexandria lisp-babel lisp-trivial-features lisp-uiop  ];
      inherit stdenv;
      lisp_name = "sbcl-cffi";
      LD_LIBRARY_PATH = "";
      systemName = "cffi";
      lisp_dependencies = "${lisp-alexandria} ${lisp-babel} ${lisp-trivial-features} ${lisp-uiop}";
      name = "cffi_0.17.1";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cffi/2016-03-18/cffi_0.17.1.tgz";
        md5 = "6e68f1957799e257481abaac3b3932cc";
      };
    }
