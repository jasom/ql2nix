
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_glass-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/glass/2015-07-09/glass-20150709-git.tgz";
        sha256 = "152059532e3b1c9cd8493558d35853a78539b386cee7c0c4b937ceacc2e156b7";
      };
    }
