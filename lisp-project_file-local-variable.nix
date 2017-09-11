
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_file-local-variable-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/file-local-variable/2016-03-18/file-local-variable-20160318-git.tgz";
        sha256 = "a975e09084862dc93bfb7866470dc0cdc568675ffef74f38b68d8c25a3d55668";
      };
    }
