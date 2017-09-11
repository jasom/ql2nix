
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-soil-release-quicklisp-69e1213c-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-soil/2017-06-30/cl-soil-release-quicklisp-69e1213c-git.tgz";
        sha256 = "e4a478cba695043ac9b51678dbdd6d63bea84d91c7f02900daf721f3211cea2a";
      };
    }
