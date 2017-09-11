
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parenscript-classic-20111203-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parenscript-classic/2011-12-03/parenscript-classic-20111203-darcs.tgz";
        sha256 = "604d7664172133dbdd5cd0da57d7e702406d83d997bdd0c6908b05486139a577";
      };
    }
