
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_deflate-20131211-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/deflate/2013-12-11/deflate-20131211-git.tgz";
        sha256 = "29f897c8d5e1f50cd2e74dc31646f7f648898e2910aebbf4c822dea446d69887";
      };
    }
