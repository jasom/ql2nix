
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_calispel-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/calispel/2015-10-31/calispel-20151031-git.tgz";
        sha256 = "83945c12caeadb41786570b6bcb892424ab2ef310b6805aeb9ab0248d7f2ca00";
      };
    }
