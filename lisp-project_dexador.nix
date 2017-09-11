
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dexador-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dexador/2017-07-25/dexador-20170725-git.tgz";
        sha256 = "d4d7866bbb73d37eb192daa73bd7d555bc26d61fee7b4978cb87ede60fe0b2f4";
      };
    }
