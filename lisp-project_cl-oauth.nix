
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-oauth-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-oauth/2015-08-04/cl-oauth-20150804-git.tgz";
        sha256 = "2d8013ca32f054a45e74371d718976b4f07ca49d3cbf169edc4d4e80201cf28e";
      };
    }
