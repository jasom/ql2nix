
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, lisp-trivial-features, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf lisp-trivial-features  ];
      inherit stdenv;
      lisp_name = "sbcl-swap-bytes";
      LD_LIBRARY_PATH = "";
      systemName = "swap-bytes";
      lisp_dependencies = "${lisp-trivial-features}";
      name = "swap-bytes-20151218-git";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/swap-bytes/2015-12-18/swap-bytes-20151218-git.tgz";
        md5 = "2d7ee8e7f1a966bd8a853388f6e7fde5";
      };
    }
