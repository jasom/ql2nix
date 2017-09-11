
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-tuples-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-tuples/2014-07-13/cl-tuples-20140713-git.tgz";
        sha256 = "6d735a24a89c0cadf1fc15b12132998b7a6d5b9a5ca743b0ef3fe1c7a8af84ef";
      };
    }
