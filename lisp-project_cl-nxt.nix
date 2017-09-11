
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-nxt-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-nxt/2015-06-08/cl-nxt-20150608-git.tgz";
        sha256 = "c1ef583a2e0ddbf3980699fc40252b4c69f3b3dc5a525b2be13a7b9d7543c6ce";
      };
    }
