
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_genhash-20141217-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/genhash/2014-12-17/genhash-20141217-git.tgz";
        sha256 = "315c3c70d68f437fc3f616ddc69e2790603d34c0c7bbca7818c4a63cae780ad4";
      };
    }
