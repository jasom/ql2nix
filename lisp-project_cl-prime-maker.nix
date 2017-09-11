
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-prime-maker-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-prime-maker/2015-03-02/cl-prime-maker-20150302-git.tgz";
        sha256 = "5936a1afd719e8a8759238637bb6f117881e5b3475e1a3dcc6ab88f6e718a10f";
      };
    }
