
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_amazon-ecs-20110418-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/amazon-ecs/2011-04-18/amazon-ecs-20110418-git.tgz";
        sha256 = "d8707ca5d66bf24c036a7564e26a7dd683d4b42712be1e4e48d251b1c87be51b";
      };
    }
