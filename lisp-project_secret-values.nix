
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_secret-values-20140211-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/secret-values/2014-02-11/secret-values-20140211-git.tgz";
        sha256 = "598ad66ab5f6101394c11b85ee6aa02a6ab4fb31de0ee09f55756b3ee308852b";
      };
    }
