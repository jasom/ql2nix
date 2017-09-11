
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_skitter-release-quicklisp-dd15a0b5-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/skitter/2017-06-30/skitter-release-quicklisp-dd15a0b5-git.tgz";
        sha256 = "e7ea0653279f1030bf44d75629fd9b9ef8001664c9693cb1f9f7dd4e7bc94e97";
      };
    }
