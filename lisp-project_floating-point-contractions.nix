
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_floating-point-contractions-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/floating-point-contractions/2016-06-28/floating-point-contractions-20160628-git.tgz";
        sha256 = "4f5822a3bfc603af40fae32765a44bfa4a7ffaaf14a9392a4c2892451505cb21";
      };
    }
