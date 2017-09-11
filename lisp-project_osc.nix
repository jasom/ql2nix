
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_osc-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/osc/2015-09-23/osc-20150923-git.tgz";
        sha256 = "901c9dfcb207711a8c711d509cf339670d8956e1dd5c11505b0f0b5f76c45189";
      };
    }
