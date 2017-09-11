
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_unit-formula-20110418-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/unit-formula/2011-04-18/unit-formula-20110418-git.tgz";
        sha256 = "44087a8dce3ff2adaa44b86256b183ff72d02d126ae1a6659533db1b25107ece";
      };
    }
