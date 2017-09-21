
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hyperluminal-mem-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hyperluminal-mem/2016-12-04/hyperluminal-mem-20161204-git.tgz";
        sha256 = "a7529356fff0c7cf294e328ee6feaf15cfe1ace8abf5288679a183619e857fb4";
      };
    }
