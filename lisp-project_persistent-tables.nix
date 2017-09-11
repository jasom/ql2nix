
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_persistent-tables-20120208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/persistent-tables/2012-02-08/persistent-tables-20120208-git.tgz";
        sha256 = "eb0d357b798d9cae1d7f549c2b30222e9e8bff5d943c086d204edbe3e8b8fe4b";
      };
    }
