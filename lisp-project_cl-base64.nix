
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-base64-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-base64/2015-09-23/cl-base64-20150923-git.tgz";
        sha256 = "17fab703f316d232b477bd2f8b521283cc0c7410f9b787544f3924007ab95141";
      };
    }
