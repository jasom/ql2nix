
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clip-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clip/2017-06-30/clip-20170630-git.tgz";
        sha256 = "a649310913de1db5cc037fe32406f98d9ffa0e56ae0b35b0ae5610dda35b439b";
      };
    }
