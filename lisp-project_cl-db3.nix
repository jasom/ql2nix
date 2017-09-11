
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-db3-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-db3/2015-03-02/cl-db3-20150302-git.tgz";
        sha256 = "b1ffd5c0d0e3eca1a505e20e0c4e888a2ec87f37faa9f1fc62adefc6ceba8d57";
      };
    }
