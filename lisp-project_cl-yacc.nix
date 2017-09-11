
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-yacc-20101006-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-yacc/2010-10-06/cl-yacc-20101006-darcs.tgz";
        sha256 = "e7ca1cbf28512f7ed42aa747f28d5b823cf1837eaf43cb30549edcac00ddd533";
      };
    }
