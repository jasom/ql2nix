
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-reexport-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-reexport/2015-07-09/cl-reexport-20150709-git.tgz";
        sha256 = "b1b68aaa2d325da92993de2b3a06ac9c373983367cffba32a11cbca3afa7d8f8";
      };
    }
