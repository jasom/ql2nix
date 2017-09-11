
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_simple-tasks-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/simple-tasks/2017-06-30/simple-tasks-20170630-git.tgz";
        sha256 = "59c0a2859c738d72952f40fec8004b2a3f1d0ddb583f29c882b31085099b57dd";
      };
    }
