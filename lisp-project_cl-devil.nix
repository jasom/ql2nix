
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-devil-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-devil/2015-03-02/cl-devil-20150302-git.tgz";
        sha256 = "270cdfe3d1ecf1be9a1885261132ba0200fd182dcdd8f66323024e848e58a457";
      };
    }
