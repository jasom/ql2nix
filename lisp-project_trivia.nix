
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivia-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivia/2017-08-30/trivia-20170830-git.tgz";
        sha256 = "7f7168e80979b856c7395f9819b9ce48b8f56f88d21c3fb5db31b29592e26e71";
      };
    }
