
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ceramic-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ceramic/2016-08-25/ceramic-20160825-git.tgz";
        sha256 = "bb413bb97b7fc47c8e88ac64d1810d98e28a228563b694efcfba1c5c53010251";
      };
    }
