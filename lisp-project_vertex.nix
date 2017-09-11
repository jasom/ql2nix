
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_vertex-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/vertex/2015-06-08/vertex-20150608-git.tgz";
        sha256 = "d1b2bf4e0dc6cc4495f6d3e47b6f0381a29c05f481fefcffca61d30b87005e98";
      };
    }
