
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-cron-20150608-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-cron/2015-06-08/cl-cron-20150608-hg.tgz";
        sha256 = "42a0fb41ac87d1d1689dfdf6b2ac1dacd08007c6432315ed8f2bd6b08ccfa886";
      };
    }
