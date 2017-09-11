
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_grovel-locally-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/grovel-locally/2017-02-27/grovel-locally-20170227-git.tgz";
        sha256 = "c51d7a3a130d281c380a3a9f0e49daf0f95d329c2c5ea386439c7f9af20b6032";
      };
    }
