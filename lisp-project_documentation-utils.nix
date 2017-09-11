
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_documentation-utils-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/documentation-utils/2017-06-30/documentation-utils-20170630-git.tgz";
        sha256 = "7aae7552220238286cf1b09b6693c36aadf853cf92357706453b834d69c9e347";
      };
    }
