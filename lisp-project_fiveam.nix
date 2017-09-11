
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fiveam-v1.3";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fiveam/2016-08-25/fiveam-v1.3.tgz";
        sha256 = "028341fb9f086e49303da6a81e3e1caef68f8a0588db3c582d2bf6f0e8a0b231";
      };
    }
