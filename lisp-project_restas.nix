
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_restas-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/restas/2017-01-24/restas-20170124-git.tgz";
        sha256 = "38d2d11335ab8c5f1c52ec6ce7d9ebc8be76834a7db431df42526a9b571ff6c5";
      };
    }
