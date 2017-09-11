
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_simple-date-time-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/simple-date-time/2016-04-21/simple-date-time-20160421-git.tgz";
        sha256 = "90c4d18810d57c4f00e4e39d456d868fec736950492011fe9f78f6abefb169b5";
      };
    }
