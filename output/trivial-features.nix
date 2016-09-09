
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf   ];
      inherit stdenv;
      lisp_name = "sbcl-trivial-features";
      LD_LIBRARY_PATH = "";
      systemName = "trivial-features";
      lisp_dependencies = "";
      name = "trivial-features-20150923-git";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-features/2015-09-23/trivial-features-20150923-git.tgz";
        md5 = "84246128492cf3457cc1901547aa2a10";
      };
    }
