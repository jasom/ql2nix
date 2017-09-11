
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_recursive-restart-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/recursive-restart/2016-10-31/recursive-restart-20161031-git.tgz";
        sha256 = "26703bce24e579fca3b5924cf7faf6ba4251c054bd85bfb4ac11008049fbc44d";
      };
    }
