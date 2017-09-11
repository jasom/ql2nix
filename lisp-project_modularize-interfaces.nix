
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_modularize-interfaces-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/modularize-interfaces/2017-06-30/modularize-interfaces-20170630-git.tgz";
        sha256 = "36a5979218679f4db29b8920faed058a3d02ed0c5fbf6911c995e82907927a31";
      };
    }
