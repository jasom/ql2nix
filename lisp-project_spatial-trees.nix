
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_spatial-trees-20140826-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/spatial-trees/2014-08-26/spatial-trees-20140826-git.tgz";
        sha256 = "422f3f4b239702cbecbc3f88f23aef26ab7b387c4198f4f0dc458bba99793c8f";
      };
    }
