
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_weblocks-tree-widget-20141217-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/weblocks-tree-widget/2014-12-17/weblocks-tree-widget-20141217-git.tgz";
        sha256 = "4bf8df57c062462c1403a80c12bb975188ec654378b944fcb9aaf5133c48412c";
      };
    }
