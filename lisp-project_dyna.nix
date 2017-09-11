
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dyna-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dyna/2017-06-30/dyna-20170630-git.tgz";
        sha256 = "0029cc3c33ef9a0f7fa074c08d6813fd3335009556222ebf9a7c72d2f5b415d1";
      };
    }
