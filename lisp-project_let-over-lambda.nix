
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_let-over-lambda-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/let-over-lambda/2015-09-23/let-over-lambda-20150923-git.tgz";
        sha256 = "4c2077345d99cf0a24895ca11d9b9ec20dfae784c726ef3f5430d34f9abcf043";
      };
    }
