
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-readline-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-readline/2017-06-30/cl-readline-20170630-git.tgz";
        sha256 = "620b5c1d84d878a41a4511b56e70dbfffad12b48f64a84ed5d6884de97ee3b7d";
      };
    }
