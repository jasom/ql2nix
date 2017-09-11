
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sentiment-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sentiment/2013-01-28/cl-sentiment-20130128-git.tgz";
        sha256 = "6a38d68b8b500c8c4bd831d7c1d6421446a2f45aba544f1e9422f84115da5ef5";
      };
    }
