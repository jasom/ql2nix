
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-haml-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-haml/2017-06-30/cl-haml-20170630-git.tgz";
        sha256 = "01d8e66fe4d64f85672da6a97d7d54b9e5caa74ba24ba56a82d6c4a69e37e4a1";
      };
    }
