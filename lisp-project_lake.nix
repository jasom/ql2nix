
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lake-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lake/2017-08-30/lake-20170830-git.tgz";
        sha256 = "9eb6536fac5649947f8b37990fd6786e0cd229d4fc3bd04d1be8f83d6c077aff";
      };
    }
