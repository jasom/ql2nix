
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xlunit-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xlunit/2015-09-23/xlunit-20150923-git.tgz";
        sha256 = "7b63ccce7aa5d8ef5d996879d1ef8e13cafab189fca0359da1b61ba684d1e136";
      };
    }
