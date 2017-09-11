
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_place-utils-0.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/place-utils/2012-09-09/place-utils-0.1.tgz";
        sha256 = "13bb00e515828a3b40fd2de100ce2571dc2c83681ba37ffcfdba3f41d4cf347d";
      };
    }
