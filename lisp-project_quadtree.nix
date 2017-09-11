
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_quadtree-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/quadtree/2015-07-09/quadtree-20150709-git.tgz";
        sha256 = "9bf87307444c2dbce9d7532d85c5f010875cdc48809f2a9bf59fa07b34385611";
      };
    }
