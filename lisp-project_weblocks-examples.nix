
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_weblocks-examples-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/weblocks-examples/2017-04-03/weblocks-examples-20170403-git.tgz";
        sha256 = "0e972c880652cc1fca67fea582d492cc436f8a3f8285f7aea2599380f803400f";
      };
    }
