
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-libuv-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-libuv/2016-08-25/cl-libuv-20160825-git.tgz";
        sha256 = "b9a432d60c1e44842a845e0637a6df606b196d5aff2d2dd37d7df59be04d710b";
      };
    }
