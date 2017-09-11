
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_planks-20110522-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/planks/2011-05-22/planks-20110522-git.tgz";
        sha256 = "af3af95c8c5289974a51b46c230b9c800873d7b61a2e5ab9de4afc37ec8d743b";
      };
    }
