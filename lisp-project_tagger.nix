
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_tagger-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/tagger/2015-09-23/tagger-20150923-git.tgz";
        sha256 = "9414f6b86f07e063b5bd9405c414d76de95e5eb03f5d054a20ab25bf071c6ee8";
      };
    }
