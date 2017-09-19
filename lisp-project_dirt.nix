
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dirt-release-quicklisp-1dd9d89e-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dirt/2017-08-30/dirt-release-quicklisp-1dd9d89e-git.tgz";
        sha256 = "01f85533bc59398774ee1caabefdd1afa7e46bfd02373addf72554b96c1c44d2";
      };
    }
