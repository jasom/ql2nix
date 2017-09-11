
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-strings-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-strings/2016-10-31/cl-strings-20161031-git.tgz";
        sha256 = "9baa67fa9b3ba90a5eb839d7dfffba04184468d5f9233b8d77bc1912f03780bb";
      };
    }
