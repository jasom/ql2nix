
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mixalot-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mixalot/2015-12-18/mixalot-20151218-git.tgz";
        sha256 = "7ec64e38e624273bc63eb65e8db6cd39528dd367f57922bb216fbbafb88efabf";
      };
    }
