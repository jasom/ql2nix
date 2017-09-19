
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_drakma-v2.0.4";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/drakma/2017-08-30/drakma-v2.0.4.tgz";
        sha256 = "ea15c928676c94c484b9c8a093adde274a0d2d439c23871c60be10b102af0d44";
      };
    }
