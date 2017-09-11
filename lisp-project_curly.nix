
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_curly-20120407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/curly/2012-04-07/curly-20120407-git.tgz";
        sha256 = "60274fd53e59ad6221ec4a0f758a7b285d63d62f0dd5b159a65ed46d3b84b1da";
      };
    }
