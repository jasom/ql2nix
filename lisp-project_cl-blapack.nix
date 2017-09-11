
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-blapack-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-blapack/2014-07-13/cl-blapack-20140713-git.tgz";
        sha256 = "25debdf77b3c3018004c50e158f8a4d4f45dc636ad994d21ab133a7bf6ec047d";
      };
    }
