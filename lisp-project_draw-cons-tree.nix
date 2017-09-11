
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_draw-cons-tree-20131003-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/draw-cons-tree/2013-10-03/draw-cons-tree-20131003-git.tgz";
        sha256 = "9f8fc7664391a03f3c3c1e31500ead4addb2e354d03abcdbaae368ea5a3dc12c";
      };
    }
