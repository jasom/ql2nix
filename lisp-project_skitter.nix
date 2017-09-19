
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_skitter-release-quicklisp-da731855-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/skitter/2017-08-30/skitter-release-quicklisp-da731855-git.tgz";
        sha256 = "27bd4799acaf1717987c3fa5d44939d5013e10cbc4ac6754b08b9adf5d964e69";
      };
    }
