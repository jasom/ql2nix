
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-cognito-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-cognito/2017-08-30/cl-cognito-20170830-git.tgz";
        sha256 = "b21b841c22baa78efcd793ddfd42023643b3679072ca440bf7de94d18774b8c4";
      };
    }
