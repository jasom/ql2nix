
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_paren-util-20110418-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/paren-util/2011-04-18/paren-util-20110418-git.tgz";
        sha256 = "333c123915737289e01290b9482ba385f316fcad759a00ed15b59022bc352298";
      };
    }
