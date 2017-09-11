
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_random-state-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/random-state/2017-06-30/random-state-20170630-git.tgz";
        sha256 = "5dba3b7cb812a858001d9d5c04a901c0bc19b03cc04da75a170a1b99c1026968";
      };
    }
