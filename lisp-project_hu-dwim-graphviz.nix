
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-graphviz-20170830-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.graphviz/2017-08-30/hu.dwim.graphviz-20170830-darcs.tgz";
        sha256 = "6cae94c9a952a6847e98a234e0aa77e1c5cb62f26abdc42fe734799cc84e4005";
      };
    }
