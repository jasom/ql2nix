
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dissect-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dissect/2017-06-30/dissect-20170630-git.tgz";
        sha256 = "bd7b5520ddd59fe2a67929bad3f2a2e264ce468681bc18bda810ba216ac64401";
      };
    }
