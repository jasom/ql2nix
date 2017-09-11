
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_asteroids-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/asteroids/2016-04-21/asteroids-20160421-git.tgz";
        sha256 = "b3283b99443f85892510dc6b5544716da8b70125cdb3e47793f17386198db688";
      };
    }
