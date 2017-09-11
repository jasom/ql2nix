
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sb-cga-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sb-cga/2015-07-09/sb-cga-20150709-git.tgz";
        sha256 = "866fe8c0df8c5cead91f549ec561fd6cd5f856e27ae8d26a619e170f05977a4a";
      };
    }
