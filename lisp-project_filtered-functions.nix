
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_filtered-functions-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/filtered-functions/2016-03-18/filtered-functions-20160318-git.tgz";
        sha256 = "badc5074c04aaaedb9166fa08cc35762def70bd26b4fe963ec448001a326b2af";
      };
    }
