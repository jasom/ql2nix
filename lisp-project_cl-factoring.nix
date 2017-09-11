
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-factoring-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-factoring/2015-06-08/cl-factoring-20150608-git.tgz";
        sha256 = "54bc874b60f40d5a7c33f331f74f0ebc9b0e105e22e9d57393327f522b45ec7b";
      };
    }
