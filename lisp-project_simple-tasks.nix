
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_simple-tasks-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/simple-tasks/2017-08-30/simple-tasks-20170830-git.tgz";
        sha256 = "4c01c45fc087736288dc9adfa433a95970382a0b282b15cd2e4f59efb8cfc39a";
      };
    }
