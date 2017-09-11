
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-creditcard-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-creditcard/2015-01-13/cl-creditcard-20150113-git.tgz";
        sha256 = "3ed34b65da5fe60d9144857165b990181c190e5f341b3c7b8d458bf0989c92c7";
      };
    }
