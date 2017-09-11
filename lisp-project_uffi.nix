
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_uffi-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/uffi/2017-06-30/uffi-20170630-git.tgz";
        sha256 = "4e9e58283b26f99bac7283bec130194973e90e8a8e06a9de3f2d711df8250ef9";
      };
    }
