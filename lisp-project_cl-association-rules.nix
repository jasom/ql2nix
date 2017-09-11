
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-association-rules-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-association-rules/2017-04-03/cl-association-rules-20170403-git.tgz";
        sha256 = "3415e2dab56e7412593e76993329a397539c44efc539672bf9cf05c973c35443";
      };
    }
