
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_optima-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/optima/2015-07-09/optima-20150709-git.tgz";
        sha256 = "acc12418bedcf6de1ff8da0785a4cad3e76d2c17343d2a85e21835d16dc61e6f";
      };
    }
