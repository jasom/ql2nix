
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_periods-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/periods/2016-03-18/periods-20160318-git.tgz";
        sha256 = "2ebbac556c20579f0ab76c8d9e9a941f73b33458f46eda64a417257e5d3317d1";
      };
    }
