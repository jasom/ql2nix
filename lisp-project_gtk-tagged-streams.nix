
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gtk-tagged-streams-quicklisp-d1c2b827-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gtk-tagged-streams/2017-06-30/gtk-tagged-streams-quicklisp-d1c2b827-git.tgz";
        sha256 = "6a0b826178c7b46bd6c1b208b4a850a2fc5379d60e48784a2eb47b23b3825fd0";
      };
    }
