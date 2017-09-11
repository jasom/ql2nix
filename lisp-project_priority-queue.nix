
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_priority-queue-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/priority-queue/2015-07-09/priority-queue-20150709-git.tgz";
        sha256 = "6370d097db6412e62eeb67549cea93e6f2209a48fb903c43775f6754527d2799";
      };
    }
