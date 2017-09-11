
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-modlisp-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-modlisp/2015-09-23/cl-modlisp-20150923-git.tgz";
        sha256 = "46d039f4e48090f2d6e65df8e97b3651d2662f9b29fc85d5045032ab351d808a";
      };
    }
