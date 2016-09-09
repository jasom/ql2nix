
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf   ];
      inherit stdenv;
      lisp_name = "sbcl-split-sequence";
      LD_LIBRARY_PATH = "";
      systemName = "split-sequence";
      lisp_dependencies = "";
      name = "split-sequence-1.2";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/split-sequence/2015-08-04/split-sequence-1.2.tgz";
        md5 = "194e24d60f0fba70a059633960052e21";
      };
    }
