
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_modularize-interfaces-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/modularize-interfaces/2017-08-30/modularize-interfaces-20170830-git.tgz";
        sha256 = "fb8589fd225fe818c13f2d305eb547d7db2e7fddc4fa7594a34447101ccfed37";
      };
    }
