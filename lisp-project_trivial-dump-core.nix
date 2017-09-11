
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-dump-core-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-dump-core/2017-02-27/trivial-dump-core-20170227-git.tgz";
        sha256 = "3ab22966d0d4314a5859ada6152d3ea3f2f08bf83477573c0055307cfa0038ab";
      };
    }
