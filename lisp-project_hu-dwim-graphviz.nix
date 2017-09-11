
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-graphviz-20161031-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.graphviz/2016-10-31/hu.dwim.graphviz-20161031-darcs.tgz";
        sha256 = "4a3743bf4a6a030952027a3625511be1c2fcb0836d093db7ef4a680d24fcb519";
      };
    }
