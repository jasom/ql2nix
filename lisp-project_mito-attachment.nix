
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mito-attachment-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mito-attachment/2016-03-18/mito-attachment-20160318-git.tgz";
        sha256 = "1ae534b1668bf8d188f35e5bf3341791da32a46e0d592ce7117b6332e1eb3ba0";
      };
    }
