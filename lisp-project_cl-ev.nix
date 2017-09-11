
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ev-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ev/2015-09-23/cl-ev-20150923-git.tgz";
        sha256 = "0a8378006542a24b3e77f73247e45531c5813cb6cfdc3ca5350a9fb4b618d455";
      };
    }
