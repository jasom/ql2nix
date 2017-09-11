
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-fixtures-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-fixtures/2017-06-30/cl-fixtures-20170630-git.tgz";
        sha256 = "7128adf10704df93dbbc046f881a9b4153efebf38f724ae3f9b0abf78b5718ec";
      };
    }
