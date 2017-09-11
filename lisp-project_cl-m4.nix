
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-m4-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-m4/2013-03-12/cl-m4-20130312-git.tgz";
        sha256 = "32b653d0c81e0bbfae667196fa63b39ee1fa2e0a66660d8f132c80b687f8f69b";
      };
    }
