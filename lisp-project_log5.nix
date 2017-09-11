
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_log5-20110619-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/log5/2011-06-19/log5-20110619-git.tgz";
        sha256 = "210a3bed748a4932e5c83f653311abbb2db80643634b89f8237b6571e71e7a4a";
      };
    }
