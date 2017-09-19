
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-dbi-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-dbi/2017-08-30/cl-dbi-20170830-git.tgz";
        sha256 = "b35d60e2a08aba85f8a013421431b0c279ebb624ae669de6cae5d348dc9e4041";
      };
    }
