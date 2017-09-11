
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cells-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cells/2016-12-04/cells-20161204-git.tgz";
        sha256 = "591066de0c21472c8b7ce6b62228c3b95b1228a6d4b317fabb0eb4347f801db7";
      };
    }
