
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_image-20120107-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/image/2012-01-07/image-20120107-git.tgz";
        sha256 = "88e32a07c7a7539b2517e14e9099eb4006742299977c480499a3755b485a4a4d";
      };
    }
