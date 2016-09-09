
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf   ];
      inherit stdenv;
      lisp_name = "sbcl-trivial-garbage";
      LD_LIBRARY_PATH = "";
      systemName = "trivial-garbage";
      lisp_dependencies = "";
      name = "trivial-garbage-20150113-git";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-garbage/2015-01-13/trivial-garbage-20150113-git.tgz";
        md5 = "59153568703eed631e53092ab67f935e";
      };
    }
