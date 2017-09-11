
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_generic-sequences-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/generic-sequences/2015-07-09/generic-sequences-20150709-git.tgz";
        sha256 = "695aeb4458531108fff02af2a73bd5bda4b0aec0572da20dcfb696d2db03e718";
      };
    }
