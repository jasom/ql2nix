
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_zpng-1.2.2";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/zpng/2015-04-07/zpng-1.2.2.tgz";
        sha256 = "3d70a1579930f98655bf56d6cf390ac19a1b076b7bbd807ea82b32cb137e6224";
      };
    }
