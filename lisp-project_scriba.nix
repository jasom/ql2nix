
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_scriba-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/scriba/2015-12-18/scriba-20151218-git.tgz";
        sha256 = "14e189ca7144cba77551f56fa7613642d59555d349d1723295a4bc97e68d24d9";
      };
    }
