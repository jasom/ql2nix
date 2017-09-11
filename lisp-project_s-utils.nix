
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_s-utils-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/s-utils/2013-01-28/s-utils-20130128-git.tgz";
        sha256 = "d32dbc3c54042c3fc6eca8edba3fc8619c6f97f6ab6e67912caafb1e2f6ed951";
      };
    }
