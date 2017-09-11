
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parseq-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parseq/2017-07-25/parseq-20170725-git.tgz";
        sha256 = "6d1402d81e4f1b379c0f2d01cb03602d457d53301e9f7489fa66bd273452e685";
      };
    }
