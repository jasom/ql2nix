
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_quickproject-1.2.2";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/quickproject/2014-11-06/quickproject-1.2.2.tgz";
        sha256 = "88916e47a5e29bbbf95d91fbd6f1da40849d82aebcfe128c9440d4c23abd52e9";
      };
    }
