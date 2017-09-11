
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_marshal-20130720-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/marshal/2013-07-20/marshal-20130720-git.tgz";
        sha256 = "1b456010248045adbdadb972b8fcf467c9a0e50a70a430bb941658edc9aefdb2";
      };
    }
