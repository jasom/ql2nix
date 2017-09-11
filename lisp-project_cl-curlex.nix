
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-curlex-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-curlex/2015-09-23/cl-curlex-20150923-git.tgz";
        sha256 = "9002a3be27031210476befa485af17e679318abb0d2a2c94a38122c2ea8a7b8e";
      };
    }
