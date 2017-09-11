
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-neo4j-release-b8ad637a-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-neo4j/2013-01-28/cl-neo4j-release-b8ad637a-git.tgz";
        sha256 = "225dbe57c7f4d3938e4d5b94586ebdeb33bb4f441c31c1c8162d4372c0eb452e";
      };
    }
