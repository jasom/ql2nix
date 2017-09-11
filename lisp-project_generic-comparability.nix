
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_generic-comparability-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/generic-comparability/2015-05-05/generic-comparability-20150505-git.tgz";
        sha256 = "cf630298d5d82950ae256a3079dcd64466e530ed2b11ef6090752bceb094dab6";
      };
    }
