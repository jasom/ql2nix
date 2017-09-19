
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_jenkins-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/jenkins/2013-03-12/jenkins-20130312-git.tgz";
        sha256 = "36ffc0afa03c2d6cf766f4f7e9a4c81691d9b6d799d0b820c76b5026f1eb4873";
      };
    }
