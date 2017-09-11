
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_paren-files-20110418-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/paren-files/2011-04-18/paren-files-20110418-git.tgz";
        sha256 = "cb291d113df44a7b1b42304fd45750764cc36895d554dc8d728f76d26a3aa87f";
      };
    }
