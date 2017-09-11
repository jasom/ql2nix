
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-iterative-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-iterative/2016-03-18/cl-iterative-20160318-git.tgz";
        sha256 = "f0e4688c1948d877e03b26ae864ab88d205eb9e308a0c8896e35f0824a6d01b2";
      };
    }
