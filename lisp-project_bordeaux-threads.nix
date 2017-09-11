
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_bordeaux-threads-v0.8.5";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/bordeaux-threads/2016-03-18/bordeaux-threads-v0.8.5.tgz";
        sha256 = "edaedd450d9267b0a578c9da421fdc96e5f93b119d1502abb1d428e646eb0127";
      };
    }
