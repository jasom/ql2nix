
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-simple-table-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-simple-table/2013-03-12/cl-simple-table-20130312-git.tgz";
        sha256 = "544cdb691be44ff91ea3d93ceff3c9d95bddbe040af66980e68ea9581c2060b7";
      };
    }
