
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_black-tie-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/black-tie/2015-08-04/black-tie-20150804-git.tgz";
        sha256 = "aa67249dd4d87ca1fc1f1c746934b79a6433fffbe7c177aeb765ebac949b9cc7";
      };
    }
