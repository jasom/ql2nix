
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_monkeylib-utilities-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/monkeylib-utilities/2017-04-03/monkeylib-utilities-20170403-git.tgz";
        sha256 = "b0b73e824156dfdf1cb7a40128b322189a8bc3b47c6c3825ff9507bf10abd893";
      };
    }
